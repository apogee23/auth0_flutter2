library auth0_flutter2;

import 'package:auth0_flutter2/auth0/auth0.dart' as auth02;

// Base class of the package which is always staticly referenced.
class Auth0Flutter2 {
  // Disables the platform override in order to use a manually registered
  // ignore: comment_references
  // [SharePlatform] for testing purposes.
  // See https://github.com/flutter/flutter/issues/52267 for more details.
  //
  Auth0Flutter2._();

  /// Sets the Auth0 Domain.
  static set auth0Domain(String value) {
    if (value == instance._auth0Domain) {
      return;
    }
    instance._auth0Domain = value;
  }

  /// Retrieves the Auth0 Domain.
  static String get auth0Domain {
    if (instance._auth0Domain == null) {
      throw Exception('Domain is not set');
    }
    return instance._auth0Domain!;
  }

  /// Sets the Auth0 ClientId.
  static set auth0ClientId(String value) {
    if (value == instance._auth0ClientId) {
      return;
    }
    instance._auth0ClientId = value;
  }

  /// Retrieves the Auth0 ClientId.
  static String get auth0ClientId {
    if (instance._auth0ClientId == null) {
      throw Exception('ClientId is not set');
    }
    return instance._auth0ClientId!;
  }

  // The instance of [Auth0Flutter2].
  static final Auth0Flutter2 instance = Auth0Flutter2._();

  // The Auth0 domain of the application.
  String? _auth0Domain;
  // The Auth0 client ID of the application.
  String? _auth0ClientId;

  // Fetches the currently authenticated user ID.
  // Returns null if no user is authenticated.
  Future<String?> getLoggedInUserId() async {
    return await auth02.getLoggedInUserId(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
    );
  }

  // If user is not authenticated, shows universal login.
  // Returns user ID of logged in user.
  Future<String?> loginUser({
    Future<void> Function()? afterLogin,
  }) async {
    return await auth02.loginUser(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
      afterLogin: afterLogin,
    );
  }

  // Logs out current user.
  Future<void> logoutUser() async {
    return auth02.logoutUser(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
    );
  }
}
