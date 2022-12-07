import 'package:auth0_flutter2/auth0/auth0_flutter_web/auth0_flutter_web.dart'
    as auth0_web;

/// Initialize Auth0 class on web.
Future<auth0_web.Auth0> initAuth0Web(
  String auth0Domain,
  String auth0ClientId,
) async {
  try {
    return auth0_web.createAuth0Client(
      auth0_web.Auth0ClientOptions(
        domain: auth0Domain,
        client_id: auth0ClientId,
      ),
    );
  } catch (e) {
    throw Exception(e);
  }
}
