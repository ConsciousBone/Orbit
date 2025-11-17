# Orbit
Orbit is an iOS/iPadOS app for space related activities! It includes an ISS tracker, a list of people currently in space, some space jokes, and a spacebar clicker game; built for Hack Club's Siege Week 10.
It supports iPhone and iPad, as well as Mac and Apple Vision Pro using *Designed for iPad*!

# Demos
## Screenshots
TODO: this
## Video
[YouTube link (unlisted)](https://youtu.be/jO5hAH8tdoo)

# How to get Orbit
As per usual for all my Siege projects, this is the way I recommend, but there are indeed other ways to sideload apps onto iOS/iPadOS/etc devices such as AltStore and SideStore; they will all work, there's no reason for them not to!
1. Install [Sideloadly](https://sideloadly.io) and its dependencies; if I remember correctly there are none on macOS but Windows needs iTunes and iCloud **not from the Microsoft Store**; the Sideloadly website will have links to all dependencies you need for your OS.
2. From the [Releases](https://github.com/ConsciousBone/Orbit/releases/tag/stable) tab, find the latest release - it should be at the top -, and download the attached `Orbit.ipa` file.
3. Using a cable that supports both charge *and* data transfer, connect your device to your computer, tap `Trust` if promped to and enter your password, then open Sideloadly.
4. In Sideloadly, click the file icon with the `IPA` text, and select the previously downloaded `Orbit.ipa` file.
5. Select your device in the `iDevice` dropdown, and make sure the name matches with the device you wish to sideload Orbit to.
6. In the `Apple ID` text field, enter your Apple Account/ID's email. If you use a free Apple developer account, you will need to reinstall/resign Orbit every 7 days; with a paid dev account you only have to reinstall/resign Orbit once every 365 days!
7. Click the `Start` button, and enter your Apple Account/ID's password when prompted. **No one apart from you and Apple will see this password - not the Sideloadly devs and not me.**
8. Wait for the app to install, and then launch it! *If you are prompted to enable Developer Mode or trust the app/dev, so do.*

# Inspiration
Space has always been a fascinating topic for me, and so has location-based tracking, so combine that with this week's Siege theme being `Space`, it was the perfect opportunity for me to combine these interests into one app!

# Tech stack
- Swift (what basically every modern app for Apple platforms is written in, if the developer has some mental sanity)
- SwiftUI (what the app's UI is built with; incredible UI framework, does most of the work for me, stupid easy to use, tyvm Apple)
- Open Notify APIs (http://open-notify.org, Orbit uses both the [ISS current location API](http://open-notify.org/Open-Notify-API/ISS-Location-Now) and the [people in space API](http://open-notify.org/Open-Notify-API/People-In-Space).)
