# FAQ — Video Consultation

Curated internal Q&A for common customer questions, organized by topic. Sourced from Bambuser's support FAQ database. Where an answer involves exact limits, prices, hosts, or config keys, verify against the live docs (`bambuser.com/docs/llms.txt`) or the knowledge base (`knowledge.bambuser.com`) before relying on it.


## 3rd Party Bookings/Appointedd

### Is there a verified integration with any booking system today?

Bambuser hosts our own native Booking solution, accessible and managed directly from your dedicated Bambuser dashboard. No additional integration is necessary to utilize Bambuser's native option.

In addition, we offer seamless integration with Appointedd and Booxi, streamlining booking management through their backoffice platforms. Meanwhile, the actual meetings are efficiently managed through Bambuser.

Due to existing integration, connecting Appointedd or Booxi with Bambuser wouldn’t require any extra development more than possibly make the booking widget look good on your site. I.e no need to do any custom integration, you only need to make smaller config changes to have the solution up n running.

More information can be found here: [https://bambuser.com/docs/video-consultation/how-to-integrate-your-booking-system](https://bambuser.com/docs/video-consultation/how-to-integrate-your-booking-system)


## 3rd Party Bookings/Other

### Can we connect 1:1 to our external booking system in order to schedule meetings with our customers?

We support integration with any booking system without limitations from our end. However, it's the responsibility of each booking system to confirm the feasibility and support of integration steps. For technical guidance, refer to our documentation available [here](https://bambuser.com/docs/video-consultation/how-to-integrate-your-booking-system).

### How to charge customers when booking a video consultation service? How to collect the service fee from caller who booked a consultation?

When using Bambuser Booking system, you can created multiple services for booking, and you could add a price to each service. Adding a service price would only include a price tag to the service on the Bambuser booking widget. 

Bambuser does not provide a payment system, therefore any payment should be handled on the merchant side. 

**Possible solutions with Bambuser booking system (requires technical development):**

1. [Send custom booking email](https://bambuser.com/docs/video-consultation/custom-booking-emails/)
    - When a customer books a call, you could choose to send a custom email from your side (you will receive a webhook once a booking is created).
    - Inside the email, you could include a payment link.
    - Once payment is done, you could send them the meeting link.
2. Use [Bambuser App Framworks](https://bambuser.com/docs/app-framework/) to build custom payment screen into the Bambuser calls widget.
    - You could use third-party booking systems that supports payment

**Third-party solution**

Use third-party booking systems that support payments. You could then [integrate the external booking system](https://bambuser.com/docs/video-consultation/how-to-integrate-your-booking-system/#integrate-your-own-booking-system) into the Bambuser calls widget.

### When booking a call, a wrong agent name gets displayed and booked even

This is usually the case only if you have a custom booking Integration with Bambuser and where 2 or more of your agents are identifying with the same calendar ID in Bambuser. Each user can populate their calendar ID within their profile settings in Bambuser Dashboard

### When will the agent be able to join a scheduled call?

In the agent tool, the ***Join Meeting*** button will become available 15 minutes before the scheduled start time.

As for joining after the scheduled time, both the agent and the shopper can join the meeting up until one hour after the scheduled end time. However, the meeting link button will disappear from the agent tool at the scheduled end time. Nevertheless, participants can still join using the meeting link from other sources, such as their email inbox.

It's important to note that the agent must enter the meeting first. Once they do, the shopper will be able to click the ***Join Meeting*** button on their end.


## Agent Tool/Block Caller

### Can the blocking duration be extended beyond 28 days?

Blocking functionality is tied to a 28-day data retention policy for personally identifiable information (PII), such as IP addresses.

Extending past 28 days can be done by adjusting the PII retention settings. However, this change would apply to all PII data, not just for the blocking feature, and requires careful consideration regarding data privacy compliance. Permanent blocking isn’t supported as IP addresses are often reassigned, which could unintentionally block legitimate customers in the future.

We offer a Safety Face Blur feature to protect your team during video calls. You can read more about how it works here: [Safety Face Blur](https://knowledge.bambuser.com/one-to-one-privacy-settings/one-to-one-to-safety-blur).

For more details on PII processing and retention, you can refer to this documentation: [Bambuser PII Processing Information](https://bambuser.com/docs/agreement-details/#pii-processing-information).


## Agent Tool/Call Forwarding

### The Call Forwarding option is not visible during the call in the agent too. How to enable the Call Forwarding feature?

Currecntly the **Call Forwarding** feature need to be enabled for each dashboard by Bambuser per request.

Learn more:

[https://knowledge.bambuser.com/one-to-one-during-a-call/one-to-one-call-forwarding](https://knowledge.bambuser.com/one-to-one-during-a-call/one-to-one-call-forwarding)


## Agent Tool/Call History

### Can one Agent see their own stats if their user access is only “Agent” and not “Admin”?

Yes. **Call Insights** is availability for agents to see their own performance in the Agent tool.

The same metrics that are shown in the Agent leaderboard will be shown in the Agent tool for each logged in Agent.

- No. of accepted calls
- No. of calls with check out
- Avg. checkout value
- Avg. call duration
- Call rating
- Call feedback

Agents will be able to see the aggregated data on a 7 or 30 days time interval.

Read more here.

### Can the agent send the chat history email during the call?

Post Consultation email can only be sent after a finished call, not during.

See technical documentation [here](https://bambuser.com/docs/video-consultation/call-summary-email-integration).

### How does the Call Summary email work?

We offer a webhook that receives data in JSON format through an HTTP POST request.

This data can be utilized with your preferred service to generate either email or text message notifications.

Please note that you are responsible for creating email templates based on the information we provide. The summary data includes chat history, presented products, and a custom message or personal note.

To initiate the sending of summary data, manual action by the agents is required:

- Each agent must utilize the Call Summary form within the Agent Tool either after the call has ended or during the call via the app. The data can then be sent by clicking the "Send email" button.

Read more [here](https://bambuser.com/docs/video-consultation/call-summary-email-integration)

### Is the agent/advisor able to check clients’ feedback?

Yes. In the Agent tools view → Call stats section, the agents/advisors/consultants can see the stats from the feedback they have received. Agents can only see their own feedback stats.

Learn more on our knowledgebase: [**Call insights for agents](https://knowledge.bambuser.com/en_US/one-to-one-after-a-call/one-to-one-call-insights-for-agents)**


## Agent Tool/Call Stats

### Can call stats/data be exported?

Yes! The data can be exported to an external BI system.

Your organization admin can log into the Bambuser Dashboard and go to Stats. From there a .csv file can be downloaded containing data for a specific period of time.

More information and a guide can be found [https://knowledge.bambuser.com/en_US/one-to-one-using-the-dashboard](https://knowledge.bambuser.com/en_US/one-to-one-using-the-dashboard)

Stats can also be fetched through our REST API. Information [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#tag/Statistics](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#tag/Statistics)

### Can we see call statistics anywhere?

Yes. All the stats available can be found in the Admin Dashboard.

More information and a guide can be found [https://knowledge.bambuser.com/en_US/one-to-one-statistics](https://knowledge.bambuser.com/en_US/one-to-one-statistics)

### Whats included in the Agent leaderboard?

- Agent name
- Accepted calls
- Calls with checkout
- Avg checkout value
- Avg call duration


## Agent Tool/Call Summary

### Can I send cart/basket to my client as a call summary?

We only support sending products discussed within the call to the webhook payload that then later gets used for call summary. 

Properties here: 

```
{
  "collection": "call-summary",
  "action": "send",
  "eventId": "5j2JAem3BdnFnXvyPPtvC1",
  "payload": {
    "products": [
      {
        "sku": "1234567",
        "name": "Shoe",
        "imageUrl": "http://exmaple.com/tshirt.png",
        "publicUrl": "http://example.com/tshirt",
        "price": {
          "current": 100,
          "original": 50,
          "currency": "USD"
        }
      }
    ],
    "chat": [
      {
        "src": "agent",
        "date": "2020-01-01T00:00:00.000Z",
        "message": "Here is the discount code that you can use when checking out - CURIOUS20"
      },
      {
        "src": "client",
        "date": "2020-01-01T00:00:00.001Z",
        "message": "Thank you!"
      }
    ],
    "note": "",
    "date": "2020-01-01T00:00:00.000Z",
    "client": {
      "name": "Bambi",
      "email": "bambi@exmaple.com"
    },
    "callId": "acdef123-123123123-123123123123"
  }
}
```

Read more here: [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#section/Call-Summary](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#section/Call-Summary)

### Where can we see the post-call summary drawer in the agent tools to send a summary with a list of products presented and a copy of chat to clients after the agent ended the video consultation call?

After a call ends, agents can access the post-call summary feature through their **call history**. They'll see a **Send button** next to completed calls that allows them to trigger the call summary webhook.

Learn more about the [Call History and Follow up](https://knowledge.bambuser.com/one-to-one-after-a-call/one-to-one-history-and-follow-up).

#### **How It Works**

The post-call summary includes:

- List of products that were presented during the call
- Complete chat history from the conversation
- Option for agents to add a personal note

However, there's an important detail: **Bambuser doesn't directly send emails to your customers**. Instead, when an agent clicks the Send button, Bambuser sends a webhook to your backend system with all the call summary data.

#### **Integration Required**

To use this feature, you'll need to:

1. **Set up a webhook endpoint** in your backend to receive the call summary data
2. **Register the endpoint** in BamHub (Settings → Integrations → Webhooks)
3. **Subscribe to the "call-summary" collection**
4. **Build your own email system** to send the summary to customers using your brand's design and sender address

Learn more about the Call Summary webhook and how to integrate it with your email senders. [https://bambuser.com/docs/video-consultation/call-summary-email-integration/](https://bambuser.com/docs/video-consultation/call-summary-email-integration/)


## Agent Tool/Cart Integration

### Can we include additional features and benefits beyond what's currently shown in product comparisons during a Bambuser Video Consultation call?

Yes! You can use more compareable attributes for your products when integrating [provide product data](https://bambuser.com/docs/video-consultation/provide-product-data/#comparable-attributes-optional) through JavaScript integration in Bambuser Video Consultation calls.

Requirements:

- You need to be able to retrieve the product atteibutes, which you want to appear as comparable features/attributes, using a method or API.
- You need to programatically provide the retrived attributes for each product by chaining `.comparableAttributes((attribute) => [...])` inside the `variationFactory()` method during `updateProduct()`.

See the example code available on the link below which explains how you programatically should provide the comparable attributes:
[https://bambuser.com/docs/video-consultation/provide-product-data/#code-example](https://bambuser.com/docs/video-consultation/provide-product-data/#code-example)


## Agent Tool/Chat

### Can we implement a profanity filter for the chat?

Bambuser does currently not support profanity filter for 1:1 product

The chat is only displayed between the agent and the customer so such filter does not have the same relevance.


## Agent Tool/Cobrowsing

### We get a “leave a call Popup” during 1-2-1 call

Bambuser “Leave a call Popup” will trigger whenever call is about to be ended abruply. It serves as guardrail so users dont accidentally end a call. In most cases, that triggers because users are navigating to a different domain. 

Bambuser One-to-One solution has several features that utilize the concept of rendering your website inside an iframe.  Iframe is created over  your landing page to let your end customers (callers) surf the website (inside the iframe) without any interruption while in a call. We do this to prevent page reloading while navigating around the website, since page reloading would destroy the instance of The Call Widget which would end up in call ending abruply. 

As surfing in iframe across domain is not allowed, Bambuser triggers a “Leave a call Popup” in order to prevent call ending abruptly. 

You can read more about the technology here: [https://bambuser.com/docs/video-consultation/miniplayer-compatibility](https://bambuser.com/docs/video-consultation/miniplayer-compatibility)

### When clicking on a product in cobrowsing, website crashes

Bambuser One-to-One solution cobrowsing utlizies technology of creating an iframe element over merchant’s landing page to let your end customers (callers) surf the merchant website (inside the iframe) without any interruption while in a call. We do this to prevent page reloading while navigating around the website, since page reloading would destroy the instance of The Call Widget which would end up in call ending abruply.

If website crashes when in cobrowsing mode, that usually means one of 3 things: 

1. Product links lead to a different domain that call widget in integrated on. Usually that happens during testing Call Widget on staging environments, however providing production product links to the Call Widget.
2. Response headers from you web server contains [`X-Frame-Options = DENY`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options#syntax) header → Solution to that is that  your developers set [`X-Frame-Options = SAMEORIGIN`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options#syntax) instead. 
3. Response headers from you web server contains  [`Content-Security-Policy: frame-ancestors 'none';`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) header → Solution to that is that  your developers set [`Content-Security-Policy: frame-ancestors 'self';`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/frame-ancestors) instead. 

You will know by which of above 3 issues is presenting a problem on your website by opening a console, and see which error you get. In Chrome, you open an error by right clicking on the screen and select “Inspect”. Then once you have do this, try to reproduce website crash again. Once it happens, an error will be printed in the console, which will point to one of the 3 issues above. 

You can read more about the compatibility [here](https://bambuser.com/docs/video-consultation/miniplayer-compatibility).

Note that if you are on Shopify → Shopify's technical limitations, the [Cobrowsing](https://bambuser.com/docs/video-consultation/cobrowsing), [Surf While in Queue](https://bambuser.com/docs/video-consultation/surf-while-in-queue) and [Miniplayer](https://bambuser.com/docs/video-consultation/floating-player) features are **not** compatible with Shopify stores. You will need to reach out to your Bambuser contact to disable Cobrowsing / Surf while in Queue features for you.

### When I click browse in Agent tool, it redirects me to the wrong website

Make sure to specify merchantBaseUrl to correct URL 

*let*

oneToOneEmbed =

*new*

BambuserOneToOneEmbed({

merchantBaseUrl: 'https://demo.bambuser.shop/eu'

});

### Why is ‘Add Product'  button is disabled when co-browsing

If you are visiting a product page and the 'Add Product' button is still disabled, it means that the process of providing product data has failed and needs to be looked into. Button will be disabled, if the page you are visiting is not a product page.

When Co-browsing, every page you visit will trigger 'provide-product-data' event while includes the page URL in the payload.

This button will be Enabled if you are visiting a product page. So, the URL of the page is provided as the payload to the 'provide-product-data' event handler. (your developers can confirm that)

1. ref: the URL of the page you are visiting
2. type: 'url'


## Agent Tool/Notifications

### On desktop, ringtone isnt working for agent

If “Customer is calling" popup on the bottom left of their screen, however agents do not hear any ringtone, there might be couple possible scenarios where that would still happen. See below

1. Agent device sound it turned off
2. Affected agents have their tab muted. Unmute the browser tab (in most browsers: right-click the tab → Unmute site).
3. Affected agents have accidentally clicked "Mute" icon in Bambuser Calling popup
4. Affected agents have “Ringtone” setting turned off in the Agent tool

### Some agents that are on desktop get "Customer is calling" popup on the bottom left of their screen, however they do not hear any ringtone,

Possible reasons: 

1. Device sounds is off
2. They have "Ringtone" setting toggled off in Bambuser dashboard
3. Affected agents have their tab muted
4. Affected agents have accidentally clicked "Mute" icon in Bambuser Calling popup


## Agent Tool/Others

### Can a virtual consultation link be forwarded to someone else, or is it one-time use?

The link can be forwarded to someone else and is not restricted to one-time use.

### Can agent prepare and upload products prior to the call?

No, there is no way to upload products in advance prior to a Drop in Call or a Booked meeting. The products are added to the conversation/call widget during the call, i.e in real time.

### Can each agent have different times/days for availability, especially for handling video consultations?

Yes, with Appointedd bookings, you can set different times and days for each agent's availability, including specific days for handling video consultations. Please refer to Appointedd's internal documentation for detailed instructions. If you switch to Bambuser's own booking system, agents can also set their availability individually.

### Can we track to whom Sales Associates (SAs) are sending virtual consultation links to ensure they are only sent to Very Important Customers (VICs)?

Currently, it is not possible to track the recipients of virtual consultation links, as SAs may share them via text, email, or other external channels outside of the platform’s control.

### How does Share screen work?

Agent can share either full desktop view, a window or a tab. Its a built-in functionality within the Agent Tool that Agents can use during a call on both desktop and through mobile app.

### If an Agent speaks to a customer on a social media platform, can the Agent share a link to the customer to initiate a video call?

Yes, that is possible!

The Agent can generate a meeting link to their own personal queue and send it to the customer, this is done in the Agent Tool by clicking “New Queue Link” and link to a queue where only they are available.

### If the Agent is occupied in a call, can they somehow see the Queues or the next Booked meeting?

No, there is no way to toggle between the call and the “Main Menu” for the Agent.

### What is the minimum iPhone model requirement we support for the app?

We support all devices that can run iOS 13.1 and later. This means that following devices (as long as they are upgraded to iOS 13.1) can run our app:

- iPhone 6S
- iPhone 6S Plus
- iPhone SE (1st generation)
- iPhone 7
- iPhone 7 Plus
- iPhone 8
- iPhone 8 Plus
- iPhone X
- iPhone XS
- iPhone XS Max
- iPhone XR
- iPhone 11
- iPhone 11 Pro
- iPhone 11 Pro Max
- iPhone SE (2nd generation)
- iPhone 12
- iPhone 12 Pro
- iPhone 12 Pro Max


## Agent Tool/Product Integration

### How does the Keyword search work for adding products in a One-to-One call?

Agents will be able to search for products in a flexible way with better support to find the best fit product.

The keywords search is based on the Merchant’s search capability on their website.

Some limited integration on the part of the Merchant is required to support this feature.

Agents can search for keywords or other product related information in the Agent Tool and Merchants will through the product integration return information matching the search input. 

Products returned will be listed below the search field.

Tech specs can be found here: [https://bambuser.com/docs/video-consultation/providing-search-data](https://bambuser.com/docs/video-consultation/providing-search-data)

### How does the product hydration work?

The integration of products is purely frontend javascript communication between merchants site and Bambuser, although merchants frontend integration code needs to communicate with their backend for fetching the product data.

High level what happens is that:

1. Products will be searched for in the Agent Tool UI, triggering an event(s) in the embedded Call Widget on the merchants e-com site.
2. Merchants frontend integration code will request the product data from their backend and have the data returned to the same source (their frontend), to be able to forward the information back to the Call Widget.
3. The Call Widget will in turn show the Agent the product in the Tool UI for it to be presented to the end Customer.

### How is "Related Products" configured and where is it shown in the Call Widget?

Adding related products as part of the integration code is optional. Find more information [here](https://bambuser.com/docs/video-consultation/provide-product-data#related-products-optional).

Code examples can also be found further down on that very same page.

When viewing a product in the Agent Tool, related products will be listed below the selected product.

### The search function is missing from the call

If Agent has no search function, it means that you are likely missing integration of “search” - you are not handling the search event. Read more here, [https://bambuser.com/docs/video-consultation/providing-search-data/](https://bambuser.com/docs/video-consultation/providing-search-data/)

### When adding product to the call, we get Cart Update Error - request to update the cart took too long

This error should be due to your endpoint timing out and should be fixed by your developers. For them to troubleshoot, they should check the network tab on caller side when adding the product to see what your endpoint response.


## Agent Tool/Queues

### Can we decide which queues an Agent can see and answer?

Yes, you can configure different queues depending on customers interest and perhaps Agent expertise.

For example, you can have separate queues for the different product categories, brands or something else that fits their business. **Each Agent can then be assigned to different queues.**

Both queues and resources are configured in the Admin Dashboard.

### How does Generate queue links work?

Agents can generate a connect link for a certain queue that can be sent to customers through the tool or other channels.

The generated queue link directs customers to your website. There, the Call Widget is rendered, and customers are automatically placed in the selected queue.

Generate a queue link is supported on both desktop and in the apps.

### How does the queue routing work for drop in?

Customers who initiates a call will be placed in a general or specific queue (depending on the chosen set up).

Agents assigned to the specific queue can pick up the call.

Multiple Agents will be notified and the first one who picks up will get the call. One Agent can be assigned to one or several queues.

### Is there a limitation of number of queues a Merchant can have?

No. The Merchant can decide exactly how many queues they want and what to name them.


## Agent Tool/Safety Blur

### Can a custom background (beyond the default blur) be used during virtual consultation calls?

Beside blur, we also support Virtual Background - read more here: [https://knowledge.bambuser.com/one-to-one-privacy-settings/virtual-background](https://knowledge.bambuser.com/one-to-one-privacy-settings/virtual-background)


## Agent Tool/Shopper Information

### Is it possible to feed customer information to agents?

Yes, there are two ways to provide customer information to agents:

#### 1. **Programmatically via API (Recommended for Logged-in Users)**

If the **Calls Widget** is integrated under a login page, customer details are likely already available. You can pass this data to agents programmatically using the **Present Customer Data to Agent** feature.

Here’s an example of how to pass customer information using the Bambuser One-to-One API:

```jsx
javascript
CopyEdit
let oneToOneEmbed = new BambuserOneToOneEmbed({
  data: {
    externalId: 0
  }
});

// Can be updated any time afterwards with:
oneToOneEmbed.updateData({
  externalId: 123,
  firstName: 'Jon',
  lastName: 'Doe',
  email: 'jon.doe@example.com',
  phone: '+1234567890'
});

```

For detailed implementation, refer to the [Present Customer Data to Agent](https://bambuser.com/docs/video-consultation/present-customer-data-to-agent/) documentation.

#### 2. **Shopper Form (For Queue Exits or During Calls)**

If a shopper exits the queue before being served, or if an agent collects details during a call, they can fill out the **Shopper Form**.

- **When a shopper leaves the queue**, they are prompted to enter their contact details.
- **During a call**, agents can access the Shopper Form by clicking the three dots in the lower right corner and selecting **Customer Info**.

The collected Shopper Form data is accessible in **Bam Hub** under **Stats → Export CSV** or via the [LiveShopping REST API](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one).

💡 **Note:** Certain Personally Identifiable Information (PII), like email addresses, is automatically deleted after 28 days (configurable).

SEE more here: [https://knowledge.bambuser.com/one-to-one-during-a-call/shopper-form](https://knowledge.bambuser.com/one-to-one-during-a-call/shopper-form)

### When a customer leaves the virtual consultation queue and fills out the contact details form, how can the agent/manager be notified?

It can be done through Webhooks. In the Dashboard the merchant can setup a configuration that sends the information somewhere. To be found under Settings > Integrations > Webhooks. 

A simple example is to set it up with Zapier. And then let Zapier write it down in a google sheet. Then they would get the results in realtime into the sheet. There are many other options available in a webhook receiver like Zapier. The webhook that they want to listen to in this case is `shopper` and and the action sent in the payload will be `missed-call`. 

More information about this webhook event here: [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#section/Shopper-Information](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#section/Shopper-Information)


## Agent Tool/Today Bookings

### Agents external calendar is not synchronised with bookings

Bambuser does not control any integration between your email client and your calendar.

What we do is send an email to the agent that has been booked. In the email, there is an “Add to Calendar” section. Agent can then add to their appropriate calendar by manually clicking the correct email client icon in that section.


## Agent Tool/VTO

### VTO Try On button is disabled

Hovering over the button will tell you why exactly it is disabled.  Most commonly, button will appear disabled due to one of below three conditions:

- Caller doesnt have a camera turn on
- Caller doesnt have the call in focus (they are looking at some other tab..)
- Product SKU doesn't match the one in Perfect corp (”product does not support virtual try on” error)
    
    SKU that you provide to Bambuser through code - Product Hydration (1) needs to match the SKU that you put in Perfect Corp under SKU ID (2). Otherwise agent will not have an active "Try Out" button within Bambuser Agent tool for those products. 
    
    1. [Product Hydration](https://bambuser.com/docs/video-consultation/provide-product-data) (Bambuser Integration code)
    
    2. Product set up within Perfect Corp 
    
    - --------
    
    1. Product Hydration (also called "Provide Product Data") is feature which allows the agent to o be present products to the customer within the Call Widget during a One-to-One session. How it works is:
    
    > - During the call, agent searches for a specific product. When they do that "provide-search-data" event will be triggered on the client side.
    > 
    > 
    > [Therefore you should handle that event in Integration codes](https://bambuser.com/docs/video-consultation/providing-search-data)
    > 
    
    
    
    2. Product set up with Perfect Corp should reflect the same variant SKUs as the ones you are passing to Bambuser through integration code. More specifically, the variant SKU you pass to Bambuser should equal to the SKU ID set up in Perfect Corp UI. NOTE that the Product ID is not the same as SKU ID! 
    

.png)


## Analytics/Conversion Tracking

### I see you track first purchase within the report but what if a caller placed 2 or more orders? Would you just track the first or amend the first to show the last date?

In the 1:1 CSV export you find the below columns.

- first_purchase_time
- purchased_products
- revenue_value
- revenue_currency
- number_of_purchases
- order_ids

We track all orders placed within timeframe that the conversion tracking cookie is valid, but we only show the time stamp of the first order. Purchased products, revenue value, number of orders and order ids will all be added to the same cell with a semi colon separator.

### If a customer called twice and talked to different agents, how and to whom would we link the purchase?

The second one. Purchase gets linked to the most recent call you have had.

### In one-to-one CSV, is order_ids only for first order or all orders?

All orders

### What is definition of Direct Converted Calls

Direct Converted Calls is when checkout button has been clicked within the actual 1:1 Call Widget tool as well as purchase happened either during or after call

### Why might sales generated from video consultations, such as those driven by individual coupon codes, not appear in tracking data despite reported high sales volumes?

A: Several factors could explain discrepancies in tracking sales from video consultations:

1. **Cross-Device Usage**: Users may participate in a video consultation on one device but complete their purchase on a different device or browser, where the tracking cookie is not present.
2. **Cookie Restrictions**: If the merchant’s site does not allow the video consultation widget to set cookies (e.g., due to a user rejecting cookies), sales cannot be attributed.
3. **Incomplete Purchase Tracking**: The merchant’s purchase tracking implementation may not cover all purchase scenarios, missing some sales.
4. **Coupon Code Sharing**: If coupon codes issued during calls are shared with others, purchases made by different users may not be linked to the original consultation in the tracking data.


## Analytics/Others

### Can we determine who is missing the calls, what time they attempted to join, and how long they waited?

Yes, this information is available in the Stats CSV reports. Specific metrics like `entered_queue_time` and `seconds_in_queue` provide details about wait times and timestamps for each call.

### Can we integrate our own NPS system into Bambuser Video Consultation product?

There are two primary ways to  integrate your own NPS system into Bambuser Video Consultation product:

- **Option 1: Listening to Tracking events** This is the simplest way to get started. Your developers can set up a listener for the `call_ended` event. When a call ends, this event triggers, allowing you to display your own NPS survey. This approach is quicker to implement, but it operates externally to our calls widget. You can find the full technical documentation on this method here: [https://bambuser.com/docs/video-consultation/tracking-events/#call_ended](https://bambuser.com/docs/video-consultation/tracking-events/#call_ended). Note you can disable our built-in NPS feedback system to ensure a smooth transition to your own.
- **Option 2: Using the App Framework** For a more seamless and integrated experience, we can use our [App Framework](https://bambuser.com/docs/app-framework/). This method allows you to create custom screens that function within the Bambuser video widget itself. This option requires more development effort, but it provides a deeply integrated solution within Calls Widget.

### Can we see drop-ins by the hour?

- Yes, the Stats CSV includes data for analyzing hourly drop-in activity, which can help determine when the highest and lowest volumes occur.

### Is Bambuser able to schedule SFTP file drops?

You can export a CSV report through dashboard or programatically configure to requests statistics through rest api.

### On the CSV report - are all times indicated in CET or in the respective timezone of the customer?

All CSV exports are in the UTC timezone.

### What is the definition of a missed call, and do we have the ability to look into them?

- **Answer:** A missed call is defined as a client entering the queue and waiting more than 5 seconds without getting an answer.
- **Details:** You can analyze missed calls through the Stats CSV reports, using metrics such as:
    - `entered_queue_time` and `seconds_in_queue` (average wait time over the last 30 days is 6 seconds).
    - `client_id` (unique shopper ID, persistent for returning users on the same device and browser until the _bamls_usid cookie expires).


## Analytics/Player Metrics

### What is definition of Indirect Converted Calls

Indirect Converted Calls is when checkout happened after the call as well as purchase happened either during or after call


## Bam Bookings/Booking email

### Can we include additional text in the product recommendation emails to clarify customer product usage?

Yes, agents can add a "Note" in the user interface before triggering the call-summary webhook. This note will be included in the webhook payload, allowing you to add additional text or clarifications in the email sent to the customer.

### Can we send product recommendation emails through Bambuser?

Bambuser allows agents to send a call-summary email after a consultation. When the agent clicks the button to send this email, Bambuser triggers a [call-summary webhook](https://bambuser.com/docs/video-consultation/call-summary-email-integration) i that includes the products discussed during the call. You, as the merchant, need to handle this webhook payload and send the email yourself, as Bambuser does not support sending these emails directly.

### If a customer replies to the recommendation email, will their response be managed within Bambuser or our customer support system?

Since Bambuser does not send the recommendation email directly, it is not involved in managing replies. You should configure your system so that replies go to your customer support email in Zendesk or another support system you use.

### With Bambuser Native tool, is it possible to configure SMS reminders to be sent to clients with an upcoming booked call (instead of an email)?

We provide webhooks that they can setup and use in your SMS notification system. And it is possible to configure to turn off the email reminder but keep the confirmation email. So yes, if you do the integration with webhooks and use your own sms notification system

See webhooks docs here: [https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#section/Appointment](https://liveshopping-api.bambuser.com/v1/docs/api/one-to-one#section/Appointment)


## Bam Bookings/Email

### Also, are we able to use our own sender address?

• Yes, if you are sending booking confirmation emails from another system than Bambuser. See more here: [https://bambuser.com/docs/video-consultation/custom-booking-emails/](https://bambuser.com/docs/video-consultation/custom-booking-emails/)

### Can I customize the text in the booking email template

- If you will be sending booking confirmation emails from Bambuser, then you do not require any further integration with your email service, however customization of the email itself is limited to what you can find in UI (You can find it in your Bamhub -> Bookings -> Email Template)
- If you will be sending booking confirmation emails from another system than Bambuser, then you will need to do further integration as per [this documentation](https://bambuser.com/docs/video-consultation/custom-booking-emails/). With this approach, you fully own how email looks like

### What happens if somebody responds to confirmation email? Where does that message go?

- If you will be sending booking confirmation emails from Bambuser, then sender address will be `<sender_name>@bambuser.net` . Replying to it currently does nothing. There are 2 emails in the UI to fill in, 1. sender email (normally a noreply email - So recommended should be like `noreply-your-brand@bambuser.net`) and then a reply to email that will be appearing in the bottom of your email, which should be one of your emails that you have control over.
- If you will be sending booking confirmation emails from another system than Bambuser, then you own the address, have insight in replies and also have control to define what happens when somebody replies


## Bam Bookings/Others

### A customer received a "Connection Warning" error immediately after clicking the "Join Meeting" button for booked meetings. Why did this happen?

This error typically indicates a network-level interruption at the moment the connection is being established. Based on our technical investigation, there are two primary causes for this:

1. **Local Network Restrictions:** The most common cause is a firewall or security setting on the user's network (e.g., a corporate VPN or a restricted office Wi-Fi) that blocks the specific traffic required for video streaming.
2. **The "Timing Edge Case":** In very rare scenarios, if an agent happens to disconnect or leave the room at the exact second the customer clicks "Join," the handshake between the two devices is interrupted, resulting in a connection error.

In almost all cases, the issue can be resolved with these two steps:

- **Refresh the Page:** A simple browser refresh on the customer's side will re-trigger the connection logic and usually bypass the error.
- **Switch Networks:** If the error persists after a refresh, it is likely a network restriction. We recommend having the user switch from office Wi-Fi to a personal hotspot or a different network to confirm.

#### To minimize the chance of the "timing edge case," agents should ensure they remain active in the digital meeting room once they have joined. Avoid refreshing the page or navigating away from the call screen while waiting for the customer to enter the session.

### Using Bambuser Native booking system, can we prevent end users from booking on the same day?

There is no setting like that on Bambuser UI in the workspace. However there is a setting was on workspace level where Bambuser can configure this on Bambuser’s end. Bambuser would be able to specify how many minutes or hours ahead a new booking can earliest be made. In order to have that set, you need to reach out to your Bambuser contact person

### Will Bambuser assist with the implementation of booking system on our website?

If you are not using Bambuser Native Bookings, your developers will need to implement the booking system on your website by following Bambuser's documentation. If there are any questions or issues during the implementation, you can contact Bambuser for support


## Broadcasting/External Cameras - RTMP

### Can Agents or callers use external cameras?

Yes, in Agent Tool, agent can choose which camera source to use.

For agents to use external cameras, they need to first connect their device with external camera and then choose correct camera source in settings which they have access to before and during a call.


## Call Widget / Initiation screen

### How is the estimated drop in waiting time calculated?

The estimated waiting time is based on below parameters:

1. Your place in line
2. How many agents are currently serving the queue (in a call or idle)
3. Last two months of average call lengths for that dashboard

Then based on these parameters we calculate it and consider how long current calls have been ongoing, so we expect them to end around the average call length

This changes every Monday based on the last two months for the merchant (Bambuser dashboard).

All merchants start with an average of 420 seconds. And then based on the calls they make it changes over time if they have longer or shorter calls


## Call Widget/Booking

### Can I use an external booking system to book calls on One-to-One?

Yes!

You can integrate your own booking system with the Bambuser One-to-One call widget.

### Can we automatically default the timezone to the user’s local time during the booking process?

Yes. The booking calendar automatically detects and defaults to the timezone of the person booking the appointment. This helps minimize errors where customers might accidentally book slots based on the agent's location rather than their own.

> **Note:** For more details on how this is handled, you can refer to our troubleshooting guide on [https://knowledge.bambuser.com/video-consultation-troubleshooting/troubleshooting-incorrect-pre-selected-timezone-in-call-widget-booking-calendar](https://knowledge.bambuser.com/video-consultation-troubleshooting/troubleshooting-incorrect-pre-selected-timezone-in-call-widget-booking-calendar)
>

### Do you use CAPTCHA or other methods to prevent bots from spamming the booking form?

We do not currently use CAPTCHA on the booking forms. However, bot spam has not been a reported issue. This is largely because the booking form is not immediately present in the DOM (Document Object Model) when a page loads; a user must complete several interaction steps before the form becomes accessible, making it difficult for standard bots to find or complete.

### If two agents are available at a client's chosen slot, who gets the booking first? What's the logic?

It's a randomly distribution to available agents.

### Is it possible to have a notice period for bookings? So that clients aren't able to book a slot now for this afternoon for example (sometimes the agents need more notice to wrap up other activities, chats, emails etc planned that day)

1. Notice periods is not possible to configure. You can block time slots for specific services or for yourself as an agent. You can also set a padding time between your bookable time slots so that agents have time to prepare between consultations.


## Call Widget/Call Feedback

### Can you have a poll during the call?

No. Not possible today.

### Is it possible to show the customer a poll after a call has ended?

Yes. Call Feedback allows customers to submit their feedback after a call with an agent.

Once the call ends, customers have the option to provide feedback. They can rate the conversation using the NPS system or simply select a 'thumbs up' or 'thumbs down' based on their satisfaction with the service.

In order to evaluate the average response, the Call Feedback result is part of the metrics displayed on the Stats page in the Dashboard.


## Call Widget/Cobrowsing

### The call shows an error/broken page when clicking the BROWSE icon as the client/shopper. What is the issue?

This is actually a known compatibility problem when you have Co-Browsing feature enabled. The error can occur for several technical reasons. 

**Important note**: If you're using **Shopify**, cobrowsing is not compatible due to Shopify's technical limitations. You'll need to contact your Bambuser representative to disable the cobrowsing feature. 

#### **Why This Happens**

Cobrowsing works by loading your website in an iframe and let the customer/shopper surf the site without any interruption. When a page can't load in an iframe due to security headers or domain issues an error page is shown.

Learn more:

- [How CoBrowsing works?](https://bambuser.com/docs/video-consultation/cobrowsing/)
- [Iframe Compatibility](https://bambuser.com/docs/video-consultation/miniplayer-compatibility)
- [Troubleshoot website crashing issue during the call](https://bambuser.com/docs/video-consultation/troubleshooting/miniplayer-crash/)

### When adding a product to call through cobrowsing, another variation is added to the drawer

When adding a product in the way shown in the video, the URL of the current page is passed to Bambuser. More specifically to ‘provide-product-data-event’. If your website’s URL doesn’t change when you switch between variations on your website, Bambuser won’t be able to identify the specific variation the viewer is looking at. To resolve this, you could ensure the URL updates based on the selected variation. If that’s not possible, an alternative is for the agent to manually adjust the product variation afterwards in the agent tool or add the correct variation via the search function instead.

### Why does our page reload when customer joins the queue

Bambuser One-to-One solution has several features that utilize the concept of rendering your website inside an iframe.

Iframe is created over the your landing page to let your end customers (callers) surf the website (inside the iframe) without any interruption while in a call. We do this to prevent page reloading while navigating around the website, since page reloading would destroy the instance of The Call Widget which would end up in call ending abruply.

There is a brief moment when your website's iframe is getting rendered which is causing expected "flicker" experience. If you have an SPA website, you can get around this by implementing manual navigation mode


## Call Widget/Drop in queue

### Can shoppers surf while being in queue?

It is possible for shoppers to continue to browse on the site while waiting in queue for their call to be answered.

When they click the minimize symbol on the call widget, it will move to the page's bottom.

Read more about this feature in the [documenation](https://bambuser.com/docs/video-consultation/surf-while-in-queue).

Note that this feature utilize the concept of rendering your website inside an `iframe`. Read more about this [here](https://bambuser.com/docs/video-consultation/miniplayer-compatibility/).

### How do you distribute drop in calls between the agents?

There are two ways to distribute the calls: 

1. Call Routing -We use a shuffle algorithm that randomly distributes the calls between agents that are online. First, only one gets it, then 3 then 5 then everyone. There is a 10 sec between each interval.
2. Rings for everyone at the same time. The first agent to pick up will take the call. Please let me know if there's any issue with that.

### I also want the drop in to be automatically disabled on certain occasions

Not possible to automatically disable it only for some occasions. Someone needs to go to Bamhub -> Settings -> Configurations -> Disable "Drop in"


## Call Widget/Other

### Is there a privacy Terms and Conditions (T&C) acceptance required before joining a virtual consultation call?

Yes, users must accept the privacy Terms and Conditions before joining the call.


## Call Widget/Positioning

### Is there a way to hide Call Widgets without removing the code?

Unfrotunately there is no way to remove it through UI. The only way to hide it would be to remove/ comment out the code on your website.


## Call Widget/Product hydration

### How does the product comparison work?

Products presented to the customer can be easily compared against each other through a table view showcasing their attributes.

Note: The performance of tools hosted by us, such as comparing product attributes, improves with the depth of product information available. Attributes presented can be customized to display only those features relevant to the customer's interests.

For further information on comparable attributes, read more [here](https://bambuser.com/docs/video-consultation/provide-product-data#comparable-attributes-optional).

### What formats are supported for QR & barcodes?

For **iOS** you can find them here under Supported Symbologies [here](https://developer.apple.com/documentation/vision/vnbarcodesymbology) 

For **Android** if you scroll a bit down you will find constant summary [here](https://developers.google.com/android/reference/com/google/android/gms/vision/barcode/Barcode)


## Call Widget/Translations

### How can I add multiple languages in the widget

To add multiple languages in your Video Consultation widget, follow these steps:

1. **Go to Translations**: In your Bambuser web app, navigate to **Translations** under **Settings** in the left-hand menu.
2. **Add Locale**: Click on **+ Language** in the top right corner and select the languages you want to offer your shoppers. Example “sl-SI” for Slovenian locale
3. Add that locale to your Integration code. You can also pass a varible, so that locale changes based user’s location. You just need to identify user’s market and pass correct locale to the Integration code. Note that in order for this to work, step 1 and 2 need to be followed (locale needs to be in your BamHub), otherwise language will default to a locale that is set as a “default” locale. Read more here: [https://bambuser.com/docs/video-consultation/initial-setup/#additional-options](https://bambuser.com/docs/video-consultation/initial-setup/#additional-options)
    
    ```php
    let oneToOneEmbed = new BambuserOneToOneEmbed({
        locale: 'sl-SI' 
    });
    ```
    
4. **Customize Text**: You can view and customize the text for each language by clicking on it within the list. Note that due to caching, it might take up to 30min to changes to reflect on your widget. 

This will help you tailor the language options for your customers effectively! If you need further assistance, feel free to ask.


## Cookies

### If a user rejects a merchant’s cookies on their website before joining a video consultation, will the cookies typically set by the video consultation widget still function?

When a user initiates the video consultation widget, the merchant’s cookie policy determines whether cookies are allowed. If the user rejects cookies, the merchant’s settings may block the widget’s cookies or classify them as required/functional, allowing them to function. If cookies are permitted, they will persist in the user’s browser for tracking purposes.


## Dashboard/Blocking

### Can the screenshot feature be blocked, or can a warning be displayed during virtual consultations?

Blocking screenshots in a browser is not currently possible. If there are specific concerns about screenshot usage, alternative solutions can be explored to address the underlying issue.


## Dashboard/Booking Setup

### is it possible for admin to get an overview of how the agents have set their schedule? So that they can see the overall availability?

Managers cannot see or edit agents' availability in the Bam Hub. However, they can view the overall availability in the Call widget, just as shoppers do when booking an appointment. They can also do the same for each agent by copying their specific resource link and checking when slots are available.

### Why am I getting the "something went wrong" error when I try to set my availability for a service under Bookings, even after adding myself as a resource?

This issue might be due to caching. If you have just added yourself as a resource and immediately tried to set your availability, the system may not update immediately.

To resolve this:

1. Ensure you have added yourself as a resource.
2. Wait a few minutes after making this change.
3. Then, try setting your availability again.

This should allow the cache to update and prevent the error.

### Why am I getting the "something went wrong" error when I try to set my availability for service under Bookings?

The error you're encountering is due to not having added yourself as a resource.

To resolve this, please follow these steps:

1. Navigate to **Bookings**.
2. Select **Service**, then choose the specific service.
3. Click on **Resources**.
4. Add yourself as a resource by clicking on the **+** icon next to your name and email address.

After completing these steps, you should be able to set your availability without encountering any errors.


## Dashboard/Browser support

### On which devices is the 1:1 Agent Tool available?

- Agent Tool Desktop is only supported by Google Chrome browser
- Agent Tool app: available n tables, iPhone and Android devices.


## Dashboard/Live stats

### On the Dashboard what does waiting mean?

“waiting” will show you the # of shoppers currently in line for that specific queue

### On the Dashboard, how are “min wait” calculated

min wait is the estimated waiting time for the shopper last in line

### On the Dashboard, what does “serving” mean?

It shows you the number of agents online for that specific queue


## Dashboard/Opening Hours

### Can callers make calls after hours? Will they show up as missed calls if they attempt to make a call outside of 'operating hours?

A shopper can never enter the queue if it's outside of opening hours; therefore, we will never count it as a missed call.

### Can we configure opening hours based on queue?

Currently opening hours is configurable only globally per organization. Therefore it will apply for all the queues.

### Is there any way to configure the opening hours for Drop in calls?

Yes. This is easily configured in the Admin Dashboard.

More information and instructions on how to can be found [here](https://knowledge.bambuser.com/one-to-one-manage-the-dashboard/one-t-manage-queues).


## Dashboard/Other

### How many agents can we have in one dashboard

Bambuser does not recommend that you have more than 7k agents added to a single dashboard. If that is your requirement, please speak to your Bambuser contact person in order to set up a plan to divide your agents in multiple dashboard.


## Dashboard/Profile

### Where is the Agent’s profile picture modified?

This is done in the Admin Dashboard. Settings can be found in the bottom left corner, on the account icon.


## Dashboard/Stats

### Can we see if we have recurring customers using one-to-one?

Bambuser does not display whether you have recurring customer and how many time that customer has been calling. However you can track this in different ways on your end. Each call includes a `client_id` that is unique for one customer. You can find this either in the CSV report or through [tracking events.](https://bambuser.com/docs/video-consultation/tracking-events)

### Which data is included in the stat pages and how often is the data updated?

**When is the data updated?**

The data in both the overview page and the leaderboard is updates once an hour.

Note: Changing state of calls ( normal→test or vice versa ) that have been already processed in one of the hourly updates will be reflected in the stat pages within 15 minutes. If the call hasn’t been processed yet all the updates will be available after the following data update.

**Which data is included?**

Since the goal of the pages is to consider meaningful data we, by default, exclude Call with duration< 20 seconds and missed calls with waiting time in queue <5 seconds.

All the data is anyway available in the .csv export and in the API.

### Why are the number of "Completed" bookings in the dashboard not matching the number of calls in the call list?

The discrepancy arises because the "Completed" status in the dashboard indicates bookings that are in the past and have not been cancelled or rescheduled, regardless of whether a call actually took place (e.g., no-shows are still counted as completed). The call list, however, only shows a list of actual calls that took place. Additionally, if a meeting is started multiple times due to technical issues (e.g., sound or internet problems), it may result in multiple entries in the call list for the same meeting. These metrics are not intended to match.


## Dashboard/Theming

### Can you change the design of the Call Widget through the dashboard?

Yes, you can do this by going to Dashboard → Settings → Theming


## Dashboard/Translations

### How do I add T&C and Privacy Policy links to the Calls Widget?

This is a self-service process that you can do in Bamhub. Navigate to `Bamhub -> Settings -> Translations`, choose the correct locale, and then update the `POPUP_TERMS_CLICK_AND_ACCEPT_MESSAGE`, `POPUP_TERMS_MESSAGE`, and `SHOPPER_INPUT_FORM_TERMS_AND_CONDITIONS_PLAIN_TEXT` fields. The fields support HTML, so you can use HTML tags to create links. Note that you should not change the dynamic variable `{0}` if it's present.


## Dashboard/User Management

### If I assign a role as an "Owner" - do users automatically have access to the Agent tool as well? Or do they also need to be assigned as "Agent" to have access to agent side?

They need to be assigned as "Agent" to have access to agent side.


## gtm

### Can I integrate without the help of developer?

Integration efforts are always required but can vary significantly depending on the features you choose to implement. To simplify the process, we offer a GTM integration that includes a user-friendly interface for implementing the core functionality of our product. Learn more here: [https://bambuser.com/docs/video-consultation/install-one-to-one-with-gtm/](https://bambuser.com/docs/video-consultation/install-one-to-one-with-gtm/)


## Integration / Native Mobile

### Can we initiate and/or join a call from customer’s own mobile app?

Yes, you can embed our 1:1 solution into webview, howevever we currently have no documentation on that. Besides that, we do not offer a Native SDK merchants can use to embed Call Widget on their native app.


## Integration/Client Website

### Question for Video Consultations integration: Do you have any guides on how to integrate with Salesforce Service Cloud?

We dont have special documentation for how to integrate Video Consultation in Salesforce, so regular docs here would apply: [https://bambuser.com/docs/video-consultation/](https://bambuser.com/docs/video-consultation/)

### Which CSP (Content-security-policy) directives Bambuser Video Consultation (one-to-one) Calls Widget requires?

It is recommended to use `https://*.bambuser.com` origin in your CSP directives. Example: 

```
default-src 'self' https://*.bambuser.com 'unsafe-inline';
```

If you need to be more explicit, currently (November 2025) the Bambuser Video Consultation requires the below CSP rules.

**Calls Widget + Shopper Events Tracking (Global)**

```
default-src 'self';

script-src 'self' 'unsafe-inline' https://one-to-one.bambuser.com https://cdn.liveshopping.bambuser.com;

connect-src 'self' https://one-to-one.bambuser.com https://svc-prod-us.liveshopping.bambuser.com https://cl-prod-us.liveshopping.bambuser.com;

frame-src 'self' https://one-to-one.bambuser.com;

```

**Calls Widget + Shopper Events Tracking (EU)**

```
default-src 'self';

script-src 'self' 'unsafe-inline' https://one-to-one.bambuser.com https://cdn.liveshopping.bambuser.com;

connect-src 'self' https://one-to-one.bambuser.com https://svc-prod-eu.liveshopping.bambuser.com;

frame-src 'self' https://one-to-one.bambuser.com;

```

Note that the while we try to keep the service consistent and compatible in the new versions, it is still possible that the subdomain names undergo changes in the future.


## Misc

### Does Bambuser have an mobile SDK for 1:1 ?

Bambuser does not have a mobile SDK for 1:1, however the Web call-widget is compatible to put in a webView. So if you want it in your native apps it is still possible to achieve it with that path. Unfortunately we do not have specific guides for embedding Call Widget in webview documented, but your mobile developers can achieve it by reading our web-integration guides: [https://bambuser.com/docs/video-consultation/](https://bambuser.com/docs/video-consultation/)

### Does the virtual consultation solution cause significant battery consumption on iPhones and iPads?

There have been no reported issues from other clients regarding excessive battery drain due to frequent video calls, but specific performance may vary depending on device usage and settings.

### Is it possible to integrate our own survey or NPS (Net Promoter Score) system with the Video Consultation product instead of using the built-in one?

Yes, it is entirely possible to use your own NPS or customer feedback system. We offer two primary methods to achieve this, allowing you to choose the level of integration that best suits your technical resources and desired user experience.

You can also disable our native NPS and feedback collection feature from your dashboard settings to ensure your customers are not presented with two different surveys.

Here are the two integration options:

**Option 1: Using Tracking Events (Simpler Implementation)**

This is the most straightforward approach. Our product emits a JavaScript event called ‘`call_ended'` on your website whenever a video consultation finishes. Your developers can create a "listener" for this event to trigger your own custom logic, such as displaying a pop-up with your survey or redirecting the user to your feedback page.

- **Pros:** Quick and easy to implement with minimal development effort.
- **Cons:** The experience happens outside of our video call widget.
- **Technical Documentation:** For more details, you can refer to our developer documentation on tracking events: `https://developer.example.com/docs/video-consultation/tracking-events/#call_ended`

**Option 2: Using the App Framework (Fully Integrated Experience)**

For a more seamless user experience, you can use our App Framework. This allows you to build custom screens and logic that run directly *inside* our video call widget. Using this method, your NPS or survey would appear as a natural part of the call flow within the same interface.

- **Pros:** Provides a deeply integrated and seamless experience for the end-user.
- **Cons:** Requires more development effort compared to using tracking events.
- **Next Steps:** If this option interests you, please reach out to your Customer Success Manager to discuss the possibilities and arrange a technical workshop if needed.
- Docs: [https://bambuser.com/docs/app-framework/](https://bambuser.com/docs/app-framework/)

### Why are the camera and microphone not working?

Please check the following:

1. OS-Level Permissions:
    - Ensure that your operating system has granted permission for audio and video access.
        - Windows: Go to Settings > Privacy > Camera and Microphone.
        - macOS: Open System Preferences > Security & Privacy > Privacy tab, and check Camera and Microphone.
        - Linux: Check your system’s settings for camera and microphone permissions.
2. Chrome Permissions:
    - Make sure that Chrome has the necessary permissions to access your camera and microphone.
    - You can do this by going to Settings > Privacy and security > Site settings > Camera and Microphone.

Additionally, can you confirm if you are able to use audio and video on any other applications besides Bambuser, such as Google Meet or Zoom?

Next Steps:

- Try Incognito Mode:
    - Open a new incognito window in Chrome by clicking the three dots in the top-right corner and selecting New Incognito Window (or press Ctrl + Shift + N on Windows/Linux, Cmd + Shift + N on macOS).

If the issue persists:

- Screen Recording:
    - Please send a screen recording of the issue with the Chrome Developer Tools console tab open to Bambuser Support.
    - You can open the Developer Tools by pressing F12 or Ctrl + Shift + I (Cmd + Option + I on macOS) and selecting the Console tab.
    - This will help us diagnose any underlying issues more effectively.


## Mobile App/Other

### Do we have an dedicated app for tablet?

Yes, we do. It's very similar to the iPhone app, but the UI is a bit adapted to iPads.


## Overlay Widget/ Others

### Can we configure after how many seconds Overlay Widget will appear again after it has been dismissed by a shopper?

Yes, that is possible to configure on Bambuser’s end. Default value is 600sec, however we can change this per your request.

### How can we enable or disable the video consultation widget for the 1:1 service when an agent is not available?

There are two options on how to manage the visibility of the video consultation widget based on agent availability. Option depends on whether you want to hide OLW ([Overlay Widget](https://bambuser.com/docs/video-consultation/overlay-widget/)) or your own custom element.

1. **Hiding Overlay Widget (OLW):** On the Bambuser side, you can configure settings to control when the widget is displayed. Options include:
    - Always showing the overlay widget.
    - Showing the overlay widget only when agents are online.
    - Showing the overlay widget during specific open hours.
2. **Hiding Your Own Custom UI Element:** You can integrate with our Queue Status methods to dynamically show or hide your UI elements based on agent availability. For more details, refer to the documentation: [Bambuser Queue Status Methods](https://bambuser.com/docs/video-consultation/queue-status/#methods).

### How does the Overlay Widget work?

Our pre-built Overlay Widget (OLW) makes it easier than ever for your customers to join One-to-One sessions from anywhere on your site.

The OLW is an easy way to guide more visitors into the call widget. By appearing automatically after a (configurable) amount of seconds it guides visitors towards sales help at the right time.

The widget comes in three variants: `Video`, `Side dock` and `Avatar`. Each variant appears slightly different and implements different engagement strategies.

### Overlay widget is appering on top of Calls Widget

You most likely have two instances of onBambuserOneToOneReady. If your trigger is both a button and Overlay Widget, make sure to define this trigger within a single onBambuserOneToOneReady


## REST API

### How can I download or access call transcriptions?

You can retrieve call transcription for transcripted calls through Bambuser REST API.


## Video Call/Audio+Video

### Can a caller touch or control anything on the call widget during a call?

The Customer can;

- mute themselves
- enable/disable the camera
- change the video layout
- write something in the chat
- click on products in the product drawer
    - open product info in full view within Call Widget (PDA)
    - open product info in full view on native page (cobrowse)
- go to checkout when there are products in the virtual cart
