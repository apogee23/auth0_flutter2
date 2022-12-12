import 'handle_redirect_callback_stub.dart'
    if (dart.library.io) 'handle_redirect_callback_mobile.dart'
    if (dart.library.js) 'handle_redirect_callback_web.dart' as impl;

/// Cross-platform method for logging in user (via universal login).
Future<bool> handleRedirectCallback({
  required String auth0Domain,
  required String auth0ClientId,
  String? redirectUri,
  String? url,
}) =>
    impl.handleRedirectCallback(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
      redirectUri: redirectUri,
      url: url,
    );
