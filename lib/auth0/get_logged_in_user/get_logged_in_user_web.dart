import 'package:auth0_flutter2/auth0/init_auth0/init_auth0_web.dart';
import 'package:auth0_flutter2/auth0/auth0_flutter_web/auth0_flutter_web.dart'
    as auth0_web;

Future<String?> getLoggedInUserId({
  required String auth0Domain,
  required String auth0ClientId,
}) async {
  auth0_web.Auth0 auth0 = await initAuth0Web(
    auth0Domain,
    auth0ClientId,
  );

  try {
    var credentials = await auth0.getUser();
    return credentials?["sub"];
  } catch (e) {
    return null;
  }
}
