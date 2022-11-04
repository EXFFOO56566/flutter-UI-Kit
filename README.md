
# FlutKit - Flutter UI Kit
> version 3.0.0

FlutKit is a nicely designed and developed multipurpose mobile application UI kit developed using Flutter. Flutter is an open-source mobile application development SDK created by Google and used to develop applications for Android and iOS.

FlutKit by Eze-Odikwa Tochuwku Jed makes an easy job for a developer to have the modern look and feel in the mobile application. It saves lots of hustle and time to develop a nicely design UI for modern mobile application. FlutKit is ready to use and can be easily integrated in any flutter project. The code organization is easy to understand any part can be taken out and added into flutter application.

FlutKit by Eze-Odikwa Tochuwku Jed comes with around 100 ready to use widgets, 180+ screens covering many use cases and 10 apps. It comes with both light and dark theme and works great with both android and ios.

https://play.google.com/store/apps/details?id=com.tochycomputerservices.orangemusic

https://play.google.com/store/apps/details?id=com.tochycomputerservices.orangemusic

### Apps
* Shopping (2 Apps)
* Hotel
* Course
* Health
* Social
* Event
* Chat
* Food
* Music

### Other Screens

* Authentications
* Dashboards
* Mail
* Profiles
* Quiz
* Settings
* Wallet

### Widgets

* Animated Button
* Appbars
* Bottom sheets
* Cards
* Carousel
* Charts
* Chips
* Cupertino widgets
* Dialogs
* Dismissible list
* Dropdowns
* Expansions
* Forms
* Google map
* Grid
* Hero transitions
* Icon button
* Inputs
* List
* Navigation
* Progress
* Popups
* Searchbar
* Sliders
* Snackbar
* Stepper
* Bottom Navigation (Custom)
* Onboarding wizards (Custom)
* Text liquid fill (Custom)



### Project Structure

```
...
   ├── screens/        # This folder contains many different folders, each of which corresponds to a different screens of the app.
   ├── widgets/       # This folder contains many different folders, each of which corresponds to a different widgets of the app.
   ├── utils/         # This folder contains all utilities of the app.
   └── main.dart    # Root file of the project
```

## Project Setup

In order to set up the project, please follow below steps:

### Flutter setup

1. Upgrade flutter to newest version
```
flutter upgrade
```

2. Install package dependencies:
```
flutter pub get
```

3. Run the project by running command:
```
flutter run
```

4. Use one of these commands to build the project:
```
flutter build ios
flutter build apk
flutter build appbundle
```

5. If any issue (run the below command to troubleshoot):
```
flutter doctor
```


#### Google map setup

1. To use Google Maps in your Flutter app, you need to configure an API project with the [Google Maps Platform](https://cloud.google.com/maps-platform/), following both the [Maps SDK for Android's Get API key](https://developers.google.com/maps/documentation/android-sdk/get-api-key), and [Maps SDK for iOS' Get API key](https://developers.google.com/maps/documentation/ios-sdk/get-api-key) processes. With API keys in hand, carry out the following steps to configure both Android and iOS applications.
2. To add an API key to the Android app, edit the ```AndroidManifest.xml``` file in ```android/app/src/main```. Add a single meta-data entry containing the API key created in the previous step.
3. To add an API key to the iOS app, edit the ```AppDelegate.swift``` file in ```ios/Runner```. Unlike Android, adding an API key on iOS requires changes to the source code of the Runner app. The AppDelegate is the core singleton that is part of the app initialization process.

4. [For more on google map](https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/#3)


For help getting started with Flutter, check [online documentation](https://flutter.dev/docs), which offers great tutorials, samples, guidance on mobile development, and a full API reference. If you run into any issue or question, feel free to reach out to us via email info@tochycomputerservices.com

### Flutter packages used in FlutKit:

* shared_preferences
* provider
* cupertino_icons
* material_design_icons_flutter
* charts_flutter
* google_fonts
* google_maps_flutter
