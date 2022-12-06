import 'login_user_stub.dart'
    if (dart.library.io) 'login_user_mobile.dart'
    if (dart.library.js) 'login_user_web.dart' as impl;

Future<String?> loginUser({
  required String auth0Domain,
  required String auth0ClientId,
  Future<void> Function()? afterLogin,
}) =>
    impl.loginUser(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
      afterLogin: afterLogin,
    );
