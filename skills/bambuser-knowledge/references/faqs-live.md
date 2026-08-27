# FAQ — Live Shopping

Curated internal Q&A for common customer questions, organized by topic. Sourced from Bambuser's support FAQ database. Where an answer involves exact limits, prices, hosts, or config keys, verify against the live docs (`bambuser.com/docs/llms.txt`) or the knowledge base (`knowledge.bambuser.com`) before relying on it.


## Analytics/Call Widget Metrics

### How do you define a “viewer” in the stats page (unique viewers, live vs recorded)

Viewers are defined as the **total number of unique devices** that have watched a show. We **do** **not** in any way try to track users across multiple devices.

If a viewer watches both live and recorded on the same device, the viewer will be counted as 1 live viewer and 1 recorded viewer. However, the total number of viewers will still only be 1.

#### Example:

****We have three people: **Mary**, **Sophie** and **Jesper**.

**Jesper** watches the show LIVE on his phone.
*(1 LIVE viewer, 0 RECORDED viewers, 1 TOTAL viewer)*

**Mary** watches the show LIVE, first on her computer, but then switches to her phone.
*(2 LIVE viewers, 0 RECORDED viewers, 2 TOTAL viewers)*

**Sophie** watches the show LIVE on her computer, but then re-watches the show RECORDED on the same device.
*(1 LIVE viewer, 1 RECORDED viewer, 1 TOTAL viewer)*

TOTAL: 4 viewers
LIVE: 4 viewers
RECORDED: 1 viewer


## Analytics/Conversion Tracking

### Are we able to see how many people have clicked the add to calendar button?

