#!/usr/bin/env python3
"""Search the Bambuser knowledge base (knowledge.bambuser.com).

Usage: search.py [-n LIMIT] <keywords...>
       search.py login issue          # top 5 matches
       search.py -n 10 RTMP           # top 10

Calls the same search API as the site's search bar and prints only the
fields an answer needs: title, URL, category, snippet.

Exit codes: 0 = success (even with zero matches), 1 = usage error,
2 = network/parse failure — on 2, fall back to fetching
https://knowledge.bambuser.com/search?query=<keywords> directly (see SKILL.md).
"""

import html
import json
import sys
import urllib.parse
import urllib.request

HOST = "https://knowledge.bambuser.com"


def clean(text):
    """Unescape entities and collapse all whitespace (incl. non-breaking)."""
    return " ".join(html.unescape(text or "").split())


def main():
    args = sys.argv[1:]
    limit = 5
    if args and args[0] == "-n":
        try:
            limit = int(args[1])
            args = args[2:]
        except (IndexError, ValueError):
            print(__doc__.strip(), file=sys.stderr)
            return 1
    if not args:
        print(__doc__.strip(), file=sys.stderr)
        return 1

    query = " ".join(args)
    url = HOST + "/search?query=" + urllib.parse.quote(query)
    try:
        with urllib.request.urlopen(url, timeout=30) as resp:
            results = json.load(resp)
    except Exception as exc:
        print(
            "Search request failed: %s\nFall back to fetching %s directly." % (exc, url),
            file=sys.stderr,
        )
        return 2

    articles = [
        q
        for r in results
        if (q := r.get("question"))
        and q.get("is_published")
        and not q.get("is_internal")
        and not q.get("is_private")
    ]

    if not articles:
        print(
            "No results for %r. Matching is per-token — retry with a synonym "
            "or fewer, more distinctive keywords." % query
        )
        return 0

    shown = articles[:limit]
    for q in shown:
        link = urllib.parse.urljoin(HOST, q.get("url", "").split("?")[0])
        print("%s  [%s]" % (clean(q.get("name")), clean(q.get("first_category")) or "-"))
        print(link)
        snippet = clean(q.get("long_answer_sample") or q.get("answer_sample"))
        if snippet:
            print("  " + snippet)
        print()

    if len(articles) > len(shown):
        print(
            "(%d more matches not shown — rerun with -n %d, or refine the query)"
            % (len(articles) - len(shown), len(articles))
        )
    return 0


if __name__ == "__main__":
    sys.exit(main())
