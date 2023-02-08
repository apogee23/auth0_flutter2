import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter2/auth0/auth0.dart';
import 'package:auth0_flutter2/auth0/init_auth0/init_auth0_mobile.dart';

/// Logs in user (via universal login) on mobile.
Future<String?> loginUser({
  required String auth0Domain,
  required String auth0ClientId,
  String? scheme,
  String? redirectUri,
  Future<void> Function()? afterLogin,
}) async {
  Auth0 auth0 = initAuth0Mobile(
    auth0Domain,
    auth0ClientId,
  );

  try {
    // Check if user is logged in.
    final user = await getLoggedInUserId(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
    );

    // If user is not logged in, direct to auth page.
    if (user == null) {
      await auth0.webAuthentication(scheme: scheme).login();

      // Check again if user is logged in (after auth attempt).
      final nowUser = await getLoggedInUserId(
        auth0Domain: auth0Domain,
        auth0ClientId: auth0ClientId,
      );

      if (nowUser != null) {
        if (afterLogin != null) afterLogin();
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
