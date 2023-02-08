library auth0_flutter2;

import 'package:auth0_flutter2/auth0/auth0.dart' as auth02;
import 'package:url_strategy/url_strategy.dart' as url_strategy;

/// Base class of the package which is always staticly referenced.
class Auth0Flutter2 {
  /// Disables the platform override in order to use a manually registered
  /// ignore: comment_references
  /// [SharePlatform] for testing purposes.
  /// See https://github.com/flutter/flutter/issues/52267 for more details.
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

  /// Sets the Auth0 ClientId.
  static set redirectUri(String value) {
    if (value == instance._redirectUri) {
      return;
    }
    instance._redirectUri = value;
  }

  /// Retrieves the Auth0 ClientId.
  static String get redirectUri {
    return instance._redirectUri!;
  }

  /// Sets the custom scheme.
  static set scheme(String value) {
    if (value == instance._scheme) {
      return;
    }
    instance._scheme = value;
  }

  /// Retrieves the custom scheme.
  static String get scheme {
    return instance._scheme!;
  }

  /// The instance of [Auth0Flutter2].
  static final Auth0Flutter2 instance = Auth0Flutter2._();

  /// The Auth0 domain of the application.
  String? _auth0Domain;

  /// The Auth0 client ID of the application.
  String? _auth0ClientId;

  /// For web applications, the redirect URL after login.
  String? _redirectUri;

  /// For Android applications, the custom scheme.
  String? _scheme;

  /// Fetches the currently authenticated user ID.
  /// Returns null if no user is authenticated.
  Future<String?> getLoggedInUserId() async {
    return await auth02.getLoggedInUserId(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
      redirectUri: redirectUri,
    );
  }

  /// If user is not authenticated, shows universal login.
  /// Returns user ID of logged in user.
  Future<String?> loginUser({
    Future<void> Function()? afterLogin,
  }) async {
    return await auth02.loginUser(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
      redirectUri: redirectUri,
      scheme: scheme,
      // afterLogin: afterLogin,
    );
  }

  /// Fetches the currently authenticated user ID.
  /// Returns null if no user is authenticated.
  Future<bool> handleWebLoginCallback(String? url) async {
    try {
      return await auth02.handleRedirectCallback(
        auth0Domain: auth0Domain,
        auth0ClientId: auth0ClientId,
        redirectUri: redirectUri,
        url: url,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Logs out current user.
  Future<void> logoutUser() async {
    return auth02.logoutUser(
      auth0Domain: auth0Domain,
      auth0ClientId: auth0ClientId,
      scheme: scheme,
    );
  }

  // Wrapper of url_strategy package "setPathUrlStrategy" method.
  static Future<void> setPathUrlStrategy() async {
    try {
      return url_strategy.setPathUrlStrategy();
    } catch (e) {
      throw Exception(e);
    }
  }
}
