import 'package:auth0_flutter2/auth0/auth0.dart';
import 'package:auth0_flutter2/auth0/init_auth0/init_auth0_web.dart';
import 'package:auth0_flutter2/auth0/auth0_flutter_web/auth0_flutter_web.dart'
    as auth0_web;
import 'package:flutter/foundation.dart';

/// Logs in user (via universal login) on web.
Future<String?> loginUser({
  required String auth0Domain,
  required String auth0ClientId,
  String? scheme,
  required String? redirectUri,
  Future<void> Function()? afterLogin,
}) async {
  auth0_web.Auth0? auth0 = await initAuth0Web(
    auth0Domain: auth0Domain,
    auth0ClientId: auth0ClientId,
    redirectUri: redirectUri,
  );

  try {
    // Check if user is logged in.
    final user = await getLoggedInUserId(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
    );

    // If user is not logged in, direct to auth page.
    if (user == null) {
      // Popup for mobile, redirect for desktop.
      if (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android) {
        await auth0.loginWithPopup();
      } else {
        await auth0.loginWithRedirect(redirectUri: redirectUri ?? "");
      }

      // Check again if user is logged in (after auth attempt).
      final nowUser = await getLoggedInUserId(
        auth0Domain: auth0Domain,
        auth0ClientId: auth0ClientId,
      );

      if (nowUser != null) {
        return nowUser;
      } else {
        return null;
      }
    } else {
      return user;
    }
  } catch (e) {
    return null;
  }
}
