import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter2/auth0/init_auth0/init_auth0_mobile.dart';

/// Logs out user (via universal login) on mobile.
Future<void> logoutUser({
  required String auth0Domain,
  required String auth0ClientId,
  required String redirectUri,
  String? scheme,
}) async {
  Auth0 auth0 = initAuth0Mobile(
    auth0Domain,
    auth0ClientId,
  );

  try {
    scheme != null
        ? await auth0.webAuthentication(scheme: scheme).logout()
        : await auth0.webAuthentication().logout();
  } catch (e) {
    throw Exception(e);
  }
}
