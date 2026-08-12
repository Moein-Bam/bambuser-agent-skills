# FAQ — Shoppable Video

Curated internal Q&A for common customer questions, organized by topic. Sourced from Bambuser's support FAQ database. Where an answer involves exact limits, prices, hosts, or config keys, verify against the live docs (`bambuser.com/docs/llms.txt`) or the knowledge base (`knowledge.bambuser.com`) before relying on it.


## Analytics/Others

### Does a customer need to add at least one product from the video directly to their cart for the sale to be considered influenced?

No, that is not required. The key metric is the influence of the video on the customer's shopping session, which can lead to the purchase of any product on your site.

### How long must a customer watch a video for it to be considered an "influenced view" and potentially count towards influenced sales?

A video view is counted as a qualified view after the customer has watched it for a minimum of three seconds.

### If a customer watches a video and then purchases products that were not featured in the video, do those sales count as influenced sales?

Yes, they do. Our analytics track the customer's journey from video view to purchase, regardless of whether the specific products bought were shown in the video.


## Broadcasting/Video or Audio

### Is there a length limit for Shoppable Video

Typical use case is for shorter form content, but there are no limits enforced


## Cookies

### Cookies – if a user rejects cookies, does the feature continue to work, just with no tracking?

*While our videos don't require cookies to function, some integration systems, particularly certain tag managers, may have cookie dependencies. Therefore, the integration method will determine cookie necessity. A quick test in your testing environment can confirm this.*


## Dashboard/Stats

### Does autoplay exceeding 3 seconds counts as a view?

Yes it counts

### In playlist setting is "Play on Hover" and nothing is "hovered" - if shopper sees that, will it count towards viewers?

No


## Dashboard/Videos

### Can I upload an image in Shopppable Video?

Yes! 

In Shoppable Video dashboard, you can upload an image as a video.

We automatically convert the image into a video. You will be asked about the length of the video.


## gtm

### Can I integrate without the help of developer?

