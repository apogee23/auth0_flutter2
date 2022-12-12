A Flutter package to easily integrate Auth0 into Android, iOS, and Web Flutter apps.

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :----: |
|   ✔️    | ✔️  |  x   | ✔️  |  x   |   x   |

Auth0Flutter2 is not supported on MacOS, Windows, or Linux.

## Features

Integrate Auth0 authentication across mobile and web Flutter apps. Login users, logout users, and identify currently authenticated users across web and mobile.

## Usage

To use this plugin, add `auth0_flutter2` as a [dependency in your pubspec.yaml file](https://plus.fluttercommunity.dev/docs/overview).

### iOS and Android

Follow the iOS and Android usage instructions in the [official Auth0 mobile package](https://pub.dev/packages/auth0_flutter)

### Web

Add the Auth0 Javascript SPA (Single Page Application) library.

```html
<script src="https://cdn.auth0.com/js/auth0-spa-js/1.13/auth0-spa-js.production.js"></script>
```

In main.dart, add a method to handle Web login callbacks.

```dart
  @override
  void initState() {
    checkForRedirectCallback();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    .....
  }

  Future<void> checkForRedirectCallback() async {
    // Check for login callback state.
    var redirectCallbackHandled =
        await Auth0Flutter2.instance.handleWebLoginCallback(
      Uri.base.toString(),
    );

    // If callback was able to be processed, do something.
    if (redirectCallbackHandled) {
      // DO SOMETHING...
    }
  }
```

## Example

Import the library.

```dart
import 'package:auth0_flutter2/auth0_flutter2.dart';
```

Then initialize the `Auth0Flutter2` class in your `main()` method.

```dart
void main() {
  Auth0Flutter2.auth0Domain = "AUTH0_DOMAIN";
  Auth0Flutter2.auth0ClientId = "AUTH0_CLIENT_ID";
  Auth0Flutter2.redirectUri = "YOUR_APP_REDIRECT_URI";

  // Set the URL strategy for our web app. Removes 
  // trailing hash(#) to ensure login callbacks
  // will be captured and processed correctly.
  Auth0Flutter2.setPathUrlStrategy();

  runApp(const MyApp());
}
```

Then invoke the class methods anywhere in your Dart code.

```dart
Auth0Flutter2.instance.loginUser();
Auth0Flutter2.instance.logoutUser();
Auth0Flutter2.instance.getLoggedInUserId();
```


## For The Love Of Open Source.

<a href="https://www.buymeacoffee.com/apogee23" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
