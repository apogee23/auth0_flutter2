/// Stub method for logging in a user.
Future<String?> loginUser({
  required String auth0Domain,
  required String auth0ClientId,
  String? scheme,
  String? redirectUri,
  Future<void> Function()? afterLogin,
}) =>
    throw UnsupportedError(
      'This is the stub method, use the active method instead.',
    );