Integration efforts are always required but can vary significantly depending on the features you choose to implement. To simplify the process, we offer a GTM integration that includes a user-friendly interface for implementing the core functionality of our product. Learn more here: [https://knowledge.bambuser.com/en_US/shoppable-video-|-get-started/2-technical-integration#video-demo-how-to-add-shoppable-video-to-your-site-with-google-tag-manager-1](https://knowledge.bambuser.com/en_US/shoppable-video-%7C-get-started/2-technical-integration#video-demo-how-to-add-shoppable-video-to-your-site-with-google-tag-manager-1)


## Integration/Client Website

### The playlist preview videos are playing on desktop but on mobile they are fixed and not playing. Why?

If on desktop you can hover on preview videos on the playlist and they start playing a preview, but it doesn’t play the preview on mobile, it is probably because in playlist settings (on Bambuser dashboard), the `Preview Settings> Autoplay` option is set to `hover`, which means the preview plays only when hovering on it. But since the Hover is not available on mobile/touch screen devices, it doesn’t autoplay until you press and hold it for a second.

**Solution**

You could programmatically override the `autoplay` behavior for mobile users by adding `autoplay="cascade"` attribute to the `<bam-playlist>` component.

The playlist would look like this on mobile:

`<bam-playlist autoplay="cascade" ...></bam-playlist>`

Dynamic approach:

```
document.addEventListener('DOMContentLoaded', () => {
// This script assumes a function named isDesktop() exists and returns true or false.// Check if the device is NOT a desktop
  if (!isDesktop()) {
// Find all <bam-playlist> elements in the document
    const playlists = document.querySelectorAll('bam-playlist');

// Loop through all playlists on the page and add the attribute
    playlists.forEach(playlist => {
      playlist.setAttribute('autoplay', 'cascade');
    });
  }
});
```


## Misc

### How can a merchant ensure shoppable videos only appear on their primary language website and not on the secondary language version in both markets are on same domain? (www.website.com/french and www.website.com/english)

There are two solutions to prevent shoppable videos from appearing on the secondary language website:

1. **Switch to Manual Playlist Control**: In the Bambuser dashboard, locate the playlist by searching for the secondary language page URL. Select "Take Control" to manually manage the playlist, ensuring it is only assigned to the primary language URL.
2. **Modify the Web Component Integration**: Adjust the integration by either removing the <bam-playlist> web component from the secondary language version’s PDPs or making it conditional to only render on the primary language market (e.g., by checking the locale in the URL).
    
    Both approaches allow merchants to restrict shoppable videos to the primary language website while keeping the secondary language version unaffected.

### How can we have a different format of videos depending if user is desktop vs mobile.

If you’re looking to use different formats (aspect ratios) for your raw video files, you’ll need to upload two separate videos and create two distinct playlists. Additionally, you’ll want to recognize the user’s device and display the appropriate playlist based on whether they are on mobile or desktop.

If you’re referring to the layout of the playlist itself, please note that this adjusts automatically. For instance, when viewed on mobile, the videos in the playlist will be scrollable vertically, while on desktop, they will scroll horizontally.

### How do we map multiple playlist on one page? Where do I put an ID?

Firstly, when you want to have multiple playlist on one page, you should also have multiple <bam-playlist> elements.

By default, the playlists you add are automatically assigned an ID based on the order they appear on the page. The first `<bam-playlist>` will be assigned `playlist-auto-id-0`, the second one will be `playlist-auto-id-1`, and so on.

If you'd like to have more control over which playlist is displayed where, you can use a custom playlist ID. For example, you can add the attribute `playlist-id="hello-1"` to the `<bam-playlist>` tag, like this:

EXAMPLE:

`<bam-playlist playlist-id="hello-1">`

Then, in the "Advanced Settings" of the dashboard, you can link this specific ID to the playlist you want.

### Is it possible to have a shoppable video play on hover on a desktop and auto-play on mobile?

Yes, you can achieve this in two ways using the Bambuser Shoppable Video integration:

#### Option 1: Dynamically Configure the Same Playlist

You can write code to detect whether the viewer is on a mobile or desktop device and dynamically adjust the autoplay attribute for the same playlist ID. This approach uses a single <bam-playlist> element and modifies its behavior based on the device.

```html
<bam-playlist id="shoppable-video" org-id="your-org-id"></bam-playlist>

<script>
    // Function to detect if the user is on a mobile device
    function isMobileDevice() {
        return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    }

    // Get the playlist element
    const playlist = document.querySelector('#shoppable-video');

    // Configure playlist based on device type
    if (isMobileDevice()) {
        // Auto-play on mobile (cascade mode for sequential playback)
        playlist.setAttribute('autoplay', 'cascade');
    } else {
        // Play on hover for desktop
        playlist.setAttribute('autoplay', 'hover');
    }
</script>
```

#### Option 2: Use Different Playlist IDs

Alternatively, you can configure two separate playlists in the Bambuser dashboard with different settings (e.g., one with autoplay="hover" for desktop and another with autoplay="cascade" for mobile). Assign each playlist a unique playlist-id in the dashboard under Playlist Settings -> Advanced Settings -> Playlist Id. Then, use JavaScript to load the appropriate playlist-id based on the device.

```html
<bam-playlist id="shoppable-video" org-id="your-org-id"></bam-playlist>

<script>
    // Function to detect if the user is on a mobile device
    function isMobileDevice() {
        return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    }

    // Get the playlist element
    const playlist = document.querySelector('#shoppable-video');

    // Set playlist-id based on device type
    if (isMobileDevice()) {
        // Use playlist configured for mobile with cascade autoplay
        playlist.setAttribute('playlist-id', 'mobile-playlist-ID');
    } else {
        // Use playlist configured for desktop with hover autoplay
        playlist.setAttribute('playlist-id', 'desktop-playlist-ID');
    }
</script>
```

**Note:** For Option 2, ensure that the mobile-playlist and desktop-playlist IDs are configured in the Bambuser dashboard with the desired settings (e.g., autoplay="cascade" for mobile and autoplay="hover" for desktop).

For detailed configuration, refer to the Bambuser documentation: Configuring Playlist Layout and Behavior.

### What's the maximum length of a shoppable video?

The maximum video length for the Shoppable Video is 5 minutes.


## Player/Cart Integration

### How often does the stock availability refresh/update for shoppable videos?

Stock availability refreshes once when the playlist is loaded and displayed. However, merchants can update stock availability at any time using their integration code by calling the same function used to provide product data initially.


## Player/Product Integration (Hydration)

### How can we manage shoppable videos for our multiple markets? How do localize products?

The best way to manage localization for shoppable videos is through **product hydration ([Cart Integration](https://bambuser.com/docs/shoppable-video/cart-integration/))**. This process occurs on the client-side, allowing product data to be fetched and applied to the video player based on the viewer's language or market. Ensure the product object payload matches the user's language (e.g., French or English), then hydrate the products with the appropriate localized data. This approach enables seamless localization of all product information, such as product cards and links, displayed in the player without requiring separate projects. Read more here: [https://bambuser.com/docs/shoppable-video/cart-integration/](https://bambuser.com/docs/shoppable-video/cart-integration/)


## Player/Translations

### Do you support a RTL playlist?

Yes, to test it - si*mply change your default language to Arabic within the settings, and the player elements in your playlists will be updated accordingly. To do this, navigate to the Live tab, then click on Settings and Translations, and then Add language. Feel free to share any feedback with us and we'll look into it on our side.*

### Why are shoppable videos appearing on a website’s secondary language version (www.website.com/french) when they are only intended for the primary language (www.website.com/english) version?

Shoppable videos may appear on the secondary language version due to the <bam-playlist> web component, which automatically detects Product Detail Pages (PDPs) and generates a dynamic playlist. The process involves:

1. Checking for a playlist assigned to the current page URL in the Bambuser dashboard.
2. Identifying if the page is a PDP by detecting a product SKU or ID.
3. Searching for videos featuring the same product in the Bambuser dashboard.
4. Creating and displaying a dynamic playlist if matching videos are found.
    
    Since the secondary language version often uses the same product SKU as the primary version, the web component automatically generates and displays the playlist on the secondary language site.


## Playlist/Load Time

### Do you have any recommendations around max number of videos, video length etc to minimise impact on page performance?

*Up to 3 playlists should work well. While more should be manageable, exceeding 10 playlists simultaneously can impact loading speed. Video duration is less of a factor than the number of videos within a playlist, as more videos require more loading. However, our playlists are optimized to minimize their effect on load speed. Videos are dynamically loaded and pre-loaded based on their visibility and position on the page, ensuring quick loading when needed without compromising other essential page content.*

*If you're placing Bambuser playlists "above the fold" and are concerned about layout shifts, we recommend locking the player height as explained*

[*here*](https://bambuser.com/docs/shoppable-video/bam-playlist-integration/#optimizing-site-speed)

*.*


## Playlist/Properties

### Fill-parent does fill the parent

We require that you set "soft-limit=1" to <bam-playlist> in order for this to take affect. Soft limit property will limit the amount of videos in the playlist.

### how do i add navigational arrows to my shoppable video playlist

You can control playlist programatically. One it is possible to create your own arrows are scroll to the next or previous videos using scrollForward() or scrollBackward()

Read more here: [https://bambuser.com/docs/shoppable-video/bam-playlist-integration/#5-controlling-the-playlist-programmatically](https://bambuser.com/docs/shoppable-video/bam-playlist-integration/#5-controlling-the-playlist-programmatically)


## Video Aspect Ratio

### Can we also make our playlist configurations standard so that they remain the same every time we create a playlist? For ex- we want the playlist size to be 263x505. Can we have this be saved for playlist settings so we don’t always have to add in the exact size?

Yes, you can standardize your playlist configurations in two ways. Either through UI or through code:

#### Code

Example:

```jsx

<style>
  :root {
    --bam-player-width: 263px;
    --bam-player-height: 505px;
}
</style>

<bam-playlist  player-fit="exact-size" org-id="YOUR_ORG_ID"></bam-playlist>

```

#### UI:

1. **Go to Settings**: In the Shoppable Video product, navigate to the Settings from the left-hand menu.
2. **Select Player Width/Player Height**: Here, you can specify custom sizes for your playlists.
3. **Use the Exact Size Option**: This option allows you to maintain the size you define, such as 263x505, for all future playlists.
