# FAQ — Cross-product & general

Curated internal Q&A for common customer questions, organized by topic. Sourced from Bambuser's support FAQ database. Where an answer involves exact limits, prices, hosts, or config keys, verify against the live docs (`bambuser.com/docs/llms.txt`) or the knowledge base (`knowledge.bambuser.com`) before relying on it.


## Agent Tool/Cart Integration

### Is it possible to integrate so that customers add to wish list instead of add to cart?

*Applies to: Live, Shoppable-Video, Video-Consultation*

Not officially, but as a workaround you can use Cart Integration events for “add to cart” to instead call your API to “Add to wishlist” instead. Just note that this way you also need to change your translation keys to reflect that. Also note that if you use this workaround, you cannot have “Add to cart” at the same time as “Add to wishlist”

Read more on add to cart events here: [https://bambuser.com/docs/live/cart-integration/](https://bambuser.com/docs/live/cart-integration/)


## Analytics/Conversion Tracking

### Conversion Tracking based on user consent/ if user do not allow cookies

*Applies to: Live, Video-Consultation*

1.	To allow users to opt out of cookies/tracking, you can disable first-party cookies by adding a configuration code to the Bambuser Player. Refer to the usage examples in the following link: [Bambuser Player API Reference](https://bambuser.com/docs/live/player-api-reference/#configurationenablefirstpartycookies).

3.	Disabling first-party cookies is a player configuration task that should be implemented in the same location where you configure the player, specifically within the onBambuserLiveShoppingReady method.

### How can we classify Bambuser cookies. Are these cookies necessary cookies, functional cookies, statistical cookies or marketing cookies?

*Applies to: Live, Video-Consultation*

These cookies are essential for Conversion Tracking to function. While we generally classify cookies as “necessary” or “functional,” we cannot fully determine how your team plans to use the data. As the data controllers, it’s up to you to decide how to categorize the cookies accordingly.

### How do you track purchases?

*Applies to: Live, Video-Consultation*

Purchases are tracked using the "bambuser Conversion tracking script" which a client implements on their website. Read more about how to implement Conversion Tracker here: [https://bambuser.com/docs/live/conversion-tracking](https://bambuser.com/docs/live/conversion-tracking)

When end user interacts with Bambuser product, they will get some cookies injected on their browser. If they then make a purchase in the next 30 days, that purchase will count toward that show / call. This will only happen if cookies are still there → Meaning that end-user will have to be on same browser, same device and they should not have cleared cookies.

### How does Bambuser track “Purchases”

*Applies to: Live, Video-Consultation*

#### How does Bambuser Track Purhcases

Purchases are tracked using the "Bambuser Conversion Tracking script" which a merchant’s implements on their website. Using the collect method of the script, purchases are sent to our servers. See how to implement Bambuser Conversion Tracker here: [https://bambuser.com/docs/live/conversion-tracking](https://bambuser.com/docs/live/conversion-tracking)

#### What qualifies as a purchase (and when do we track them) in One-to-Many?

A purchase is defined as when a user of the clients website has watched a live or recorded show within the last 30 days, and makes a purchase on their site. The purchase will be attributed to the last watched show. If it was more than 30 days since the user last watched a show on the clients website, or if the user has not watched any live show, the purchase will never even be sent to our servers. Note that it is not guaranteed that the products attributed to the show have actually been presented in the show.

#### What qualifies as a purchase (and when do we track them) in One-to-One?

A purchase is defined as when an end user has been in a one-to-one call in the last 30 days, and makes a purchase on their site. The purchase will be attributed to the last call. If it was more than 30 days since the user has had a call on clients website, or if the user has not had any calls, the purchase will never even be sent to our servers. Note that it is not guaranteed that the products attributed to the call have been discussed in the call.

#### By currency

We track the currency a purchase was made in and make it available to see the total value of purchases in that currency via the dashboard. For example there might have been purchases in SEK that totalled 25 000 in that currency, and purchases in DKK that totaled 13 000 in that currency

*If the organisation has set USD as their display currency, the sales in their respective currency would convert to USD and be added together, displaying **$5122** as the total sales value. (25 000 SEK = 2996 USD, 13 000 DKK = 2126 USD, 2996 + 2126 = 5122)*

### How to access/export the tracked conversions/purchases/sales?

*Applies to: Live, Video-Consultation*

- You can download the tracked purchase data from the Bambuser dashboard in CSV format. Learn more on [Stats CSV Export](https://knowledge.bambuser.com/csv-file).

### In Bambuser we cannot see any purchase data?

*Applies to: Live, Video-Consultation*

There could be many reasons for that. 

1. You have just made a purchase and stats have not yet been updated. This can take up to few hours. 
2. You have not followed the proper steps when testing. Please follow it here: [https://bambuser.com/docs/live/conversion-tracking#troubleshoot](https://bambuser.com/docs/live/conversion-tracking#troubleshoot)
3. The URL for the tracking library is different based on the region your dashbaord was created. You must use the URL that is associated with their dashboard’s region.
    - Global: [https://cdn.liveshopping.bambuser.com/metrics/bambuser.min.js](https://cdn.liveshopping.bambuser.com/metrics/bambuser.min.js)
    - EU: [https://cdn.liveshopping.bambuser.com/metrics/bambuser-eu.min.js](https://cdn.liveshopping.bambuser.com/metrics/bambuser-eu.min.js)
4. The code/tag is not firing
    1. Sometimes the Conversion Tracking does not collect any information because the code snippet/GTM tag has not been implemented correctly, and the script never gets executed.
    
        
        **Bambuser GTM tag**
        
        - Make sure you set the correct trigger (To fire the tag on the order confirmation page)
        - You can turn on the Debug mode on the Bambuser tag > settings, so you can see some logs on the Browser console when running a test order
        
        **Custom Tag**
        
        - Could you make sure the container code is error-free? You can also ensure that there is no relevant error in the browser console when running a test.
        - Make sure you set the correct trigger (To fire the tag on the order confirmation page)


## Analytics/Others

### Can I add UTM tags to product URLs?

*Applies to: Live, Shoppable-Video*

Yes!

When adding products, you can include any query parameters such as UTM tags to the URL you are adding.

This can be also automated by [overriding product URLs](https://bambuser.com/docs/live/player-api-reference#override-products-url) in the Bambuser player integration where the products URL can be programatically modified.

### How do you calculate “average viewing time”?

*Applies to: *

Average viewing time is calculated by the total amount of viewed seconds of a segment (total / live / recorded) divided by the total amount of sessions during the same segment.

- Total: seconds viewed on live video + seconds viewed on recorded video) / number of unique sessions
- Live: seconds viewed on live video / number of unique sessions that included viewing of live video
- Recorded: seconds viewed on recorded video / number of unique sessions that included viewing of recorded video

#### Example:

<aside>
💡 We have three people: **Mary**, **Sophie** and **Jesper**.
We will call average viewing time "AVT".

**Jesper** watches 30 seconds of the show LIVE.
*(30 sec AVT LIVE, 0 sec AVT RECORDED, 30 sec AVT TOTAL)*

**Mary** watches 30 seconds of the show LIVE, then directly proceeds to watch another 30 seconds of the show RECORDED.
*(30 sec AVT LIVE, 30 sec AVT RECORDED, 1 min AVT TOTAL)*

**Sophie** watches 30 seconds of the show LIVE, then waits 30 minutes, then watches 30 seconds of the show RECORDED.
*(30 sec AVT LIVE, 30 sec AVT RECORDED, 30 sec AVT TOTAL)*

AVT TOTAL: 37,5 sec
AVT LIVE: 30 sec
AVT RECORDED: 30 sec

</aside>

### How does the upgrade of the enchanced tracking (Shopper Events) affect my web performance

*Applies to: Live, Shoppable-Video, Video-Consultation*

***Optimized for efficiency:***

*The updated purchase tracking will send slightly more data than before, but we’ve made the data package as small as possible. Purchase tracking is also a low-frequency event and typically runs after the page has loaded, so it does not affect site speed or user experience.*

***Additional event tracking:***

*As part of this upgrade, we recommend adding events such as product-view, add-to-cart, and add-to-wishlist. Of these, product-view would be the most frequent and requires adding a small tracking script (only 4.1kB, heavily cached) to PDPs. This means it will only affect first-time loads; subsequent loads will use the cached version.*

***Smart batching:***

*All tracking data is queued and sent in batches as late as possible, ensuring no noticeable impact on shoppers’ browsers, networks, or the overall site experience.*

*By implementing these upgrades, you’ll gain deeper insights into the full shopper journey, from impressions to video views, add-to-carts, and purchases, with virtually no downside in terms of performance."*

### What is Conversion Tracker?

*Applies to: Chat, Live, Shoppable-Video, Video-Consultation*

Back in the day, we used to have a tracking script which merchants would add on their “Order Confirmation” page, in order to track purhases. This has since been evolved into a “Shopper Events”, where we do not only have conversion part of the script, but rather accept even other events in order to enhance analytics. 

“Conversion tracker” would refer to only one event of “Shopper Events” - which is "purchase” event: [https://bambuser.com/docs/live/shopper-events-tracking/#2-send-event-data](https://bambuser.com/docs/live/shopper-events-tracking/#2-send-event-data)

If you still have a legacy conversion tracker, it should still work, however, we would recommend to migrate to new enhance Shopper events in order to provide more granular data for that specific event, as well as to provide even more events. See guide here: [https://bambuser.com/docs/live/migrate-from-legacy-conversion-tracking/](https://bambuser.com/docs/live/migrate-from-legacy-conversion-tracking/)


## Analytics/Player Metrics

### How can we distinguish between "Live" and "Shoppable" videos in the Bambuser tracking events (specifically bambuser-liveshop-tracking-point)?

*Applies to: Live, Shoppable-Video*

To distinguish between "Live" and "Shoppable" video types, you can rely on the `sourceApp` property included in the tracking data. Here's how the values typically appear:

- **Live Video:** `sourceApp: "player-web"`
- **Shoppable Video (VOD):**
    - `sourceApp: "vod-player-web"` - for expanded player
    - `sourceApp: "vod-player-web-components"`- for non-expanded player


## App Framework

### Do appManifest and appConfig stored on the Bambsuer side?

*Applies to: Live, Video-Consultation*

Yes! When creating an app (using [Bambuser App Framework](https://bambuser.com/docs/app-framework/)), the `appManifest` and `appConfig` are set (by your developers) through the Bambuser App Framework [API](https://liveshopping-api.bambuser.com/v1/docs/api?id=apps).

You can get the app details using below [API endpoint](https://liveshopping-api.bambuser.com/v1/docs/api?id=apps#tag/Apps/paths/~1apps~1:id/get):

`GET https://liveshopping-api.bambuser.com/v1/apps/:id`

If you need to update them, you can [create a new app revision](https://liveshopping-api.bambuser.com/v1/docs/api?id=apps#tag/Apps/paths/~1apps~1:id~1revisions/post).

Note that the app can be updated (by creating creating app revisions) or removed by API keys tied to the same organization ID that initially created the app.

### How to install an app (created by Bambuser App Framework) on other dashboards/BamHubs/Workspaces/Organizations?

*Applies to: Live, Video-Consultation*

To install an app ([App Framework](https://bambuser.com/docs/app-framework/)) on other organizations, you need an installation key issued by the app creator organization. 

- Steps:
    1. [Create an Installation key](https://liveshopping-api.bambuser.com/v1/docs/api?id=apps#tag/Apps/paths/~1apps~1:id~1installation-keys/post) using an API key belong to the organization/BamHub/dashboard that initially created the app (app owner). If you do not own the app, you need to request an installation key from the app developer.
    2. On your other dashboard (which you want to install the app on), [create an API key](https://knowledge.bambuser.com/settings/generating-api-keys) with relevant `App Developers` scopes granted.
    3. [Install the app](https://liveshopping-api.bambuser.com/v1/docs/api?id=apps#tag/Installations/paths/~1app-installations/post) using the API key you created under the target organization's dashboard.


## Bambuser Licence

### Can I still access my data or recorded content after Bambuser licence expiration date?

*Applies to: Chat, Live, Shoppable-Video, Video-Consultation*

We provide a **30-day grace period** following the expiration of your license. During this time, you can still log in to the platform specifically to download your existing content and media. After this 30-day window, access to the dashboard will be fully suspended.


## Call Widget/Product hydration

### Can you re-use your 1:Many production hydration for the 1:1 product?

*Applies to: Live, Video-Consultation*

Yes. Although more product data can be hydrated in the product integration for 1:1, so there are certain minor additions to do.

**Specifics for 1:1:**

The product integration (hydration) can be done either through [provide product data](https://bambuser.com/docs/video-consultation/provide-product-data) or [provide search data](https://bambuser.com/docs/video-consultation/providing-search-data), meaning agents will be able to add products to the call in different ways depending on the chosen integration.


## Call Widget/Translations

### How do I make changes in copy/ translations?

*Applies to: Live, Video-Consultation*

Regarding copy changes -> you can do that on your own by logging to your Bamhub -> Settings -> Translations -> Pick locale you want to modify -> Type your copy in the search on top right -> Click on it -> Modify translations -> Click "Save and publish" -> Modified translations should reflected in the next hour.


## Cookies

### How do I remove Bambuser related cookies?

*Applies to: Chat, Live, Shoppable-Video, Video-Consultation*

- right click on your website/page
- click inspect
- Go to Application tab
- Find Cookies in the left side menu
- Expand Cookies and find the domain of the merchant site you are on, select that domain
- Type “bamls” in the filter field on top
- Select and click backspace or right click and delete all the cookies starting with “bamls”
- Type “hero” in the filter field on top
- Select and click backspace or right click and delete all the cookies starting with “hero”

Reload browser (You should now have new state)


## Dashboard/Other

### Bambuser dashboards opens in the browser instead of the mobile app

*Applies to: Live, Video-Consultation*

That is a common issue if user is requesting the magic link from desktop but opening it on the phone. Make sure to request magic link from mobile broadcasting app istead.

### Can you connect your 1:Many Admin User with the 1:1 dashboard?

*Applies to: Live, Video-Consultation*

Yes. It is possible to have one User connected to both of the products by having both permission roles.

### I get empty screen when I try to login to Dashboard

*Applies to: Live, Video-Consultation*

This could be caused by a firewall on your internet connection at your office.
Try with your personal home wifi or mobile 4G internet. If it works with your personal internet, then you need to contact your office network administrator.


## Dashboard/Product scraping

### Is it possible to manage or use PDPs not yet published in the components?

*Applies to: Live, Shoppable-Video*

As long as the product URL exists, it should be possible. From Bambuser's end, there is no need for the product to be published. What happens when that product gets clicked from the show should be defined in the integration.

### Our product images are blurry

*Applies to: Live, Shoppable-Video*

If your product images are blurry, this is most likely because you are providing images that are low quality or are very small. 

To verify that that, open up your product in Bam Hub, copy your thumbnail URL and open it in another tab. There you will see if image is indeed small or not.  

To resolve this, we recommend uploading higher-quality images in the thumbnail field. Additionally, you can automate this process to ensure higher-quality images are fetched when they are first added to the dashboard (via the product scraper). This can be done by modifying your PDP structure to provide higher-resolution thumbnails in the schema used by our scraper. You can find details about the supported structures here:

[https://bambuser.com/docs/live/data-scraping/#1-schemaorg-markup](https://bambuser.com/docs/live/data-scraping/#1-schemaorg-markup)

If thubmnail image provided in the Thumbnail URL field is not low quality, but you have Cart Integration, it might be due to you providing us with low quality images through PROVIDE_PRODUCT_DATA event. More specifically within the images array. Please consult your developer to confirm that and redefine what kind of images are provided. Read more here: [https://bambuser.com/docs/live/cart-integration/#providing-more-data-to-player-products](https://bambuser.com/docs/live/cart-integration/#providing-more-data-to-player-products)


## Dashboard/Stats

### What are all the datas from Bambuser that we can fetch through APIs

*Applies to: Live, Video-Consultation*

**One-to-many**

- **REST API**

The Bambuser [One-to-Many](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Statistics) `/stats` [REST API](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Statistics) is providing very similar data points compared to the dashboard stats page and the CSV export.However, the result from the API is provided in JSON format which enables seamless data integration.

- **Client-side tracking**

[Bambuser Player Metrics](https://bambuser.com/docs/live/player-metrics/) exposes most events and interactions made by each user. Bambuser Player Metrics's data is available to be listened to on the front-end where the Bambuser player is embedded.

**One-to-One**

- **REST API**

The Bambuser [One-to-One](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#tag/Statistics) `/stats` [REST API](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#tag/Statistics) provides no extra data compared to the dashboard stats page and the CSV export.However, the result from the API is provided in JSON format which enables seamless data integration.

- **Client-side tracking**

[Bambuser One-to-One event tracking](https://bambuser.com/docs/video-consultation/tracking-events) also provides additional client-side user tracking that can be implemented on the merchant's site or front-end application.


## Dashboard/Theming

### How long does it take for the theming changes to be reflected to the actual player or widget?

*Applies to: Live, Video-Consultation*

It should be instant


## Dashboard/User Management

### What are your password requirements?

*Applies to: Live, Video-Consultation*

For the Bambuser Dashboard application the password must contain 12 characters, one letter and one number. We do not require passwords to be changed regularly.

Other apps and services that we use have their own hard requirements but they are covered by our password policy which require all passwords to be at least 12 characters. 

See policys for further, and more detailed info. At present the Password policy (internal document).


## Integration/Client Website

### Hey how do I integrate the SFRA SFCC cartridge?

*Applies to: Chat, Live, Shoppable-Video, Video-Consultation*

We do not have specific integration with  SFRA SFCC cartridge, therefore regular documentation applies here: [https://bambuser.com/docs/](https://bambuser.com/docs/)

### How can we run a test without anyone outside my organization/brand finding out?

*Applies to: Live, Video-Consultation*

We recommend that you create a hidden landing page on your end.

### We are migrating to a new e-commerce platform. Does Bambuser need to do any changes on their side?

*Applies to: Live, Video-Consultation*

There should be no need to change anything on Bambuser side

### We need the system to integrate with the Prestashop CMS

*Applies to: Live, Video-Consultation*

Bambuser Live Shopping solution is a platform agnostic and can be embedded in/integrated with any platform. More information on how that can be done can be found in our Technical Documentation.

### What is Product Hydration?

*Applies to: Live, Shoppable-Video, Video-Consultation*

**Product Hydration** is a Bambuser feature that allows product information (such as titles, images, prices, and availability) to be dynamically pulled from your e-commerce site through api and displayed within the Bambuser. It requires merchant integration, for Live and Shoppable video, it means that it required handlig EVENT.PROVIDE_PRODUCT_DATA, and for Video Consulstation it means handling provide-product-data event. 

If user has both Product Hydration and Product Feed setup, then Product hydration will take precedence (priority).

### where can I find the organization id / orgId?

*Applies to: Live, Shoppable-Video, Video-Consultation*

Your dashboard or organization ID can be found in Bambuser workspace URL 

- `https://lcx.bambuser.com/[YOUR_ORG_ID]/...`


## Login Other

### After clicking on a magic link , we get a white screen or dashboard is very slow

*Applies to: Live, Video-Consultation*

This kinds of issues are most common when your company computers have some extra-secure firewalls installed. Most likely this issues get resolved by using personal computers and by switching to a different network (4G/ 5G). If that is the case for you, you would have to contact  IT admin to allow for [https://lcx.bambuser.com/](https://lcx.bambuser.com/) and [https://lcx-eu.bambuser.com/](https://lcx-eu.bambuser.com/) domains.

### I do not receive an email when I request for a Magic Link

*Applies to: Live, Video-Consultation*

There could be many issues that would lead to your magic links not being sent. Follow below steps to trobleshoot:

1. Check your spam folder.
2. Verify that the email used for the account login is the same one you have on your email client.
3. Verify that you are logging in to the correct URL. On desktop, if your dashboard is set up on global servers, you should use [https://lcx.bambuser.com/](https://lcx.bambuser.com/) to log in. If it is set up on European servers, then use [https://lcx-eu.bambuser.com/](https://lcx-eu.bambuser.com/). If you are trying to log in through mobile app, make sure to chose the right region. You can select the region on the login screen.
4. If you have set up a password before, try logging in with password instead.
5. Check with your IT administrator regarding possibility of your company email provider could be blocking emails coming from noreply@bambuser.net.
6. Reach out to Bambuser support at support@bambuser.com

### We get Error when clicking on magic link (Action code is invalid)

*Applies to: Live, Video-Consultation*

That can happen due to couple different reasons: 

1. You are using an expired Magic link 
    1. Could be because you have requested a new magic link before you clicked on that one
    2. Could because it has been longer than 1 hour from when you requested the magic link to the point that you clicked on it
2. You are requesting a magic link from mobile broadcasting app but clicking on it through dashboard. It is expected that this wouldnt work. So make sure that you request the magic link from the same device that you are then also clicking it on

### What is your password requirement?

*Applies to: Chat, Live, Shoppable-Video, Video-Consultation*

**A password must have at least 12 characters, one letter and one number**


## Login/Magic Link

### How long does a magic link / password reset link work after it is issued?

*Applies to: Live, Video-Consultation*

Login links expires around 6 hours mark. 

Reset password links expires around 1 hour mark.

Note that these links are single-use links. Once clicked, can't be used again, so the user needs to request a new link.


## Login/SSO

### Do Bambuser offer SSO login to the dashboard?

*Applies to: Live, Video-Consultation*

Yes, Single-sign-on (SSO) is available for authentication on the Bambuser platform.

**Supported SSO Solutions:**

- SAML via Okta
- OpenID Connect (OIDC) via Microsoft Azure App
- SAML via custom provider

For more information, reach out to your point of contact at Bambuser.


## Misc

### Are Bambuser products ADA complience?

*Applies to: Live, Shoppable-Video, Video-Consultation*

Bambuser conducts external audits to help us keep our products as accessible as possible.

In order to be more compliant with ADA recommendations, Bambuser’s web accessibility is being audited by a third-party consulting firm.

The audit performs with regards to Web Content Accessibility Guidelines (WCAG) 2.1 standards. It consists of a mix of different methods specified below:

- Tool-Based Testing (fully automated tests)
- Assistive Technology Previews (external tool that helps with testing)
- Manual Accessibility Testing (manual testing from people both with and without disabilities)

### Are Bambuser servers eco-friendly

*Applies to: Chat, Live, Shoppable-Video, Video-Consultation*

We use AWS and GCP, read more on sustainability from both providers here: 

- https://aws.amazon.com/sustainability/

- [https://sustainability.google/](https://sustainability.google/)

### Can Bambuser support helping setup for external tools like Bazaarvoice?

*Applies to: *

Bambuser support specializes in providing expertise exclusively on our own product suite. As a result, we are unable to offer assistance with external tools, such as setting up or integrating Bazaarvoice

### Can you configure how Action card opens?

*Applies to: Live, Shoppable-Video*

When creating an action card, you can decide if it should open in the current tab or a new tab.

### How can we have a different format of videos depending if I’m on desktop or mobile.

*Applies to: *

If you’re looking to use different formats (aspect ratios) for your raw video files, you’ll need to upload two separate videos and create two distinct playlists. Additionally, you’ll want to recognize the user’s device and display the appropriate playlist based on whether they are on mobile or desktop.

If you’re referring to the layout of the playlist itself, please note that this adjusts automatically. For instance, when viewed on mobile, the videos in the playlist will be scrollable vertically, while on desktop, they will scroll horizontally.

I hope this helps! If you have any further questions or need more clarification, please feel free to ask.

Best regards,

### How long does it take to integrate Bambuser

*Applies to: Live, Video-Consultation*

The time for integration of 1:M solution can very depending of many different factors.

It is important to take in the account not only the hours of pure development, but also the time for reading documentation, setting up a landing page, testing, releases, etc...

On average, we have seen that existing merchants needed about 2-3 weeks for Bambuser for the entire process. 

**It depends on:** 
- Developer resources 
- What features you will integrate
- How many pre-defined requirements merchant already fulfills from the start of integration / how their systems are set up

Therefore we recommend that you check our technical documentation [here](https://bambuser.com/docs/) and answer that question based on that

### What is Bambuser

*Applies to: Chat, Live, Shoppable-Video, Video-Consultation*

Bambuser is a **live video shopping platform** that enables businesses to host interactive, real-time shopping experiences directly on their websites or apps. It specializes in **live commerce solutions**, allowing brands to engage with their customers via shoppable videos, where viewers can watch, interact, and make purchases all in one seamless experience.

#### Key Features:

1. **Live Shopping:**
    
    Allows businesses to broadcast live video streams where hosts can showcase products. Viewers can shop directly during the live stream.
    
2. **One-to-Many and One-to-One Shopping:**
    - *One-to-Many:* Live events where multiple customers tune in simultaneously.
    - *One-to-One:* Personalized video calls between a sales associate and a customer.
3. **Shoppable Video:**
    
    Enables clickable links or product highlights during live streams or pre-recorded videos, making it easy for customers to add items to their carts.
    
4. **Engagement Tools:**
    
    Interactive features like chat, polls, and reactions to boost audience participation.
    
5. **Analytics:**
    
    Insights into viewer behavior, engagement rates, and conversion metrics to optimize future events.
    
6. **Integration-Friendly:**
    
    Works seamlessly with existing e-commerce platforms and tools.

### When a user accepts the Terms and Conditions (T&Cs) for live chat, is that information stored in Bambuser database?

*Applies to: Live, Video-Consultation*

Bambuser's platform does not create or persist user accounts for shoppers. Therefore, we do not store personal information from users who engage with the live chat.

However, when a user accepts the T&Cs, an "event" is logged in our analytics database. This event simply registers that the action (clicking the "I accept" button) occurred. It does not store any personally identifiable information about the user. This approach ensures user privacy while still allowing us to track engagement with the live chat feature


## Player/Cart Integration

### Color and sizes are bundled together in player PDP. We want to display color and sizes in two sections instead

*Applies to: Live, Shoppable-Video*

---

Adjustments needed to display your product variants with colors and sizes as two separate sections.

1. Structure Requirement
Currently, your product variants are organized in a flat structure as follows:
- Black / 35
- Black / 36
- Cream / 36
- Cream / 37

This flat structure is the default organization for Shopify product objects. However, our product hydration code (PROVIDE_PRODUCT_DATA) requires a hierarchical structure to display variations in two sections. For example, the desired format should be:

Black

- 35
- 36
Cream
- 36
- 37
1. Number of Divisions Requirement
It’s important to note that our product hydration code supports a maximum of two divisions. This means you can set up a structure for color and size, but not for additional options like material. Consequently, the code cannot display three divisions (e.g., color, size, and material) simultaneously. If you wish to include a third variation (such as material), it must be coupled with either color or size.
2. Proposed Solution
To enable the variants to be displayed as two separate sections (for color and size), your development team will need to transform the existing flat structure into the hierarchical format described above. This transformation is crucial for ensuring users can easily select their desired options. Once this structure is successfully transformed, they will need to map it accordingly within the updateProduct method. Doc here.
3. Explanation of Factories within PROVIDE_PRODUCT_DATA
In our code, we use a concept called factories, where one factory is contained within another (nested). Because of this nested structure, a hierarchical product organization is required to display products across two sections. Here's a brief overview of how this works
Variation Factory (variationFactory): This factory handles the primary variations, such as color, and creates a structured representation of available colors for a product.
Size Factory (sizeFactory): Nested within the Variation Factory, this factory manages the sizing options for each color variant, ensuring that the correct sizes are associated with their corresponding colors.

Here you read more about PROVIDE_PRODUCE_DATA event to get a better understanding: [https://bambuser.com/docs/live/cart-integration#providing-more-data-to-player-products](https://bambuser.com/docs/live/cart-integration#providing-more-data-to-player-products)

Next Steps
I recommend discussing these necessary adjustments with your development team to transform the current product structure into the hierarchical format required by our hydration code. If you have any questions or need further clarification, please feel free to reach out.

### How can I display a more user-friendly error message when adding a product to the cart through the player?

*Applies to: Live, Shoppable-Video*

You can customize the error message shown to customers by using the `ADD_TO_CART` event callback. This allows you to capture API error messages and pass a more understandable message to the user.

For example, instead of a generic error, you can display something like:

*"The product stock is limited, and we cannot add more quantity for this item."*

Refer to our [documentation](https://bambuser.com/docs/live/player-api-reference/#callback) for guidance on passing custom error messages.

### How merchants can update stock availability from their integration code?

*Applies to: Live, Shoppable-Video*

Merchants can update stock availability using the same function used to "provide product data" initially. This function can be called at any time, not just when the player requests it. The relevant details are included in the documentation for providing product data.

### How to get both discount and original price to display in the player?

*Applies to: Live, Shoppable-Video*

To display both the discount and original prices in the Bambuser player, use the [PROVIDE_PRODUCT_DATA](https://bambuser.com/docs/live/cart-integration/#providing-more-data-to-player-products) event handler and include .current() and .original() in the .price() method:

`player.on(player.EVENT.PROVIDE_PRODUCT_DATA, (event) => {
  event.products.forEach(async ({ ref: sku, id: bambuserId }) => {
    const yourProduct = await yourGetProductMethod(sku);
    player.updateProduct(bambuserId, (productFactory) =>
     ....
                        .price((priceFactory) =>
                          priceFactory
                            .currency(size.currency || 'USD')
                            .current(size.current)  *// Discounted price*
                            .original(size.original) *// Original price*
                        )
....
    );
  });
});`

- .current(size.current) sets the discounted price (e.g., 50).
- .original(size.original) sets the original price (e.g., 75).

If current price is lower than original price, the player will display both if provided (e.g., "$50 (was $75)"). Ensure your product data includes both prices.

### oes the Shoppable Video tech documentation reference to 'Provide_Product_Data' mean client needs to integrate the cart on their Live player as well?

*Applies to: Live, Shoppable-Video*

Yes, both Live and Shoppable Video players share the same cart integration code within the onBambuserLiveShoppingReady method. If clients has both Live and Shoppable Video on the same page, implementing the cart integration code will enable it for both players. There is currently no option to separate the integration between the two.

### Where and how are the .introduction and .description fields meant to appear on the product cards in the Bambuser player?

*Applies to: Live, Shoppable-Video*

he introduction and description fields are exclusive to the in-player Product Detail Page (PDP). To enable these fields, you need to implement Cart Integration as detailed in the Bambuser documentation ([https://bambuser.com/docs/live/cart-integration/](https://bambuser.com/docs/live/cart-integration/)). This requires handling the following events:

- PROVIDE_PRODUCT_DATA
- ADD_TO_CART
- UPDATE_ITEM_IN_CART
- CHECKOUT
- SYNC_CART_STATE

Once these events are properly implemented, the introduction and description fields will appear within the in-player PDP.

.png)


## Player/Chat

### As a Moderator, why cant I reply to comments?

*Applies to: Chat, Live*

#### Issue Overview

As a moderator in a Bambuser show, you may notice that you cannot reply to comments that have already received a reply. This is by design to maintain a clear and organized chat flow.

#### Why This Happens

To keep chat conversations structured and easy to follow, our system only allows one reply per comment. This means:

- Once a comment has received a reply (from either another moderator or host), no additional replies can be added
- This prevents multiple conversation branches that could become confusing for viewers
- It encourages clear, direct communication between moderators and viewers

#### How to Identify Replied Comments

You can easily identify if a comment has already been replied to by looking for a check mark icon next to the commenter's name. This visual indicator helps moderators quickly see which comments have already received responses.

#### Best Practices

To effectively moderate conversations:

- Coordinate with other moderators to avoid duplicate responses
- If you need to add information to an already-replied comment, create a new direct comment to the viewer
- Use the chat's pinned message feature for important announcements that need to remain visible

#### Alternative Solutions

If you need to follow up on a comment that's already been replied to:

- Create a new direct comment addressing the viewer
- Use @ mentions to ensure the viewer sees your message
- If needed, reference the original comment in your new message


## Player/Other

### Can I add a third-party tag or script to Bambuser player?

*Applies to: Live, Shoppable-Video*

It is not possible add third-party scripts within Bambuser solutions. 

However, Bambuser exposes many tracking events that can be collected and then used for third-party tracking services.

For product trackings, UTM tags can also be added in product URLs whether manually (from the Bambuser workspace) or programatically (by [overriding product URLs](https://bambuser.com/docs/live/player-api-reference/#override-products-url)).


## REST API

### Can we use API key on the frontend?

*Applies to: Live, Shoppable-Video, Video-Consultation*

Using the Live Video Shopping REST API in a frontend environment carries significant risks. Exposing your API keys could lead to misuse or unauthorized access, compromising the security of your system. Additionally, frontend API calls can generate a high volume of requests, which may strain your resources and disrupt the user experience on your website, as you’ve already noted.

To mitigate these risks, it is essential to use our API through a secure backend environment. You can find more details in our documentation here: [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#section/Integration-Guide](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#section/Integration-Guide)

An efficient approach would be to trigger these calls based on specific actions related to the show, using webhook payloads. You can find information on the available webhooks and how to subscribe to them here: [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Webhooks.](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Webhooks.) Subscribing to webhooks can be managed through Bambuser Workspace under Settings -> Integrations -> Webhooks.

To further prevent any disruptions, ensure that your system is prepared to handle 429 responses, which will occur when the rate limit is reached.

Please feel free to reach out if you need further assistance or guidance on implementing this approach.

### Can you increase Rate limit of the API Key?

*Applies to: Live, Shoppable-Video, Video-Consultation*

Using the Live Video Shopping REST API in a frontend environment carries significant risks. Exposing your API keys could lead to misuse or unauthorized access, compromising the security of your system. Additionally, frontend API calls can generate a high volume of requests, which may strain your resources and disrupt the user experience on your website, as you’ve already noted.

To mitigate these risks, it is essential to use our API through a secure backend environment. You can find more details in our documentation here: [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#section/Integration-Guide](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#section/Integration-Guide)

An efficient approach would be to trigger these calls based on specific actions related to the show, using webhook payloads. You can find information on the available webhooks and how to subscribe to them here: [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Webhooks.](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-many#tag/Webhooks.) Subscribing to webhooks can be managed through Bambuser Workspace under Settings -> Integrations -> Webhooks.

To further prevent any disruptions, ensure that your system is prepared to handle 429 responses, which will occur when the rate limit is reached.

Please feel free to reach out if you need further assistance or guidance on implementing this approach.

### Do you rate limit your REST API endpoints?

*Applies to: Live, Video-Consultation*

All endpoints in this API are rate limited, this means that as a consumer of the API you can only make a certain number of calls inside a time frame.

If your API key exceeds the limit, the API will start returing an error response with status code 429 until the calls subside.

The rate limit is measured using a moving window. At the time of each request, the number of requests made in the X seconds prior is counted. If the limit is exceeded, the API will return a 429 HTTP status code. The limit is defined by the largest number of attempts allowed (`maxAttempts`) and the timeframe (`window`). By default, the rate limit is defined as 5 requests per 10 seconds.

If nothing else is stated in the description of the endpoint, you can assume that the rate limit is the one mentioned above.

### How do we generate an API key?

*Applies to: Live, Video-Consultation*

To generate an API key, go to Settings → Integration → API Key → Click on the button on the top right corner to generate api key. Make sure to tick the correct scopes. 

NOTE: It is important that to note to read about [rate limit](https://liveshopping-api.bambuser.com/v1/docs/api#section/Rate-limiting) in our REST API docs: [https://liveshopping-api.bambuser.com/v1/docs/api](https://liveshopping-api.bambuser.com/v1/docs/api)

It is very important that once we issue you an API key, you should only use it on server side!! 

Once Bambuser issues an API Key, you will be able to find it in your dashboard under Settings → Integrations → API Keys.


## Webhooks

### Is it possible to whitelist Bambuser Webhooks by IP Address? What is Bambuser Webhook IP address?

*Applies to: Live, Video-Consultation*

Bambuser webhooks requests are not send always from an static IP address. Each webhook POST request might be sent from a different IP address.

To enhance the security of the webhook calls, on the Bambuser dashboard, on the Webhook settings, you can add custom headers (e.g. Authorization) to all webhook POST requests sent from Bambuser to your receiver endpoint.
