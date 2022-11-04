import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    //TODO: Add google map API key here
    GMSServices.provideAPIKey("")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
