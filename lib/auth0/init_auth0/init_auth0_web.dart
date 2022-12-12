import 'package:auth0_flutter2/auth0/auth0_flutter_web/auth0_flutter_web.dart'
    as auth0_web;

/// Initialize Auth0 class on web.
Future<auth0_web.Auth0> initAuth0Web({
  required String auth0Domain,
  required String auth0ClientId,
  String? redirectUri,
}) async {
  try {
    return auth0_web.createAuth0Client(
      auth0_web.Auth0ClientOptions(
        domain: auth0Domain,
        client_id: auth0ClientId,
        redirect_uri: redirectUri,
        useRefreshTokens: true,
        cacheLocation: "localstorage",
      ),
    );
  } catch (e) {
    throw Exception(e);
  }
}
