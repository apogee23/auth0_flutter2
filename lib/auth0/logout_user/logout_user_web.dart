import 'package:auth0_flutter2/auth0/init_auth0/init_auth0_web.dart';
import 'package:auth0_flutter2/auth0/auth0_flutter_web/auth0_flutter_web.dart'
    as auth0_web;

/// Logs out user (via universal login) on web.
Future<void> logoutUser({
  required String auth0Domain,
  required String auth0ClientId,
  String? scheme,
}) async {
  auth0_web.Auth0 auth0 = await initAuth0Web(
    auth0Domain: auth0Domain,
    auth0ClientId: auth0ClientId,
  );

  try {
    auth0.logout();
  } catch (e) {
    throw Exception(e);
  }
}
