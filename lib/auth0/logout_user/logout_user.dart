import 'logout_user_stub.dart'
    if (dart.library.io) 'logout_user_mobile.dart'
    if (dart.library.js) 'logout_user_web.dart' as impl;

Future<void> logoutUser({
  required String auth0Domain,
  required String auth0ClientId,
}) =>
    impl.logoutUser(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
    );
