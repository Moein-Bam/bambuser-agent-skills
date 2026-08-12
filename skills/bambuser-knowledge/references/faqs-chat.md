# FAQ — Chat

Curated internal Q&A for common customer questions, organized by topic. Sourced from Bambuser's support FAQ database. Where an answer involves exact limits, prices, hosts, or config keys, verify against the live docs (`bambuser.com/docs/llms.txt`) or the knowledge base (`knowledge.bambuser.com`) before relying on it.


## Analytics/Others

### How often is sales stats data updated and reflected in Bambuser Chat Insights? Is there a specific time that it updates?

For **Chat Insights**, the update period for most insights can be up to 72 hours. While it often updates faster (typically within 1-2 days), delays up to 3 days are possible.

### What is the difference between a "Sale" and an "Order" in Bambuser Insights?

A "Sale" represents the total monetary value of all "Orders." In essence, "Sales" is the aggregated financial amount of all transactions, while "Orders" refers to the individual transactions themselves. The distinction between these terms is not always clearly articulated in existing tooltips, and we appreciate the feedback to improve this clarity.


## Associate/EmployeeID

### when the employee ID is changed by associate, is the switch immediate or does a store manager need to also approve that change?

There is only one approval step (if not disabled for merchant) and that is initial accociate approval that store manager does, then any changes to name, image or employee id that associate may do are applied directly


## gtm

### Can I integrate without the help of developer?

Integration efforts are always required but can vary significantly depending on the features you choose to implement. To simplify the process, we offer a GTM integration that includes a user-friendly interface for implementing the core functionality of our product. Learn more here: [https://bambuser.com/docs/chat/integrate-chat-with-gtm/](https://bambuser.com/docs/chat/integrate-chat-with-gtm/)


## Misc

### Can I implement tracking tags/codes directly in the code base? Does it have to be through GTM?

The Bambuser Chat tag and tracking scripts can be added directly to the code base or injected through tag manager solutions. It is fine to add the tracking tags directly to the code base as long as they are executed on relevant events.

However, it is usually a better practice to use tag manager solutions to add tracking tags to the website. It is often easier to manage the tags and triggers through tag manager solutions than depending on a code release.

Here are more specific documentation related to the Bambuser Chat tag and the tracking tags:

- [Add the Bambuser Chat tag](https://bambuser.com/docs/chat/bam-chat-integration/#1-add-the-bambuser-chat-tag)
- [Track Shopper Events](https://bambuser.com/docs/chat/bam-chat-integration/#2-track-shopper-events)

### How does the chat routing algorithm select associates?

The routing algorithm selects 1-6 associates based on a scoring system, considering factors like availability and online status. Selected associates are notified via in-app alerts or push notifications (for mobile). The system repeats this selection process every 15 seconds until the chat is claimed or the 1.5-minute timeout is reached.

### How does the system handle a missed chat compared to a manually declined chat?

A missed chat occurs when an agent does not respond to the chat notification (e.g., does not claim or decline). Like a declined chat, a missed chat is recorded, and the system continues to route the chat to other available associates every 15 seconds for up to 1.5 minutes. If no associate claims the chat within this period, the customer is notified that staff is busy and prompted to leave their contact information. The key difference is that manually declining a chat is an active action, but both missed and declined chats allow the system to attempt rerouting to other associates if available.

### What happens if no agents claim the chat within the time limit?

If no agent claims the chat within 1.5 minutes, the system notifies the customer that staff is busy and prompts them to submit their contact information. All associates who were invited to claim the chat (and did not decline) are marked as having missed it, with a possible delay in the notification that they have been set offline.

### What happens when an agent manually declines an incoming chat request?

When an agent manually declines an incoming chat, the system records the decline. The chat is then routed to other available associates based on a scoring algorithm, selecting between 1-6 associates depending on their availability and score. This routing process repeats every 15 seconds for up to 1.5 minutes until the chat is claimed or times out. If an agent declines three chats in a row without claiming any, they are marked as offline and notified. As long as other associates are available, the chat will not immediately prompt the customer to leave a message.

### What is Bambuser Chat?

Bambuser Chat is a digital tool, that allows you to connect with online shoppers in the same way you would with your in-store shoppers.

For more information, check out our [Chat](https://knowledge.bambuser.com/en_US/introducing-chat) documentation.
