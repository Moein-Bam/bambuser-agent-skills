# SSO (dashboard login)

Single sign-on applies to **dashboard/BamHub login for your team** — it is not shopper-facing. Documented for **Live Shopping, Video Consultation, and Chat** (Shoppable Video shares the Live dashboard; the App Framework has no SSO docs). Supported patterns: **SAML 2.0** via Okta, via Azure AD / Microsoft Entra, or via any custom IdP, plus **Microsoft SSO (OIDC)**.

## The slug asymmetry (the footgun)

The same five SSO pages exist per product, but **the slugs are not symmetric** — guessing a slug from another product's pattern 404s:

| Page | Live | Video Consultation | Chat |
|------|------|--------------------|------|
| Overview | `live/sso-overview.md` | `video-consultation/sso-overview.md` | `chat/sso-overview.md` |
| SAML via Okta | `live/saml-okta.md` | `video-consultation/sso-saml-okta.md` | `chat/sso-saml-okta.md` |
| SAML via Azure | `live/saml-azure.md` | `video-consultation/sso-saml-azure.md` | `chat/sso-saml-azure.md` |
| Custom SAML | `live/custom-saml.md` | `video-consultation/sso-custom-saml.md` | `chat/sso-custom-saml.md` |
| Microsoft SSO | `live/microsoft-sso.md` | `video-consultation/microsoft-sso.md` | `chat/microsoft-sso.md` |

(Base `https://bambuser.com/docs/`. Live drops the `sso-` prefix on the SAML pages; the others keep it. Verify against `llms.txt` if one 404s.)

## Durable concepts

- **Setup is a two-sided exchange**: the customer configures the app in their IdP, then shares the metadata (IdP SSO URL, entity ID, X.509 certificate — or the metadata file) with **their Bambuser contact**, who enables SSO on the workspace. It is **not** self-service end-to-end — set expectations that Bambuser participates.
- **SP-initiated flow only** — the user starts at the Bambuser login page; IdP-initiated login (clicking the app tile in Okta/Azure) is not supported.
- **SCIM provisioning is not supported** out of the box — users are managed manually in the dashboard or via **group-based role mapping** (IdP groups → Bambuser roles, mapped by Bambuser). Custom SCIM-style provisioning can be built against the public REST API ([`rest-apis.md`](rest-apis.md)).
- **Region matters as usual**: the workspace's login domain (`lcx.bambuser.com` vs `lcx-eu.bambuser.com`) is both the SSO target and your region signal (see [`regions.md`](regions.md)).
- Ask which **IdP** the customer runs before fetching a page — the Okta/Azure guides are step-by-step for those IdPs; anything else uses the custom-SAML page.
- Chat's dashboard is separate from the Live/VC BamHub; a customer with multiple products may need SSO configured per product dashboard. Confirm scope of "we want SSO" early.

For the exact IdP field names, URLs, and certificate steps, **fetch the matching page above** — IdP UIs and required fields change.
