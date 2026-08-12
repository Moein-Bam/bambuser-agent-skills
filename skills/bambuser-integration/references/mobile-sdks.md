# Mobile SDKs & WebView

Native mobile is a **sub-topic of Live Shopping and Shoppable Video**, not a separate product. First decision on any mobile request: **native SDK or WebView?**

## Decision guide

- **WebView** — fastest path: load the existing web embed inside the app. Docs: `live/webview-integration-android.md`, `live/webview-integration-ios.md`. Trade-offs: limited native control; **legacy Conversion Tracking is not available in WebView** (Shopper Events via the web layer still applies — verify in the tracking doc).
- **Native Player SDK (Live)** — full control: iOS, Android, React Native. The pointer pages (`live/ios-native-sdk-integration.md`, `live/android-native-sdk-integration.md`) note **access is granted on request** — the customer may need Bambuser to enable/provide the SDK. Each platform has its own doc directory covering the same topics: setup, installation, configuration, cart integration, product hydration, highlights, wishlist, audio control, captions, preloading, promoted shows, tracking.
- **Shoppable Video SDKs** — separate SDKs (iOS/Android) under the Shoppable Video docs.

## Slug patterns (asymmetric — don't guess across products)

- Live: `live/mobile-sdk-integration-android/setup.md`, `live/mobile-sdk-integration-ios/setup.md`, `live/mobile-sdk-integration-react-native/setup.md` (RN also has `events.md`, `player-api.md`; overview at `live/react-native-overview.md`).
- Shoppable Video: `shoppable-video/mobileSDK/sdk-android-integration.md`, `shoppable-video/mobileSDK/sdk-iOS-integration.md` — note the **camelCase `mobileSDK` directory and `sdk-iOS` casing**; lowercase guesses 404.
- Base `https://bambuser.com/docs/`; when in doubt, discover via `llms.txt`.

## Region: an enum, not a host

Mobile SDKs select region with an **enum whose non-EU value is literally `US`** (not "Global"): Android `OrganizationServer.US` / `.EU`; iOS `BambuserVideoPlayer(server: .US)` / `.EU`. Don't pass a host URL. Details in [`regions.md`](regions.md); exact type names in each platform's setup doc.

## Durable concepts

- The native SDKs mirror the web player's **cart/product-data model** (hydration + cart callbacks — see [`cart-and-product-data.md`](cart-and-product-data.md)) with platform-native APIs; the concepts transfer, the method names don't. Fetch the platform's cart/hydration pages when writing code.
- Deep links from a show into the app (product taps, checkout) need the app to register handlers — plan the navigation story with the customer before writing player code.
- Ask early: minimum OS versions, dependency manager (SPM/CocoaPods/Gradle), and whether the same app must also show Shoppable Video (two SDKs, two integrations).