Yes, you can either see it in exported report in the dashboard, or listen to tracking event here: [https://bambuser.com/docs/live/player-metrics#add-to-calender](https://bambuser.com/docs/live/player-metrics#add-to-calender)

### Can we track product purchases that we made on a different website/ domain?

Using our [Conversion Tracker](https://bambuser.com/docs/live/conversion-tracking), you cannot track product purchases that we made on a different website/ domain that the player is embedded on. However, it is technically possible to do this on your end by adding product affiliate links to Bambuser player.

### How to integrate Bambuser Conversion Tracking inside a native mobile app?

You can only impleement Conversion Tracking if you are utilizing our native SDKs. For webview, we do not offer Conversion Tracking. Read more here: [iOS](https://bambuser.com/docs/live/mobile-sdk-integration-ios/tracking/), [Android](https://bambuser.com/docs/live/mobile-sdk-integration-android/tracking/), [React Native](https://bambuser.com/docs/live/mobile-sdk-integration-react-native/tracking/)

### When using Bambuser's tracking script, does the script send the entire product array from a purchase, or only the products that were part of videos?

The Bambuser tracking script is designed to provide a comprehensive view of a shopper's conversion journey. To achieve this, it's recommended that our customers send the entire product array from a purchase.

While the merchant has control over what data they send, providing the full purchase data allows Bambuser to offer a more complete picture of the shopper's conversion.

It's important to note that the script will only send transaction data for shoppers who have interacted with a Bambuser video. This is how the script can provide more intelligent attribution, such as tracking conversions where a user watched more than one video and subsequently purchased related products.


## Analytics/Others

### if a we share a lcx preview link instead of embedding on our page, will stats still be tracked?

Yes, everything except Sales related stats

### Is it possible to integrate Bambuser Player with Google Analytics

Bambuser One-to-Many player emits most of events and user interactions. That data can be picked up and fed to Google Analytics or any other analytics platform.

We emit the events and user interactions in two ways:

- Through a tracking point
    - Read more about [how to listen to the Bambuser tracking point](https://bambuser.com/docs/live/player-metrics#listening-to-events)
- By pushing to the data layer
    - Read more about [how to get events into the data layer](https://bambuser.com/docs/live/player-metrics#picking-up-events-data-from-datalayer)

There are also other ways to access Bambuser analytics data. You can read more on [Access analytics data](https://bambuser.com/docs/live/access-analytics-data).

### What is a “session”

Sessions are defined as a single viewer (user) interacting with the player during a specific time frame. A session is "started" when the user first interacts with the player. A session is "ended" when 30 minutes have passed since the viewer's (user's) last interaction with the player.

If the user returns after these 30 minutes a new session is started. If the user returns within the 30 minutes the session is prolonged.


## Bambuser Licence

### What happens to my live shopping shows once my license expires?

When your license expires and your organization is deactivated, the following changes will occur:

- **Content Unpublishing:** All previously published shows (including past/ended shows) will be automatically unpublished. This means they will no longer be visible or playable in any players or channels embedded on your website.

### Will visitors to my site see an error message where the player used to be?

Once the shows are unpublished, they are removed from the public event feed. While the specific behavior depends on your website integration, typically the player will no longer display the content or the gallery will appear empty. We recommend removing the embed codes from your site once your license ends to ensure a clean user experience for your shoppers.


## Bambuser Shopify App

### Does Bambuser Shopify App offer free trial?

Yes


## Broadcasting/External Cameras - RTMP

### Are there any limits or considerations for streaming duration?

While Bambuser has no hard limit on streaming duration, external platforms like Instagram impose an 8-hour limit. However, network stability for extended streams cannot be fully guaranteed. In the rare event of a disconnection, you can easily reconnect the show by following these steps:

1. Navigate to the Show Setup page.
2. Click the three dots (“...”) in the top-right corner.
3. Select **Reconnect** to enable the show to accept the incoming stream again.

 
To manage RTMP (External camera) show interruptions, see our support guide: [What to do if an RTMP show goes down](https://knowledge.bambuser.com/mobile/what-to-do-if-a-rtmp-show-goes-down).

### Does Bambuser support SRT for external cameras via RTMP

No, we don't support SRT. We support RTMP and secure RTMPS ingest for external cameras.

### We need to integrate the application with Streamyard (pro version).

Bambuser supports broadcasting through RTMP connection, which might support your use case for this. Read more here: [https://knowledge.bambuser.com/rtmp/external-cameras](https://knowledge.bambuser.com/rtmp/external-cameras)

### When a test show is duplicated, will the duplicated show generate use the same RTMP stream key or generate a new one?

When duplicating a show, a new show is created which comes with a new RTMP stream key.


## Broadcasting/Multistreaming

### can i use polls on an instagram live steam

No, only raw video gets forwarded to Instagram as well as product thubnails if Social selling is enabled. No other features, such as polls or gamification..

### Facebook multistreaming broadcast wont connect to Facebook. It says "The authentication has expired for this connection.”

It is expected that Facebook multistreaming access token will expire every [60 days](https://developers.facebook.com/docs/instagram-basic-display-api/guides/long-lived-access-tokens/). Meaning that if you get that message, you have most likely setup your FB connection over 60 days ago and you should follow below steps to regenerate new token: 

1. Log in to the Bambuser dashboard
2. From the side menu, menu go to **Settings** > **Integrations**
3. Click **Facebook**
4. Delete the currently connected page
5. Once deleted, click **Connect** to connect your Facebook page one more time.
6. Afterwords, you should see a message asking if you'd like to reconnect your account to Bambuser Multistream -- be sure to click '**Edit previous settings**'
7. Pick relevant pages and click '**Next**'
8. Make sure you grant all necessary permissions (At least **`Read content posted on the Page`** and **`Create and manage content on your Page`**)
9. Click **Done**
10. Now, on the show's page, go to the **Multistream** section and re-enable Facebook:

### For multistreaming, how should we structure tracking link?

On the URL to Live Show field, it is expected to insert the URL to your show's landing page and not the 'Share URL'.

Example:

- [https://www.example.com/live-shopping/](https://www.example.com/live-shopping/) ✅

However, if you paste the share URL to that field, you it show you a warning to link to automatically fix the link.

Bonus:The link you add can also contain your own tracking parameters, such as UTM tags.Example:

- [https://www.example.com/live-shopping/?utm_source=bambuser&utm_medium=facebook&utm_campaign=spring_sale&utm_id=123](https://www.example.com/live-shopping/?utm_source=bambuser&utm_medium=facebook&utm_campaign=spring_sale&utm_id=123)

### We can't see multistreaming traffic acquisition data

In order to see multistreaming stats in the dashboard, your viewers would have to click on the **tracking link** from the respective social media. That tracking link has to include a parameter like `?[socialMediaLiveshopping=](https://www.example.com/landing-page?autoplayLiveShopping=SHOW_ID&socialMediaLiveshopping=Facebook)<one_of_possible_parameters>` 

You will be able to generate **tracking link** when enabling multistreaming on a shows page in Bambuser dashboard. The parameters that are added to the URL will ensure that your social media viewers can find the main live show on your website and to enable data tracking which will later display under traffic acquisition  in Bambuser dashboard. 

Example of "URL to Live Show" you add in Bambuser dashboard -> Shows page:

[`https://www.example.com/landing-page`](https://www.example.com/landing-page)

Tracking link that will be generated based on the above URL provided in Bambuser dashboard

[`https://www.example.com/landing-page?autoplayLiveShopping=SHOW_ID&socialMediaLiveshopping=Facebook`](https://www.example.com/landing-page?autoplayLiveShopping=SHOW_ID&socialMediaLiveshopping=Facebook)

Since the link includes `?[socialMediaLiveshopping=Facebook](https://www.example.com/landing-page?autoplayLiveShopping=SHOW_ID&socialMediaLiveshopping=Facebook)` parameter, traffic acqusition will be counted. In this specific example, every time a user clicks on that link, we will recognize that viewer has come from Facebook. 

All possible parameters are: 

- Facebook
- Youtube
- Other

If you cannot see multistreaming traffic acquisition data, it would mean one of below 3 things:

1. Your tracking link did not include `?socialMediaLiveshopping=<one_of_possible_parameters>`
2. There were no clicks on tracking link
3. Tracking link was not included in description of the show on your social media while multistreaming

### Why does video quality drop when we stream forward to Instagram

Instagram does not support as high quality as we do at Bambuser ([Live producer docs](https://about.instagram.com/blog/tips-and-tricks/instagram-live-producer)),  so we resize the video we stream to Instagram to match what Instagram expects.


## Broadcasting/Other

### Can multiple streams stream simultaneously on the same site?

Yes, you don't need several dashboards for that.

### Player is stuck on “Starting soon”

This is most likely due to miss-match in show that went live VS show that you have embedded on your website. Check the correct show id used by:

1. Navigate to your website where you have the player
2.  right click in player
3. “View frame source”
4. find (command + f) “eventId” in the URL
5.  this is the show id
6. Check if showID matches the one you are streaming to in Bambuser dashboard?

### We are looking to do private events for live shows

Most common use case to host private live streaming events is to embed our player under a login page / on a hidden page and only share the link with VIP members. Note that you can also password protect your show. Read more here: [https://knowledge.bambuser.com/player-settings/invite-only](https://knowledge.bambuser.com/player-settings/invite-only)

### We get “Not Available” message in the Player

Most likely the show is in “Unpublished” state

- Solution: Toggle the show to “Published” via the dropdown menu on the Show setup page

### What happens if the host by mistake ends the show instead of pausing it?

The show can be reactivated by the admin on the dashboard.


## Broadcasting/Pre-recorded

### Why does this specific show display the “Go live” option for the ended show under Moderator mode?

We show it on pre-recorded shows only. 

If they went live with mobile app, then we don’t show as you go live from the app


## Broadcasting/Splitscreen Dual-hosting

### When doing dual hosting, second host was stuck in waiting room

According to the Dual Hosting documentation ([https://knowledge.bambuser.com/app/split-screen](https://knowledge.bambuser.com/app/split-screen)), this feature is only supported when both hosts are using iOS devices. If second host is stuck in waiting room, then this is typically due to one of the hosts using an Android device.


## Broadcasting/Video or Audio

### Could you tell me if the one-to-many api can provide me with either video download urls or if I can consume them via a custom player?

Not supported

### How good should hosts network connection be?

To produce a professional looking video, whether offline or live, it is important to choose a well lit location, make sure the recording device is fully charged and choose a microphone that works well in the location.

However, unlike when recording regular video, the foundation for a high quality live broadcast is a stable and fast network connection.

Wireless networks, both 4G and Wi-Fi, are most often the limiting factor for live broadcast quality. This may come as an unexpected surprise for people familiar with recording regular video and uploading it to on-demand services. When broadcasting live video, uplink (upload) speed is more important than download speed.

If the broadcaster has a slow connection, this will be the bottleneck for what is distributed to viewers, and particularly viewers on fast connections will be disappointed.

The Live Shopping app will automatically adapt video quality according to available network speed. 720p quality today uses around 5 Mbps, so you should strive to find a network that can provide this. The broadcaster can adapt to networks as slow as 0.3 Mbps and still provide a coherent stream, but the video quality will be severely reduced. The numbers given here are subject to change as newer technologies become available.

#### 4G versus Wi-Fi

4G networks are generally very good outdoors or near windows in a building, and the connection is usually quite stable. 4G subscriptions usually include a very good upload speed. If you're broadcasting where 4G coverage is good, it is probably your best choice.

When going deeper inside a building, into a basement or behind thick walls, 4G network coverage and bandwidth will shrink dramatically. Live video resolution and bitrate will consequently be reduced. If you plan on broadcasting from such locations, try to scout in advance for high quality Wi-Fi networks.

Wi-Fi networks are very varying in quality. A modern 5GHz Wi-Fi router backed by a fast wired network can provide an excellent upload speed, albeit in a limited area.

Oppositely, a Wi-Fi connection can be horrible. Examples to avoid:

- Older 2.4 GHz Wi-Fi router in an urban area where the 2.4 GHz band is congested. The uplink speed will almost always be slow. Additionally, the connection can be very erratic, causing choppy video and audio drop-outs.
- Wi-Fi where a lot of devices are connected to the same router. Other users competing for bandwidth can cause large variation in video quality and intermittent drop-outs.
- Wi-Fi backed by a mediocre wired network connection. Older wired home networks such as ADSL might provide 20 Mbps download but only 1-2 Mbps upload speed. Such networks may be good enough for viewing video, but are unsuitable for broadcasting live video.

#### Practical advice

- Measure the speed of different networks in your chosen location. You can measure upload speed by using speed test apps, for example the globally available Speedtest by Ookla
- Test your setup in advance. Do a live broadcast from the planned location to check that all parts of your setup behave as expected together and provide the experience you desire.

### Our goals is to be able to load Bambuser live streams and previously recorded live streams in our video player. To keep it simple, we basically need a video URL that can be consumed on a standard iOS or Android video player.

We don't offer playing back the raw videos from our CDN. All consumer playback require the use of our players, whether that's web or native player SDKs.

The main reason we require using our players for consumer playback is that we need to be able to track usage and bill the customer.
There are other more complicated use cases handled by our players too. For example, a show can consist of several video parts due to hosts pausing/resuming etc. We also migrate videos between different storages and provide no guarantee that a raw video link is available indefinitely. Our player always goes through our dispatcher service to fetch the video in the right way, from the right place and to report usage.

### There is video stream latency / delay in the show

Please note that a latency of up to 10 seconds is expected. Additionally, the moderator view will generally have a shorter latency than the player view.

We are using AWS CloudFront as our content delivery network, ensuring high availability of our services. The delay can vary slightly depending on the viewer's device, operating system, and browser. For the moderator (on the dashboard), the delay is about 5 seconds, while for end viewers, it ranges from 7 to 11 seconds.

Latency is introduced at several points in the chain, with the most significant delay occurring on the viewing side, where HLS video player implementations add around ten seconds of latency. When using third-party RTMP applications, the buffering strategy employed by the application can also affect latency.

As described above, this latency is within normal parameters. To reduce latency, ensure a stable internet connection, use up-to-date software, and have a strong internet signal if using Wi-Fi.

### What is the video quality/resolution supported in Bambuser Player show?

The broadcast quality will automatically adapt according to the host's network conditions. 

The max frame rate is 30fps.

Supported resolutions for different sources:

- Broadcasting over RTMP -> up to 1080p
- Uploaded/rebroadcast pre-recorded -> up to 1080p
- Bambuser broadcaster app on Android -> up to 720p
- Bambuser broadcaster app on iOS -> up to 648p

### Why do my viewers see a delay in the video?

Some delay (normally referred to as "latency") is inevitable when live streaming to a website.

The delay usually 8-10s which gives the moderator the chance to unpublish the show if something goes wrong. Note that the delay can vary from viewer to viewer.

Note that on the dashboard (moderator view) we use a player with much lower latency (1-3s).

### Why is the video blurry and/or stutters?

The quality of the video (it's resolution and framerate) is dependent on the broadcaster's network. Broadcaster is who/what is streaming the video. Bambuser's broadcasting technology adjusts the video's resolution and framerate up or down based on the capacity of the broadcaster's network at any given moment. By lowering the video's quality when the network's capacity goes down we reduce the risk of interruptions in the stream.

When/if the network can't cope, the video may stutter for a while before the app manages to switch to a lower quality setting.

The perceived quality is also affected by the viewer's network. If the viewer's network doesn't have enough capacity to view the broadcast in full quality, the player will switch to a lower resolution, thus reducing the quality of the video (for that particular viewer) but keeping the video flowing uninterrupted.


## Dashboard / Social Selling

### Can a brand multistream to "close friends" only on social media platforms?

Yes, it is possible for a brand to stream live video to a "close friends" list on some social media platforms. For example, Instagram has a feature that allows users to broadcast live videos exclusively to their designated "Close Friends" list.

However, social selling functionalities not typically supported when a live stream is restricted to a private group like a "close friends" list.

### How can sales from social selling be attributed to a specific show?

Sales can be attributed to a social selling show by tracking UTM parameters or hash fragments that indicate the user came from a specific social selling campaign. Even if a sale occurs days later, the system can attribute it to the last social selling show the user interacted with, provided the merchant’s page runs the necessary tracking code.

### If a client does a live show from Bambuser that they simulcast to IG using Social Selling, then they download that video and re-post to their IG feed will the Bambuser overlays with the keywords still appear? and if they do, will they still get a DM with a link to shop?

If a client does a live show from Bambuser that they simulcast to IG using Social Selling, then they download that video and re-post to their IG feed:

### In social selling, is it still possible to type in the product code and receive a DM after the displayed product has already changed?

yes, as a viewer you can request any product that's part of the show at any time of the show

### Is the Social Selling feature available if an instagram Account is connected via RTMP?

No, user has to be connected through the Bambuser IG app

### Using social selling, shop codes are not sending through DMs on Instagram

This might happen due to two reasons: 

1. You are sending “shop codes” using the same IG account as the live stream is happening on. It is expected that this doesnt work
2. You IG account has disabled the setting to access Instagram direct message
    1. Go to your Instagram business or creator profile.
    2. Tap Menu to access settings and privacy
    3. Scroll down and select "Messages and story replies"
    4. Select Message controls
    5. Under Connected Tools, you can toggle on or off “Allow Access to Messages.”

### What is required for accurate tracking of social selling sales?

Accurate tracking requires users to be directed to pages where the merchant’s domain runs the necessary tracking code (e.g., embed.js). This ensures that sales can be properly attributed to social selling campaigns, whether using standard or advanced social selling features.

### What is the difference between standard and "advanced buttons" in social selling?

In standard social selling, users are directed to a product detail page (PDP) with UTM parameters appended to the URL for tracking. With "advanced social selling," users receive DM messages with buttons to select product variants or sizes. After selection, they are directed to a specific page on the merchant’s domain where embed.js is loaded, allowing for automated add-to-cart or checkout actions using query parameters or hash fragments. See more here: [https://knowledge.bambuser.com/socialcommercefeatures/social-selling#start-using-add-to-bag-buttons-on-instagram-6](https://knowledge.bambuser.com/socialcommercefeatures/social-selling#start-using-add-to-bag-buttons-on-instagram-6)

### When multistreaming with social selling and when a viewer types in the code to the chat, will they only receive 1 DM for the product being featured at that moment? Will they receive multiple DMs that link to all of the products featured throughout the live?

One DM per code written in the chat. Codes are unique per product and DMs sent.

### When multistreaming with social selling for the moderation aspect, are answers from the Bambuser chat flowing back to Instagram for those viewers to read?

No

### When multistreaming with social selling, are there multiple codes that correspond to each individual product? Or is it one code for all of the products that will be displayed?

There is only one code per product. Codes are assigned automatically, but merchants can customize what should be written before the code (SHOP, ENTER, TYPE or similar)

### When multistreaming with social selling, can viewers click on the product pop-ins to shop or are they only able to access the details of the product through typing in the code that appears along with the product?

They need to type in the code to get a DM to the PDP. Note that messages are not sent if you are commenting from a business account

### When using Social Selling, after you enter the code for the product and you receive a DM, where will the product pages open ?

When you enter the shop code, you will receive a DM with a link to the merchant's PDP. This means you will have to leave the show to open the link in your inbox. However, when you click the PDP link, it opens in a web view within Instagram or Messenger, so you don't have to leave the social media app.


## Dashboard/AI Page

### Are we able to use AI moderator in Japanese?

Yes

### Do you have any data regarding AI moderator’s accuracy?

We do not have hard data on accuracy, but generally, the higher quality of information they put into the AI moderator tool and the information available on the products PDP page which we attempt to scrape, the better the answers


## Dashboard/Blocking

### Is there a time frame that blocked Live users get unblocked?

a user is blocked through local stroage and is blocked until explicitly unblocked. ie, there’s no automatic mechanism which unblocks a user after some time

### Will the moderators during a show see that messages have been blocked?

No, messages that are blocked are not even coming through to Bambuser servers


## Dashboard/Channels Page

### Can we translate the titles and descriptions in my channels into multiple languages?

We understand the importance of having content available in multiple languages. Here’s how you can manage translations for titles and descriptions in your channels. Titles and descriptions are customizable fields, and automatic translation might not always be reliable. Currently, the best way to translate these fields is by using our REST API integration, which requires some additional development on your part.

Here are the steps you need to follow:

1. **Access the "Get Channels Details" Endpoint:**
Use the following endpoint to retrieve details of your channels:
[Get Channels Details Endpoint](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Channels/paths/~1channels~1%7BchannelId%7D/get).
2. **Retrieve Show Details:**
This endpoint will return a list of shows in your channel, including the titles and descriptions you’ve added in the dashboard.
3. **Translate Content:**
Once you have the details, you can translate the titles and descriptions on your end.
4. **Display Translated Content:**
Populate the translated content on your website accordingly.

We hope this helps! If you have any further questions or need additional assistance, please don’t hesitate to reach out.


## Dashboard/Chat Moderation

### Can the same moderator highlight products and moderate chat?

Yes. However it depends on the traffic you are expecting during a live show.  In general, we recommend that there is one moderator for each function.

### Can we have multiple people moderating a live show from the dashboard at the same time?

Yes, you can have as many moderatoes moderating the show as you want to. However, it might be difficult to coordinate if multiple people are trying to do the exact same thing simultaneously.

### Can we send links in the show’s chat?

Yes, if you add `https://` infront of the URL it will be clickable. Note that only links sent by moderators will be made clickable, links sent by normal viewers will not be clickable.

### How do we avoid spam/trolls in the chat and what do we do if it happens?

Shadow banning, blacklist of profanity word in chat name and chat messages, possibility to delete and block users, post-show you can download and go through entire chat log, delete and remove what feels inappropriate.

For extreme caution you can decide to manually approve all comments in show setup.

### How does the block chat user work?

Both host and moderator can block a commenter (chat user) from the app or through the moderate view on the dashboard.

Once a commenter is blocked, all messages sent by the blocked user will be silently disregarded. It means that no one but the blocked user can see the comments from the blocked user.

#### At what level the blocking works?

The chat blocking feature is based on browser local storage. So, the user remains blocked only on the same device and browser session.

Bambuser 1:M does not offer IP-based chat blocking. 

#### Can a blocked user comment on another show?

The blocked commenter remains blocked on all shows from the same dashboard (organization). 

#### How long the user remains blocked?

Unless the browser local storage is flushed, the user stays blocked in the same browser session.

### Is there a character limit to a chat message?

There’s a max 170 characters limit for end-users, but no limitation for moderator messages. However, we recommend keeping it short for a better user experience.

End-users will see the number of limit in the comment field when the number of characters exceeds the limit.

### Is there a limit on how many chat messages can be displayed in the player?

To prevent the chat from becoming flooded when there are thousands of viewers chatting at the same time, we limit the amount of messages displayed in the video player to 2 posts per second.

### Is there a profanity list for the chat

Yes, Bambuser has a default profanity list. If you want to add on top of it, you can contact your dedicated Account Manager with a list of words you want to block for your shows.

### What does "hide chat in replay means"?

Once the live show has ended you can decide to hide or show the chat comments.

### Why is there a delay in chat messages from the host?

Chat messages from both the host and moderator are always synced with the actual point of time in the video. This means that if a viewer is on a 10s delay compared to the host streaming the show, the viewer will see chat messages from the host with the exact same delay as the video.


## Dashboard/Curtains page

### Does the live streaming feature offer the opportunity to show a text or cover image before the event starts?

Yes, you have the ability to set custom curtain images for pre-screen, paused screen, and ended screen. See more here: [https://knowledge.bambuser.com/player-settings/pre-show,-post-show,-and-pause-screens](https://knowledge.bambuser.com/player-settings/pre-show,-post-show,-and-pause-screens)

### Why does my show say "Not available"?

Shows will be unavailable for viewers when they are "Unpublished".

Tap on the "Publish show" button on the show's page on the dashboard to make it published and available for viewing.

### “Not Available” message in the player curtain

- **Troubleshoot**: Is the correct show id used? (Chrome: right click in player → “View frame source” → find “eventId” in the URL, this is the show id)
- **Troubleshoot**: Is the show “Unpublished”?
    - Solution: Toggle the show to “Published” via the dropdown menu on the Show setup page
- **Troubleshoot**: Is their page loading embed.js URL from the correct dashboard region (US: `lcx-embed.bambuser.com` vs EU: `lcx-embed-eu.bambuser.com`)


## Dashboard/FAB page

### Delay FAB appearance after landing on the page

This functionality is not directly configurable within the FAB settings. However, your developers can implement this by adding a delay to the FAB script using JavaScript. For instance:

`setTimeout(() => {
// Code to load FAB script here
}, 5000); // Delay in milliseconds (e.g., 5000ms = 5 seconds)`

Alternatively, you can refer to the article **“How to Prevent the FAB from Reappearing After a User Dismisses It”**, which may offer additional insights into managing FAB visibility.

[https://bambuser.com/docs/live/fab-integration#floating-action-button-faq](https://bambuser.com/docs/live/fab-integration#floating-action-button-faq)

### Hide FAB on the first page and display it on subsequent page

This isn’t a built-in option, but a workaround could involve:

Injecting a custom cookie or localStorage value on the user's first page visit to track their session.
Only loading the FAB script if a specific condition is met (e.g., cookie indicates they are navigating to a second page).

`if (document.cookie.includes("visited=true")) {
// Load FAB script
} else {
document.cookie = "visited=true";`


## Dashboard/Gamification

### Are there limits on the maximum number of participants or winners for Bambuser's Gamification features?

No, there are no technical limits imposed by the platform on how many participants can enter a gamification event, nor are there technical limits on the number of winners that can be selected for any single event.

### Is there a way to personalize the message at the beginning of a game? Can we change the "Ready for a game? Join now and win prizes!

It can be done through the Translations UI.
BamHub -> Settings -> Translations, select appropriate locale, search for the existing string - change it.


## Dashboard/Live stats

### How often is sales data updated and reflected in Bambuser Live Insights? Is there a specific time that it updates?

The update frequency for sales data in Insights depends on the specific Bambuser product being utilized.

- For **Live** analytics, sales data is refreshed hourly.


## Dashboard/Multistreaming

### Is it possible to stream live on tiktok?

TikTok has removed the possibility for users to stream from custom sources. As far as Bambuser is aware, there here is no officially supported method that allows merchants to stream to TikTok using any other means than the TikTok app.

### Video is not forwarding to IG even though it says “streaming”

Perhaps you forgot to click “go-live” on instagram? 

Please follow instructions here: [https://knowledge.bambuser.com/settings/multi-stream-to-social-platforms](https://knowledge.bambuser.com/settings/multi-stream-to-social-platforms)

1. Copy paste the URL and stream KEY to your Bambuser custom RTMP connection to add Instagram Live as your streaming endpoint
2. Bambuser App doesn't provide a preview. Once you are ready to Go Live, click “Go live” within Live Producer to start the stream. Once live, the “Comments” tab will let you read and respond to comments from viewers
3. When you want to end the live video, click “End live video”

<aside>
💡 If you end your stream in the streaming software before you end your Live Producer (Instagram App) broadcast, the live video will continue while displaying the last frame received from the streaming software. In order to end your live video smoothly, end the broadcast on Live Producer (Instagram App) first before ending the stream on the streaming software.

</aside>

### Why Does Our Landing Page URL Become Longer on Our Facebook Page?

The reason your landing page URL becomes longer on your Facebook page is because Bambuser automatically appends tracking parameters to the URL. The extension occurs for the following reasons:

1. **Tracking User Sources:** The additional parameters are added to track where the user is coming from (e.g., Instagram, Facebook, or Youtube). This data is then made available on the Bambuser stats page to provide insights into traffic acquisition.
2. **Auto-Triggering the Show:** The appended parameters enable the show to start automatically when the link is clicked, eliminating the need for users to manually find a call-to-action (CTA) on the landing page.

This lengthening of the URL is not caused by Facebook itself but is a deliberate action by Bambuser to enhance tracking and improve the user experience. For example, a landing page URL like `https://www.example.com/shows-landing-page` might expand to something like `https://www.example.com/shows-landing-page?autoplayLiveShopping={showId}&socialMediaLiveshopping=Facebook` to include this additional functionality.


## Dashboard/Poll Moderation

### Can a user with Moderator permission see sales in real time in the moderator view that are being generated in the Live show?

yes


## Dashboard/Product Moderation

### How can we automate highlights for a live show to reduce human error?

**A:** To automate product tagging and generate highlights for a live shopping show, follow these steps:

1. Call the endpoint https://liveshopping-api.bambuser.com/v1/shows/{showId}/products to retrieve product data and the associated product ID.
2. Use the retrieved ID to call https://liveshopping-api.bambuser.com/v1/shows/{showId}/highlights to generate automated highlights based on the tagged products.

For a full list of available endpoints, refer to the REST API documentation at https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many. This process leverages the Bambuser Live Shopping API to streamline tagging and minimize manual errors.

### Is there s a way to hide the realtime stats on the moderation page.

No


## Dashboard/Product scraping

### How to reuse all my products in new show?

You can duplicate a show directly, or manually copy the product URLs from one show to another.

To do this manually:

1. Go to the show setup page and click **"Manage Products."**
2. Scroll down and click **"Copy Products"** to copy all product URLs.
3. Open your new show and go to **"Manage Products"** again.
4. Paste the copied URLs into the **"Add product URLs"** field.

This will transfer all product links to the new show.

### I get an error adding product to the show

When you add a product to the show, our scraper goes on your PDP and tries to make a request to fetch product information. 

- If that information cannot be fetched then you most likely have to whitelist our product scraper: [https://bambuser.com/docs/live/data-scraping#whitelist-the-scraper](https://bambuser.com/docs/live/data-scraping#whitelist-the-scraper)
- If information is fetched but not the right information is populated, then you most likely have to adjust your product structure on your page, so that our scraper can fetch correct information: [https://bambuser.com/docs/live/data-scraping#how-does-the-product-scraper-work](https://bambuser.com/docs/live/data-scraping#how-does-the-product-scraper-work)

### Our Scraped data doesn’t show the correct thing

When you add a product to a show in the Bambuser Live Shopping Dashboard, some basic product details are scraped from the content of the given product URL. In order to that to work correctly, your PDPs have to be defined in the same structure that our scraper expects. 

Make sure to read more about what structure our scraper expects here: [https://bambuser.com/docs/live/data-scraping#how-does-the-product-scraper-work](https://bambuser.com/docs/live/data-scraping#how-does-the-product-scraper-work). Most recommended structure is **JSON-LD** as it is the most prioritized by our scraper.

Besides that, make sure the this data is server side rendered on your site.

If all above is already done, you might have to whitelist our scraper [https://bambuser.com/docs/live/data-scraping#whitelist-the-scraper](https://bambuser.com/docs/live/data-scraping#whitelist-the-scraper). If you whitelist our IP address from your side, you also need to inform Bambuser staff to enable 'Static IP proxy' for your organization.

To check your specific example, you can navigate to Settings -> Integrations -> Products -> Paste your product URL there and click "Run Test".

To see where exactly our scraped picked information from your PDP, you can click on the one of the scraped information.

### We use product URLs that require a registered account to access. Can we use these products in shows, or is it only possible with publicly accessible URLs?

To use products in shows with non-public URLs, you have two options:

1. **Whitelist the scraper**: The customer can whitelist Bambuser's scraper so it can access the restricted pages. This allows products to be added automatically to the show.
2. **Manual addition**: Products can also be added manually to the show.

Alternatively, if the catalog is intentionally kept private, consider embedding the show only on pages that also require registration.

### When I add products to a show, I want different product details such as product title, product thumbnail image, brand and product reference (SDK) to be scraped from my PDP (product details page). How to do it?

When adding products to a show by adding product URLs, Bambuser product scraper is looking for structured product data markups on your product page to extract product details.

To learn more about the recommended data markups and examples, check out this documentation: [https://bambuser.com/docs/live/data-scraping](https://bambuser.com/docs/live/data-scraping)

You can provide your desired information through one of the supported structured product data markups to the Bambuser product data scraper.

On [https://lcx.bambuser.com/public/product-scraper](https://lcx.bambuser.com/public/product-scraper), you can test the Bambuser product scraper. When testing with a product URL, clicking on any of the scraped values (for example, product image URL) shows where in the code the value was scraped from.

### Why do I get 403 error when trying to add products to a show by importing the product URLs?

When you are adding/importing your product URLs to a show, if you receive a 403 (Forbidden) error, it can mean that your website server is denying to accept requests from Bambuser. Therefore Bambuser cannot access the product page content.

We recommend that you reach out to your developers/ server administrators of your mentioned website and ask them to investigate the reason why the requests from Bambuser are blocked.

If needed your developers can follow the instructions to [whitelist Bambuser product scraper](https://bambuser.com/docs/live/data-scraping/#whitelist-the-scraper) in order to resolve this issue.

[https://bambuser.com/docs/live/data-scraping/#whitelist-the-scraper](https://bambuser.com/docs/live/data-scraping/#whitelist-the-scraper)

### Why do I get the error (No SKU found on the page – Adding URL as the reference instead)?

This is related to the Bambuser product scraper not being able to find the product reference (sku or product ID) of the added product. I could be because there’s no structured data on the client's website that provides those values. 

You can manually edit a product details and update required product fields.

For more information on how to fix this and troubleshooting see the below link.

[https://bambuser.com/docs/live/data-scraping/](https://bambuser.com/docs/live/data-scraping/)


## Dashboard/Profile

### Is there an ideal size we recommend when companies upload their logo in their profile on dashboard?

For a new logo to be uploaded we recommend 200x200 px.

The logo should be centered, with the same height and weight and it is a 1MB limit.


## Dashboard/Show Editor

### Are you able to download the video after the Live?

Yes, the result will only be raw video. Products will not be included in the download

### Can I download videos in any other format than FLV?

Besides FLV,  MP4 format can be selected as an optional download format from the dashboard.

### Is it possible to download a video with the AI-generated subtitles included directly in the video file?

While you cannot download a video with the subtitles "burned into" the file itself, you can download the AI-generated subtitles as a separate text file. We provide the subtitles in the standard `.SRT` format, which is compatible with most video players and editing software.


## Dashboard/Show setup

### Is there an option to automatically delete a live video after 7 days?

You can only do that through REST API by programming that kind of automation yourself. Otherwise manually through Bambuser Bamhub


## Dashboard/Stats

### Does “Preview” link that is on lcx.bambuser count toward stats

Yes it does


## Dashboard/Subtitles + CC

### Are we able to adjust the amount of text generated from our closed captions feature so that it won’t be too long? When somebody talks fast or there were some words that have many characters used, the caption builds up in multiple lines hiding the video content. Hence, we wanted to confirm if the amount of text per line (or the size of the font) could be adjustable for better visibility.

Unfortunately, there's now way to reduce font size today, but you can always edit the CC after live in the video editor.

### “Changes could not be saved: Captions out of order” - Closed Captions issue

This error appears when the text delivered to the close captions editor has incorrect formatting. The message consists of “Captions out of order” followed by the text fragment that caused the issue. 

The required format for close captions is:

`Number`

`Starting time --> Ending time`

`Text`

Make sure to separate above by an empty line.

An example of a correctly set up captions text:

<aside>
💡 187
00:08:18,799 --> 00:08:22,649
Ecco perché abbiamo parlato così tanto di questa elevazione,

188
00:08:22,660 --> 00:08:24,250
l'elevazione dell'esperienza del negozio,

189
00:08:24,260 --> 00:08:30,809
l'elevazione del prodotto e trattare il cliente con rispetto e farlo innamorare di nuovo.

</aside>


## Dashboard/Theming

### Do you have a playback-speed option

Yep, it's a theming option, in

```
Player Settings - > Misc -> Show playback speed controls
```

.

It's disabled by default and can be enabled by customers if they want.

### Does Bambuser support customizing the player PDP UI? We have our own product card components, and we’d like to reuse them in the livestream.

- Bambuser's in-player PDP is managed through the Theming UI in your dashboard, with options detailed here: [https://knowledge.bambuser.com/onboarding-bambuser/step-3-brand-your-player#player-design-process-0](https://knowledge.bambuser.com/onboarding-bambuser/step-3-brand-your-player#player-design-process-0). Please note that customization is limited to the settings available within that interface. To utilize the in-player PDP functionality (displaying product details directly within the player), cart integration must be enabled. You can find information on setting up cart integration here: [https://bambuser.com/docs/live/cart-integration/](https://bambuser.com/docs/live/cart-integration/). If cart integration is not active, clicking a product will redirect users to the product's page on your own website (your native PDP URL)
- Alternatively, for more comprehensive customization and control, you can leverage Bambuser's App Framework. This allows you to design a custom application interface but requires greater development effort on your end. Read more about the App Framework here: [https://bambuser.com/docs/app-framework/build/api/screen/](https://bambuser.com/docs/app-framework/build/api/screen/).


## Dashboard/Translations

### I have added our main languages to the Bamhub, however there are still some untranslated things here, do we need to add them?

Yes, you're correct. Some strings is left out from our translations as these unfortunately might have been added features after our initial translation and hasn't been updated.

It's also a best practice to go through and see if you wish to change the wordings to match your company's tone of voice, you can edit as you wish for each label.


## Dashboard/Video Source

### Is there a way to download the video from a show with the chat on the screen?

No, there is only direct of downloading a raw file of the video. You can do that after the show has gone live in “Editor” tab.


## Dubbing

### Can we transfer one dubbed Video from one BamHub to another?

You can't directly transfer a dubbed video from a Bam Hub to another, but you can download the dubbed video and upload it to another Bam Hub.


## Integration / Native Mobile

### Can a single web page with a Bambuser player work across web, iOS, and Android, using the default universal code and modified event interactions, without conflicts?

This is feasible. A very common implementation is to have a single page where the embed script and any integration code exists and only change the showId to match the show you want to play. You could, for example, put the showId in a query parameter, read it into a variable and set up the example code with the variable.


## Integration/Client Website

### Can I embed the live video on other websites than my own?

You can embed the video on any website, but if your integration is dependent on an integration to your website's native cart, the add-to-cart functionality won't work.

### Can we have multiple shows with countdowns on our site concurrently?

Yes

### Can we use Google Tag Manager (GTM) to embed the Bambuser player?

Yes, it is possible to integrate Bambuser Live Video Shopping Player through GTM or other tag managing tools.

### Can you provide any code to retrieve the host name in JavaScript in order to display it on live shopping page?

Unfortunately there is no easy way to achieve that as we do not expose host name anywhere on the frontend. It is however possible to do that through calling our REST API endpoints, which would require an API key and backend integration.

1. Get show details first: [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Shows/paths/~1shows~1%7BshowId%7D/get](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Shows/paths/~1shows~1%7BshowId%7D/get)

2. Extract "contributors" ID from response

3. List users in your dashboard through "Contributor ID" [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Users/paths/~1users/get](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Users/paths/~1users/get)

4. In response you will get displayName of the host. You can then use that to display on your live shopping page

### Does Bambuser have the ability to support inserting the Shoppable Video module directly within a product detail page (PDP) image carousel?

While Bambuser does not directly control the integration within third-party website carousels, if the customer has full control over their carousel's code, they should be able to insert Shoppable Videos there. We've discussed options for adding the module to other parts of the PDP (e.g., near the Call-to-Action), but direct integration within a native image carousel would depend on the customer's specific website infrastructure and their ability to customize that code.

### How would could we know that we dont have Bambuser script on our page

To confirm that you only have a CTA element specified on your page but not Bambuser script

1. Navigate to your page where CTA button doesnt work
2. Right click anywhere on the page and click “Inspect”
3. Open console
4. In the console window, copy paste below code 
    
    ```jsx
    if (typeof initBambuserLiveShopping === 'function') {
    alert('Bambuser script exists');
    } else {
    alert('Bambuser script does not exist');
    }
    ```
    
5. Click enter
6. You will get an alert saying whether script exists or not. 
7. If it doesn’t please contact your developers to look into it

### I can't add to cart during test

You need to make sure that you have [cart integration](https://bambuser.com/docs/live/cart-integration) implemented and all event handlers are running correctly.

If you have [cart integration](https://bambuser.com/docs/live/cart-integration) implemented, you can debug further using browser dev tools.

### When clicking a CTA on our page to open the show, nothing happens

For the most cases, that is usually due to the fact that your page does not include Bambuser script. Meaning that your developers will have to look into why that is. If you want to check whether Bambuser script exists on your page, you can follow the steps below: 

When integrating Bambuser player on your website, it is required (except if you are only using FAB or only Channels) that you have at very minimum our embed code on that page. Embed looks something like this:

```
<button id="ID123">Join show now</button>

<script>
  (function() {
    if (!window.initBambuserLiveShopping) {

      window.initBambuserLiveShopping = function(item) { window.initBambuserLiveShopping.queue.push(item) };

      window.initBambuserLiveShopping.queue = [];
      var scriptNode = document.createElement('script');
      scriptNode['src'] = 'https://lcx-embed.bambuser.com/your-brand/embed.js';
      document.body.appendChild(scriptNode);
    }

    window.initBambuserLiveShopping({
      showId: 'SHOW_ID_HERE',
      node: document.getElementById('ID123'),
      type: 'overlay',
    });
  })();
</script>

```

Bambuser script and CTA element (in above case button) are tied together through an id (in our example "ID123"). If the player does not open upon clicking a CTA button that can only mean one of two things:

1. ID that you find in the script is not the same ID you find in the CTA button
2. You only have a CTA element specified on your page but not Bambuser script

To confirm that you only have a CTA element specified on your page but not Bambuser script

1. Navigate to your page where CTA button doesnt work
2. Right click anywhere on the page and click “Inspect”
3. Open console
4. In the console window, copy paste below code 
    
    ```jsx
    if (typeof initBambuserLiveShopping === 'function') {
    alert('Bambuser script exists');
    } else {
    alert('Bambuser script does not exist');
    }
    ```
    
5. Click enter
6. You will get an alert saying whether script exists or not. 
7. If it doesn’t please contact your developers to look into it

### where is the bambuser integration guide

Read our docs: [https://bambuser.com/docs/](https://bambuser.com/docs/)


## Misc

### Do we have Closed Captions Available on replay videos?

Closed captions are available on replays only if they were enabled during the live already.

### Does Bambuser have a backup in case the stream stops working?

Bambuser runs multiple redundant servers in multiple geographic regions to maximize availability.The mobile broadcasting app will automatically attempt to reconnect if there are any temporary network issues. It is even possible to continue streaming to the same show from a different device as long as the show has not been ended.When streaming using third party RTMP applications, a show will automatically end when streaming is stopped/disconnected. In this case, reconnection is only possible after manually re-activating the show. See [https://knowledge.bambuser.com/en_US/mobile/what-to-do-if-a-rtmp-show-goes-down](https://knowledge.bambuser.com/en_US/mobile/what-to-do-if-a-rtmp-show-goes-down) for details. 

We don't support parallel backup streams to the same show. It's been discussed but is not on the roadmap currently

### Does profanity filter include emojis? Can we block emojis from being sent in the chat?

No

### Error: (No SKU found on the page – Adding URL as the reference instead)

This is related to the product scraper not being able to find certain information such as title, thumbnail, brand etc. Due to the lack of structured data on the client's website. As a workaround in the meantime, you can manually edit a product and add title, grab the thumbnail url from the product on the product page and paste that into the product. - For more information on how to fix this and troubleshooting see the below link

Bambuser Live Shopping Product Data Scraping

### How do we verify if the network is good the host?

Our recommended upload speed is 10 Mbps. You can check upload speed on websites like [fast.com](http://fast.com/)

### How will a viewer be notified if we block them in the chat?

They won’t. A viewer being blocked will not notice and they can continue to post in the chat. However, their posts will only visible to themselves and not to anyone else.

### When we upload pre-recorded video, we get “The selected file could not be uploaded” error

The recommended resolution is either 1280x720 or 720x1280. 

See all requirements here: [https://knowledge.bambuser.com/pre-recorded-/broadcast-pre-recorded-video](https://knowledge.bambuser.com/pre-recorded-/broadcast-pre-recorded-video)

### Which browsers does the Live Shopping player work on?

The player is regularly tested on modern versions of Chrome, Safari and Firefox. Both on desktop and on mobile.

The player does not work on Internet Explorer nor iOS Safari 10 and below.

You can see detailed list here: [https://bambuser.com/docs/agreement-details/#one-to-many-1](https://bambuser.com/docs/agreement-details/#one-to-many-1)

### while live, if a viewer joins late, do they have to wait for the show to finish and be available on replay to catch what they have missed?

Viewers joining late can only view the live edge, yes. If the show is made available for on-demand viewing they can view what they missed then


## Mobile App/Chat

### Can the host see the chat messages?

Yes, the broadcasting app is showing the comments.

Note: the interface is slightly different.


## Mobile App/Moderation

### The things you can do as a host/moderator in our streaming mobile app is that you can highlight products and chat, right?

Yes


## Mobile App/Video and Audio

### Can I add music to my live stream broadcasting through liveshopping app?

**Yes!**

When adding music to a live stream there are legal, gears, and operating aspects that need to be considered.

#### Legal:

You have 3 alternatives on how to operate from a legal perspective.

1. **Use unlicensed music.** 
- If you have unlicensed music you have used for promotional content before, you can use this in your live stream as well.
- You can also buy unlicensed music, in this case, there is often a one time cost for the unlicensed song - the cost should never be higher than the price of a regular album in-store.

Make sure to confirm that the music is in fact unlicensed and royalty-free before using it in your live stream.

2. **Use a service provider for commercial music.**

There is several service providers for commercial use of music.

When using a service provider for music, make sure you have a commercial license and not a personal license.

For example, you can use Epidemic Sound, they provide commercial and royalty-free music subscriptions on a month to month basis. Read more on their website: 

3. **Buy music and licenses to use it.** 

If you buy a song or album through a music store, for example, iTunes. You are allowed to use this music for commercial purposes if you pay for the right licenses.

In Sweden, you will in most cases need a license through IFPI and STIM - sometimes NCB. It varies depending on what kind of contract the artist has with its record label. 

On these links you can find more information about the different licenses:

- IFPI:

[Musikanvändare - Ifpi Sverige](https://www.ifpi.se/musikanvandare/)

- STIM:

[Så livesänder du musik på nätet och ser till att låtskrivarna får betalt](https://www.stim.se/sv/musik-online/sa-livesander-du-musik-pa-natet-och-ser-till-att-latskrivarna-far-betalt)

- NCB:

[](http://www.ncb.dk/index.php/using-music/)

#### Gears:

If you want to add music to your stream you will need a RØDE SC6-L adapter. 

You will need to connect your music source (laptop with a 3,5 mm output is recommended as a music source, remember to mute notifications on the laptop!) with a 3,5 mm cable to the RØDE SC6-L.

If you want more than only music, you can connect a microphone to the second input on the RØDE SC6-L.

**Keep in mind: you will need to connect a TRS-TRRS adapter between the 3,5mm cable and the RØDE SC6-L for both the microphone and music source cable.**

If you want to hear the music in the studio in real-time with the stream you can connect a speaker with a 3,5 mm cable to the headphone output on the RØDE SC6-L. Use the iPhone volume buttons to increase the output in the studio.

**Keep in mind: if you have a microphone in addition to the music source you need to be careful so you don't get feedback in the stream.** 

#### Operation:

Step 1: Prepare all cables and connect them in their designated adapters, **do not connect them to the iPhone yet.**

Step 2: Close all apps on the iPhone you will stream from, then restart the phone. *We want to restart the iPhone since this reboots the iOS sound protocols.*

Step 3: Connect the RØDE SC6-L to the iPhone (all cables that's supposed to be connected to the RØDE SC6-L should be connected to the adapter before connecting the adapter to the iPhone).

                *Don't do anything else on the iPhone between these steps*

Step 4: Open the Bambuser LiveShopping app.

Step 4: Go live, turn on the music, and have fun!🎉

**Keep in mind: you need to test which volume level sounds good in the stream. If the music source sends music with high volume the sound will clip in the stream.** 

**We recommend to test thoroughly which input level is good - but for reference, the soundbar in the Bambuser app should stay on the green area, minimal jumps to the yellow area are fine.**

### Can the host streaming from app lock mobile screen during a live show?

The screen will not auto lock, however, there is nothing that stops the host from locking the screen manually. 

Depending on the device and duration, the show will either pause or froze and resumes if the mobile is unlocked within a few seconds. Either way, the user is able to resume the show after unlocking the device.


## Player/Android Player SDK

### Does Bambuser's Shoppable Video SDK have a React Native wrapper for app integration?

Currently, Bambuser **doesn't offer a native React Native wrapper** for its Shoppable Video SDK. However, many merchants have successfully integrated the SDK into their apps by building their own wrappers.


## Player/Cart Integration

### Can a client track abandoned carts?

Bambuser player only tracks add-to-cart events that happens inside the player. All trackings that happens outside of the Bambuser player should be handled by the merchant.

### Every time the iframe loads, the Bambuser cart initialises as empty.

Unfortunately everytime you open a new instance of the Bambuser Player, the cart will be empty. The bi-directional cart sync is currently not supported.

### How is Bambuser checking if a size is available or when to show out of stock error?

If you have Cart Integration then the way it works is like below: 

When a player is initially launched by the end user, **player.EVENT.PROVIDE_PRODUCT_DATA** will trigger. In the handler of this event you are fetching your product details and are passing information such as stock availability for each size variation to the player. More specifically you are passing **.inStock(boolean):** -> If true, then your sizes will be selectable.-> If false, then end user wont be able to select that size (that size button will be inactive).

Now, if your product goes out of stock after an end user has initially launched the show, then your Add to cart API should respond with a out of stock response. That error can be handled within the **player.EVENT.ADD_TO_CART** callback (see example [here](https://bambuser.com/docs/live/cart-integration#handle-add-to-cart-event)). In that case an error will be shown to the user when they try to add that product to the cart. You can also modify that message by going into your **workspace -> Settings -> Translations -> select a specific locale -> modify "**cart.errors.productOutOfStock"

### I cannot see Add to Cart button in Bambuser player UI

If that is the case, it is most often due to you not handling all the required events in your code in order to “unlock” this feature. Make sure to handle all: 

- `PROVIDE_PRODUCT_DATA`
- `ADD_TO_CART`
- `UPDATE_ITEM_IN_CART`
- `CHECKOUT`
- `SYNC CART STATE`

Read more here: [https://bambuser.com/docs/live/cart-integration/](https://bambuser.com/docs/live/cart-integration/)

### Is it ok to load your script only after a certain action on the page?

Yes, you can load it after a certain event on the page. Only note that autoplay will not work in case you add it throgh query parameter: [https://bambuser.com/docs/live/initial-setup/#autoplay](https://bambuser.com/docs/live/initial-setup/#autoplay)

So make sure to handle that as well

### Updating items in the Bambuser cart not working

1To let the player know that the operation was successful or not, you ***MUST*** invoke the `callback` method that is passed as the second argument to your handler method. If the callback method is not called within 30sec, it automatically fails the operation. Same approach applies to `player.EVENT.UPDATE_ITEM_IN_CART` and `player.EVENT.ADD_TO_CART` events handling. To learn more and see examples, checkout the [cart integration documentation](https://bambuser.com/docs/live/cart-integration/#handle-add-to-cart-event).


## Player/Chat

### Can you see FAQ from all chats of all shows in a compiled view?

You can download chats for each show separately and feed it to AI to get FAQ

### If we delete the chat history from a show, how long do you keep the data?

Deleting chat history will permanently remove all messages and there is no way to retrieve it afterwards. They are deleted from Bambuser servers.

### Is there a character limit to a user's chat name?

Yes, the standard limit is 20 characters, but upon request we can limit this to 10.

### Is there a character limit to a user's chat name?

Yes, the standard limit is 20 characters. Upon request we can limit this to 10 characters.

This is maily to make it harder for users to insert personally identifiable information in the chat name.


## Player/Load time

### Player is open but stuck with a spinner

This is possibly a video playback issue. We suggest you to:

- Try another browser/device
- Try another network
- Check the browser DevTool > console for any relevant errors.

### Why do you always start with a lower resolution and then move to a higher one?

We start with a lower resolution to ensure the video begins playing as quickly as possible.

1. We start with the lowest resolution video file, which is much smaller and faster to download. This ensures you can start watching right away, even if your internet connection is a bit slow
2. While the video is playing, our system analyzes your current bandwidth
3. Based on your connection speed, the system then automatically switches to the highest possible resolution it can support, ensuring you get the best quality viewing experience without any interruptions


## Player/Miniplayer

### When clicking on a product, website crashes

This issue is most likely related to Miniplayer. Bambuser Miniplayer adds an iframe element over the merchant’s landing page to let viewers surf the merchant website (inside the iframe) without any interruption or page reload while having the Miniplayer over the iframe.

If website crashes when clicking on a product in miniplayer mode, that usually means one of 3 things: 

1. Product links lead to a different domain that player is integrated on. Usually that happens during testing the player on staging environments, however providing production product links to the player.
2. Response headers from you web server contains [`X-Frame-Options = DENY`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options#syntax) header → Solution to that is that  your developers set [`X-Frame-Options = SAMEORIGIN`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options#syntax) instead. 
3. Response headers from you web server contains  [`Content-Security-Policy: frame-ancestors 'none';`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) header → Solution to that is that  your developers set [`Content-Security-Policy: frame-ancestors 'self';`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) instead. 

You will know by which of above 3 issues is presenting a problem on your website by opening a console, and see which error you get. In Chrome, you open an error by right clicking on the screen and select “Inspect”. Then once you have do this, try to reproduce website crash again. Once it happens, an error will be printed in the console, which will point to one of the 3 issues above. 

You can read more about the compatibility [here](https://bambuser.com/docs/live/miniplayer-compatibility).

Note that if you are on Shopify → Shopify's technical limitations, the [Miniplayer](https://bambuser.com/docs/live/miniplayer) features are **not** compatible with Shopify stores. You will need to [disable the Miniplayer](https://bambuser.com/docs/live/miniplayer#disabling-the-miniplayer) in that case.

### Why does our page reloads when I minimize the player

Bambuser One-to-Many Miniplayer solution is utilizing the concept of rendering your website inside an iframe.

Iframe is created over the your landing page to let your end customers surf the website (inside the iframe) without any interruption while still watching the show. We do this to prevent page reloading while navigating around the website, since page reloading would destroy the instance of Bambuser Liveshopping player.

There is a brief moment when your website's iframe is getting rendered which is causing expected "reload" experience. Note that this isnt an actual page reload, it is just your website’s iframe getting rendered.

If you have an SPA website, you can get around this by implementing manual navigation mode. Just note that when you implement manual navigation mode, yu should also handle **`player.EVENT.NAVIGATE_BEHIND_TO`** event. Read more here: [https://bambuser.com/docs/live/miniplayer#for-spa-websites](https://bambuser.com/docs/live/miniplayer#for-spa-websites)


## Player/Other

### How many simultaneous viewers can Bambuser's live video shopping handle?

Bambuser content delivery network scales automatically which can serve large number of viewers at the same time. Therefore, there are no specific limit on the number of concurrent viewer.


## Player/Product Integration (Hydration)

### Clicking products opens product pages in new tab or background instead of the product showing up inside the player

In order for product showing inside the player, you will have to integrate Cart Integration. When all below events are handled correctly in your code, then products will open in the player:

- `PROVIDE_PRODUCT_DATA`
- `ADD_TO_CART`
- `UPDATE_ITEM_IN_CART`
- `CHECKOUT`
- `SYNC CART STATE`

Read more here: [https://bambuser.com/docs/live/cart-integration](https://bambuser.com/docs/live/cart-integration)

### Is it possible to implement time-limited offers, like a price available for only 10 minutes, in a live show?

Yes, it is possible implement time-limited offers by dynamically updating product data, including prices, during the show using [full cart integration](https://bambuser.com/docs/live/cart-integration/) features. You need to provide new price data for the target product, which requires some implementation on your (merchants) end. If done correctly, prices can be updated as frequently as every 5 seconds or even randomized.

Example code: 

```jsx
<!-- CTA to initiate the show -->
<button id="YOUR_ELEMENT_ID">Open the live</button>

<script>
// ======================================== Dummy product object ==============================================
const dummyProductObjects = [
  {
"1111": {
  productId: "1111",
    name: "Bambuser Hoodie",
    brand: "Bambuser",
    shortDescription: "World's best hoodie",
    description: 
      `<p>Jacket in sweatshirt fabric with a jersey-lined drawstring hood, zip down the front, side pockets and ribbing at the cuffs and hem. Soft brushed inside. Regular Fit.</p><b>Benefits:</b><ul><li>Awesome hoodie</li><li>Set approves</li></ul>`,
    defaultVariationIndex: 0,
    price: 100,
    price_discount: true,
    colors: [{
        variationId: "1111-black",
        name: "Black Bambuser Hoodie",
        colorName: "black",
        colorHexCode: "#000000",
        images: [
          "https://demo.bambuser.shop/wp-content/uploads/2021/07/black-hoodie-front.png",
          "https://demo.bambuser.shop/wp-content/uploads/2021/07/black-hoodie-right.jpeg",
          "https://demo.bambuser.shop/wp-content/uploads/2021/07/black-hoodie-back.jpeg",
          "https://demo.bambuser.shop/wp-content/uploads/2021/07/black-hoodie-left.jpeg"
        ],
        sizes: [{
            sizeId: "1111-black-small",
            currency: "SEK",
            current: 100,
            original: 120,
            name: "Small",
            quantityInStock: 9
          },
          {
            sizeId: "1111-black-xlarge",
            currency: "SEK",
            current: 100,
            original: 120,
            name: "X-Large",
            quantityInStock: 3
          }
        ]
      },
      {
        variationId: "1111-white",
        name: "White Bambuser Hoodie",
        colorName: "white",
        colorHexCode: "#FFFFFF",
        images: [
          "https://demo.bambuser.shop/wp-content/uploads/2021/07/white-hoodie-front.png",
          "https://demo.bambuser.shop/wp-content/uploads/2021/07/white-hoodie-right.jpeg",
          "https://demo.bambuser.shop/wp-content/uploads/2021/07/white-hoodie-back.jpeg",
          "https://demo.bambuser.shop/wp-content/uploads/2021/07/white-hoodie-left.jpeg"
        ],
        sizes: [{
            sizeId: "1111-white-small",
            currency: "SEK",
            current: 100,
            original: 120,
            name: "Small",
            quantityInStock: 8
          },
          {
            sizeId: "1111-white-xlarge",
            currency: "SEK",
            current: 100,
            original: 120,
            name: "X-Large",
            quantityInStock: 0
          }
        ]
      }
    ]
  }
}, {
  "2222": {
    productId: "2222",
    name: "Bambuser Cap",
    brand: "Bambuser",
    shortDescription: "Stylish and comfortable cap",
    description: 
      `<p>A modern cap featuring a curved visor and adjustable back closure. Perfect for sunny days or casual outfits.</p><b>Features:</b><ul><li>Durable fabric</li><li>Adjustable size</li></ul>`,
    defaultVariationIndex: 0,
    price: 50,
    price_discount: false,
    colors: [{
        variationId: "2222-black",
        name: "Black Bambuser Cap",
        colorName: "black",
        colorHexCode: "#000000",
        images: [
          "https://demo.bambuser.shop/wp-content/uploads/2023/12/Fashion_8.png",
        ],
        sizes: [{
            sizeId: "2222-black-adjustable",
            currency: "SEK",
            current: 50,
            original: 50,
            name: "Adjustable",
            quantityInStock: 15
          }
        ]
      },
    ]
  }}
];

// ====================================== Define your own helper methods ==========================================
const storeApi = {};

let currentProductHydrationDataIndex = 0;

// Retrieve the product and return the details
storeApi.getProduct = (productIdentifier) => {
  // TODO: Implement your logic for fetching your own product object
  // e.g. fetch("/products/[productIdentifier]", { method: "GET" });

  for (let productObject of dummyProductObjects) {
    // Check if the key exists in the object
    if (productObject.hasOwnProperty(productIdentifier)) {
      return Promise.resolve(productObject[productIdentifier]) // Return the value if the key is found
    }
  }

  return Promise.resolve(dummyProductObjects[currentProductHydrationDataIndex]);
};

// Add product to the native cart by SKU 
// Return the result (success and reason in case of failure)
storeApi.addToCart = (sku) => {
  // TODO: Implement your logic for adding a product variation to your native cart
  // e.g. fetch("/cart/add", { method: "POST", body: JSON.stringify({ sku: sku, quantity: 1 }) });

  return Promise.resolve({ success: true });
};

// Update the quantity of a product in the native cart by SKU 
// Return the result (success and reason in case of failure)
storeApi.updateItemInCart = (sku, quantity) => {
  // TODO: Implement your logic for updating your native cart
  // e.g. fetch("/cart/update", { method: "POST", body: JSON.stringify({ sku: sku, quantity: quantity }) });

  return Promise.resolve({ success: true });
};

// Remove the product from your native cart by SKU 
// Return the result (success and reason in case of failure)
storeApi.removeItemFromCart = (sku, quantity) => {
  // TODO: Implement your logic for removing the product from your native cart
  // e.g. fetch("/cart/remove", { method: "POST", body: JSON.stringify({ sku: sku, quantity: 0 }) });

  return Promise.resolve({ success: true });
};

// Check if your native cart is empty
storeApi.getCartState = () => {
  // TODO: Implement your logic for 
  // e.g. fetch("/cart/state", { method: "GET" });

  return Promise.resolve(0);
};

//======================================= Bambuser onReady Handler =========================================
window.onBambuserLiveShoppingReady = (player) => {
  // ------------------------------------ Start of player configuration ------------------------------------
  player.configure({
    // Mandatory - if you have cart integration
    // Currency to show prices in
    // The value should be of type string
    currency: "USD", // Can be initialized dynamically

    // Mandatory - if you want to target a language that is not configured for your workspace by default
    // Sets the global locale (language) of the player 
    // Bambuser follow  ISO 639-1 Code + "-" + ISO 3166-2 as standard locale format.
    // The value should be of type string
    locale: "en-US", // Can be initialized dynamically
    buttons: {
      dismiss: player.BUTTON.CLOSE,
      checkout: player.BUTTON.CLOSE
    }
  });
  // ------------------------------------ End of player configuration ------------------------------------

  // NOTE: Cart features will not be visible in the player
  //       unless you handle all events listed below:
  //
  //       ** Cart Integrations **
  //          - player.EVENT.PROVIDE_PRODUCT_DATA
  //          - player.EVENT.ADD_TO_CART
  //          - player.EVENT.UPDATE_ITEM_IN_CART 
  //          - player.EVENT.CHECKOUT
  //          - player.EVENT.SYNC_CART_STATE (optional)

  // ------------------------------------ Start of Cart Integraion ------------------------------------

// The Bambuser player triggers the "PROVIDE_PRODUCT_DATA" event when:
// - When the viewer opens the player
player.on(player.EVENT.PROVIDE_PRODUCT_DATA, (event) => {

// Function to handle product updates
const updateProductData = () => {
  event.products.forEach(({ ref: sku, id: bambuserId }) => {
    storeApi.getProduct(sku).then(yourProduct => {
      player.updateProduct(bambuserId, (productFactory) =>
        productFactory.product((productDetailFactory) =>
          productDetailFactory
            .name(yourProduct.name)
            .brandName(yourProduct.brand)
            .introduction(yourProduct.shortDescription)
            .description(yourProduct.description)
            .sku(yourProduct.productId)
            .defaultVariationIndex(0)
            .variations((variationFactory) =>
              yourProduct.colors.map((variation) =>
                variationFactory()
                  .attributes((attributeFactory) =>
                    attributeFactory
                      .colorName(variation.colorName)
                      .colorHexCode(variation.colorHexCode)
                  )
                  .imageUrls(variation.images)
                  .name(variation.name)
                  .sku(variation.variationId)
                  .sizes((sizeFactory) =>
                    variation.sizes.map((size) =>
                      sizeFactory()
                        .name(size.name)
                        .inStock(size.quantityInStock > 0)
                        .sku(size.sizeId)
                        .price((priceFactory) =>
                          priceFactory
                            .current(size.current)
                            .original(size.original)
                            .currency(size.currency)
                        )
                    )
                  )
              )
            )
        )
      );
    });
  });

  // Log after each interval
  console.log('Product data updated');
  console.log("Black hoodie stock in this iteration", dummyProductObjects[0]["1111"].colors[0].sizes[0].quantityInStock);
};

// Run the product data update immediately
updateProductData();

// Then continue updating every 5 seconds
setInterval(updateProductData, 5000);

});

  // ------------------------------------ Start of Cart Integrations ------------------------------------

  // The Bambuser player triggeres "ADD_TO_CART" event when:
  // - When a viewer clicks on Add to Cart button inside the player
  player.on(player.EVENT.ADD_TO_CART, (addedItem, callback) => {
    storeApi.addToCart(addedItem.sku)
      .then(() => callback(true))
      .catch(error => {
        if (error.message === yourOutOfStockErrorMessage) {
          // Unsuccessful due to "out of stock"!
          callback({
            success: false,
            reason: "out-of-stock",
          });
        } else {
          // Unsuccessful due to other problems
          callback(false);
        }
      });
  });

  // The Bambuser player triggeres "UPDATE_ITEM_IN_CART" event when:
  // - Whenever the viewer modifies quantity from the player cart
  // - Whenever the viewer adds a product to the cart that is already in the player cart
  player.on(player.EVENT.UPDATE_ITEM_IN_CART, (updatedItem, callback) => {
    if (updatedItem.quantity > 0) {
      storeApi.updateItemInCart({
          sku: updatedItem.sku,
          quantity: updatedItem.quantity,
        })
        .then(() => {
          // cart update was successful
          callback(true);
        })
        .catch(function(error) {
          if (error.type === "out-of-stock") {
            callback({
              success: false,
              reason: "out-of-stock",
            });
          } else {
            callback(false);
          }
        });
    }

    // user wants to remove the product from the cart
    if (updatedItem.quantity === 0) {
      storeApi.removeItemFromCart(updatedItem.sku)
        .then(() => {
          // successfully deleted item
          callback(true);
        })
        .catch(() => {
          // failed to delete item
          callback(false);
        });
    }
  })

  // The Bambuser player triggeres "CHECKOUT" event when:
  // - Whenever a viewer clicks the "Checkout" button inside the player cart
  player.on(player.EVENT.CHECKOUT, () => {
    // Use the showCheckout() method and pass
    // a string of absolute URL to your cart/checkout page
    player.showCheckout(window.location.origin + "/cart");
  });

  // The Bambuser player triggeres "SYNC_CART_STATE" event when:
  // - Whenever the viewer navigates back to the player
  player.on(player.EVENT.SYNC_CART_STATE, () => {
    // Use your method to check if the on-site cart is empty or not
    storeApi.getCartState().then((response) => {
      if (response.item_count == 0) {
        // Empty the in-player cart
        // Currently, the update cart does not support anything more than emptying the player cart.
        player.updateCart({
          items: []
        });
      }
    });
  });

  // ------------------------------------ End of Cart Integrations ------------------------------------
};

//======================================== Embed code ==============================================

(function() {
  // ------------------------------------ Initialize the script ----------------------------------------
  if (!window.initBambuserLiveShopping) {
    window.initBambuserLiveShopping = function(item) {
      window.initBambuserLiveShopping.queue.push(item);
    };
    window.initBambuserLiveShopping.queue = [];
    const scriptNode = document.createElement('script');

    // ** NOTE **
    // Embed URL is specific per player theme
    // Find your custom embed URL in the Bambuser Workspace in the code snippet on each show setup page 
    // If your brand theme is not yet released from Bambuser side, the theme will fallback to default theme
    scriptNode['src'] = 'https://lcx-embed.bambuser.com/brand-name/embed.js';
    document.body.appendChild(scriptNode);
  }

  // ---------------------------------- Registering one or more shows ---------------------------------
  // Trigger the player via click event
  // You call this method separately to register multiple shows in a page
  window.initBambuserLiveShopping({
    showId: 'ijbkGNmvptnKaDahLKbE', // REPLACE THIS WITH YOUR OWN SHOW ID
    node: document.getElementById('YOUR_ELEMENT_ID'), // DOM element as CTA button; triggers on click
    type: "overlay" // The type MUST be "overlay"
  });

  // Initiate another show
  // window.initBambuserLiveShopping({
  //   showId: 'YOUR_SHOW_ID_2',
  //    node: document.getElementById('YOUR_ELEMENT_ID_2'),
  //    type: "overlay" 
  //  });

})();
</script>
```


## Player/Profanity List

### Does profanity list block words that are variations of added words?

By default no, but you can reach out to your Bambuser contact person to enable “Match Partial Words” option for Profanity list


## Player/Shows on PDP

### How to auto-close the player, once the video on a PDP is ended

Date: October 23, 2024


## Player/Subtitle CC

### And we could add subtitles somewhere no?

- At the moment we have automatic Closed Captions for live shows and it transcribes in the same language that is spoken during the live. After the show has ended and is going to the recorded version, you can edit the Closed Captions and in that way change the langue if you wish, but this is a quite manual process. Let us know if you wish to use Closed Captions and I'll let the team activate it for your Bam Hub.

[Closed Captions](https://knowledge.bambuser.com/player-settings/closed-captions)


## Player/Translations

### How can I add multiple languages in the player

To add multiple languages in your Video Consultation widget, follow these steps:

1. **Go to Translations**: In your Bambuser web app, navigate to **Translations** under **Settings** in the left-hand menu.
2. **Add Locale**: Click on **+ Language** in the top right corner and select the languages you want to offer your shoppers. Example “sl-SI” for Slovenian locale
3. Add that locale to your Integration code. You can also pass a varible, so that locale changes based user’s location. You just need to identify user’s market and pass correct locale to the Integration code. Note that in order for this to work, step 1 and 2 need to be followed (locale needs to be in your BamHub), otherwise language will default to a locale that is set as a “default” locale. Read more here: [https://bambuser.com/docs/live/player-api-reference/#playerconfigureconfiguration](https://bambuser.com/docs/live/player-api-reference/#playerconfigureconfiguration)
    
    ```jsx
    player.configure({
      locale: "sl-SI",
    });
    ```
    
4. **Customize Text**: You can view and customize the text for each language by clicking on it within the list. Note that due to caching, it might take up to 30min to changes to reflect on your widget. 

This will help you tailor the language options for your customers effectively! If you need further assistance, feel free to ask.

### How does it work then, these are all settings are then detected automatically based on the store?

Based on your integration the language and the product information should come in with the correct language, check with your tech team if they've followed these guides on how to Configure Locale and implemented Multi-market Products accordingly, then it should work automatically. If not, they can send any issues to our tech support so they can help investigate if it doesn't work:

[Player API - Configure LocaleMulti-market Products](https://bambuser.com/docs/live/player-api-reference/#configurationlocale)

### I set the default language to be German as this is our main market. However, in what language should we insert the consent agreement ? Is there a way to translate it too?

ndeed you can only edit the default language in the Get-Started Guide, for the rest of the Chat Terms needs to be manually edited directly in the Translations sections.

[See guide here: Chat Terms: Multiple languages](https://knowledge.bambuser.com/settings/modify-chat-terms#:~:text=about%20the%20change.-,Multiple%20languages,-The%20method%20outlined)


## REST API

### Do the URLs generated when uploading assets to a show have an expiration date?

As long as the show exists, the asset URLs associated with it will remain valid.

### Is the rate limit of 5 calls per 10 seconds in the Bambuser API applied per user/browser or per domain/project, affecting all users combined? Can you clarify how the rate limit is enforced in this context?

The rate limit applies per endpoint. This means that each time you make a request to an endpoint, it counts as one call. If you're trying to retrieve the status of a show, we suggest using webhooks instead. To set up webhooks, you'll need to create an endpoint and add it to your Bambuser dashboard -> Settings -> Integrations -> Webhooks. Subscribe to the "shows" collection. This way, whenever a show's status changes, you'll receive a payload with the updated status and other show information at your endpoint. Specifically, you can look for the "state": "<SOMETHING>" in the webhook payload.

For more details, you can refer to our [webhooks documentation](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Webhooks).

### Should we continue to use the originally generated URL for an asset, or should it be updated periodically?

The URL for the asset will not be modified by Bambuser in any way. It will only become invalid if the asset is deleted.

### What has to happen in so that  Show asset URL stops existing?

- ****
If the show is deleted and not recovered within 30 days, it will be permanently deleted along with all associated assets. In that case, the URL would no longer exist.

### Why does the stats endpoint have 90 days max date range

Our API endpoint has a maximum range of 90 days, with a rate limit of 10 requests per minute for the /stats API. This means clients should batch their requests in groups of 10 and spread them out over individual one-minute windows. As for the 90-day limit, it's in place to ensure our system operates smoothly. We've implemented this measure to maintain performance and manage costs effectively.


## Shows on PDP

### How can I change the starting point of a replay?

You can either Edit the show in our editor, or implement "Shows on PDP” feature, by passing a deeplink to your embed code. Note that this approach requires some backend integration. Read more here. [https://bambuser.com/docs/live/shows-on-pdp/](https://bambuser.com/docs/live/shows-on-pdp/)

### We integrated “Shows on PDPs”. If 2 shows are present the same product, how is it done?

During a show, when a moderator highlights a product, this action generates a deeplink. This deeplink can be fetched through Bambuser’s REST APIs, allowing you to enhance the integration of your product demonstration into your website.

Here’s how you can utilize this feature:

1. **Fetch the Deeplink:**

Use the REST API to retrieve the deeplink generated for the highlighted product during a show.

2. **Integrate the Deeplink:**

Include the deeplink in the player configuration on your product detail page (PDP). 

3. **Handling Multiple Shows:**

If a product is highlighted in more than one show, multiple deeplinks will be available through the API. As the merchant, you can select and pass the desired deeplink and the corresponding show ID (e.g., the latest show) to display on the PDP.

```jsx
// Your very cool interactive element here provided with a id attribute
<div id="myCoolClickableThing-1">Click me!</div>

<div id="myCoolClickableThing-2">Click me!</div>

<script>
  (function() {
    if (!window.initBambuserLiveShopping) {
      window.initBambuserLiveShopping = function(item) { window.initBambuserLiveShopping.queue.push(item) };
      window.initBambuserLiveShopping.queue = [];
      var scriptNode = document.createElement('script');
      scriptNode['src'] = 'https://lcx-embed.bambuser.com/embed.js';
      document.body.appendChild(scriptNode);
    }

    // We can embed multiple shows in a single page as below
    // node: The trigger element for opening the reletive show
    window.initBambuserLiveShopping({
    showId: 'BAMBUSER-LIVESHOPPING-SHOW-ID-HERE',
      node: document.getElementById('myCoolClickableThing-1'),
      deeplink: 'DEEPLINK_HERE_1',
      type: 'overlay',
    });

    window.initBambuserLiveShopping({
      showId: 'BAMBUSER-LIVESHOPPING-SHOW-ID-HERE',
      node: document.getElementById('myCoolClickableThing-2'),
      deeplink: 'DEEPLINK_HERE_2',
      type: 'overlay',
    });
  })();
</script>

```


## Widgets/Channels

### Can we have two or more channels embedded on a same page?

There is no limitation on the number of Channels you can embed on a single page on your website. 

Read more about how to embed Channels on your website here: [https://bambuser.com/docs/live/channel](https://bambuser.com/docs/live/channel)

### How do I change the layout of my Channels to look like the preview?

The channel's responsiveness depends on the width of the container it is embedded in. If the container's width is small, the channel will adjust to a mobile layout. The reason the layout could appear differently on your website compared to the preview is that the container width is not large enough on your website. Please ask your developer to increase the container's width.


## Widgets/FAB

### Can the FAB be set up so it does not reappear after a user has dismissed it, even if they return to the website later?

Yes, it’s possible to prevent the FAB from reappearing for a specific time period, such as 24 hours, after a user has dismissed it. However, this requires custom code to set a cookie that tracks the user’s dismissal of the FAB.

Here’s an approach using JavaScript that leverages the `onBambuserWidgetReady` event to detect when a user closes the FAB and then stores a cookie to remember this dismissal. This cookie can be checked each time the FAB attempts to display, and if it’s still valid, the FAB will remain hidden.

```jsx
<script>
  window.onBambuserWidgetReady = widget => {
    widget.on(widget.EVENT.FLOATING.DISMISS, (eventData) => {
      console.log('🧩 Triggered event: widget.EVENT.FLOATING.DISMISS');
      console.log('🧩 Event payload:', eventData);
      // Set a cookie if the FAB widget was dismissed by the user.
      const expiryDate = new Date();
      expiryDate.setDate(expiryDate.getDate() + 1);
      document.cookie = `bambuserFabDismissed=true; expires=${expiryDate.toUTCString()}; path=/`;
    });

    widget.on(widget.EVENT.FLOATING.PRESENT, (eventData) => {
      console.log('🧩 Triggered event: widget.EVENT.FLOATING.PRESENT');
      console.log('🧩 Event payload:', eventData);
      // Check if the FAB widget was dismissed by the user.
      const widgetDismissed = document.cookie.includes('bambuserFabDismissed=true');
      if (widgetDismissed) {
        const widgetContainer = document.querySelector(`[data-bambuser-liveshopping-widget-id="${eventData.containerId}"]`)
        widgetContainer.style.display = 'none';
      }
    });
  };
</script>

```

**Explanation of the Code:**

- When the FAB is dismissed by the user, a cookie named `bambuserFabDismissed` is created with an expiration of 24 hours.
- Each time the FAB tries to present itself, the code checks for the `bambuserFabDismissed` cookie. If the cookie is found, the FAB remains hidden by setting its `display` property to `none`.

### Can we create a custom FAB?

If you dont want to use our FAB and instead show some custom Widget on your website when show goes live, you can do that by utilizing our webhooks. For that, you would have to set up an endpoint, which you would then add to Bambuser dashboard -> Settings -> Integrations -> Webhooks. In there add your endpoint URL and subscribe to [show collection](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#section/Show). 

Whenever a show goes live, update-show webhook will be send to your endpoint with a payload. In the payload you will find **isLive** or **state.**

You can control UI on your website, based on what state the show is in.

### For the FAB pop up for past shows, is there a way to make it live on desktop view only not mobile?

This can be done by on the customer side by an small coding effort. 

Use a condition for executing the FAB embed script.

 Here is an example:

```
<script>
function isMobile() {
  // You can change the logic here to your preferred one.
  const regex = /Mobi|Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i;
  return regex.test(navigator.userAgent);
}

if (!isMobile()) {
  (function(d, t, i, w) {
      window.__bfwId = w;
      if (d.getElementById(i) && window.__bfwInit) return window.__bfwInit();
      if (d.getElementById(i)) return;
      var s, ss = d.getElementsByTagName(t)[0];
      s = d.createElement(t); s.id = i;
      s.src = 'https://lcx-widgets.bambuser.com/embed.js';
      ss.parentNode.insertBefore(s, ss);
    })(document, 'script', 'bambuser-liveshopping-widget', 'CHANNEL_ID');
}
</script>

```

- So, it detects if the user is using a mobile device or not.
- If not mobile, it executes the FAB embed code.

### How can I manage 2 different FABs on same page?

The key takeaway is that only **one FAB can be active on a page at a time**. If you have two FABs embedded on the same page, the one that appears later in the page's code (its position in the **DOM**, or Document Object Model) will be the one that is displayed.

To achieve your goal of having both category-specific FABs and a universal brand campaign FAB, you can use a tag manager like Google Tag Manager (GTM).

Here’s the recommended approach:

1. **Add category-specific FABs** to the relevant pages (e.g., your makeup and skincare pages) using a tag manager or by embedding the code directly.
2. **Add a separate tag for your main brand campaign FAB** and set it up to run with a **higher priority** than the other tags in your tag manager.
3. When you want to run the brand campaign, simply activate this main FAB tag. Because it has a higher priority, it will override the category-specific FABs on those pages and display your brand campaign instead.

This method gives you the flexibility to display targeted campaigns most of the time while ensuring your key brand campaigns can take over the entire site when needed.

### What is the FAB display behavior for Post-Live/Recorded?

Date: June 5, 2024

What preview is displayed in the Recorded (Post-Live) FAB window? In the LIVE FAB it's the current preview, what do you see in Post-Live?

- You see first 10 seconds of the recorded show before you get prompted with "continue watching”

Is it possible to customize what preview is shown in the Post-Live FAB display? If client wants image or a specific preview?

- No cannot customize preview for FAB
