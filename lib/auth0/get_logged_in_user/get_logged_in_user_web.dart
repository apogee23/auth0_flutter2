import 'package:auth0_flutter2/auth0/init_auth0/init_auth0_web.dart';
import 'package:auth0_flutter2/auth0/auth0_flutter_web/auth0_flutter_web.dart'
    as auth0_web;

/// Fetches authenticated user ID on web.
Future<String?> getLoggedInUserId({
  required String auth0Domain,
  required String auth0ClientId,
  String? redirectUri,
}) async {
  try {
    auth0_web.Auth0 auth0 = await initAuth0Web(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
      redirectUri: redirectUri,
    );

    var credentials = await auth0.getUser();
    return credentials?["sub"];
  } catch (e) {
    return null;
  }
}
