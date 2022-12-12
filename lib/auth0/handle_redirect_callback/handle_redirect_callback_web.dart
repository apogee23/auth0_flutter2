import 'package:auth0_flutter2/auth0/init_auth0/init_auth0_web.dart';
import 'package:auth0_flutter2/auth0/auth0_flutter_web/auth0_flutter_web.dart'
    as auth0_web;

/// Logs in user (via universal login) on web.
Future<bool> handleRedirectCallback({
  required String auth0Domain,
  required String auth0ClientId,
  required String? redirectUri,
  required String? url,
}) async {
  auth0_web.Auth0? auth0 = await initAuth0Web(
    auth0Domain: auth0Domain,
    auth0ClientId: auth0ClientId,
    redirectUri: redirectUri,
  );

  if (url != null && url.contains("code=") && url.contains("state=")) {
    await auth0.handleRedirectCallback(url);
    return true;
  } else {
    return false;
  }
}
