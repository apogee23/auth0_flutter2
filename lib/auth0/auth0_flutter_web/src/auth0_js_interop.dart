@JS()
library auth0_spa_sdk;

import 'promise_to_future_as_map_stub.dart' if (dart.library.js) 'dart:html';
import 'js_stubs.dart' if (dart.library.js) 'package:js/js.dart';
import 'package:universal_html/js_util.dart';
import 'options.dart';

@JS()
class _Promise<T> {} // just to denote a js promise object

@JS('createAuth0Client')
external _Promise<_Auth0JS> Function(Auth0ClientOptions) get _createAuth0Client;

/// Creates the Auth0 client.
Future<Auth0> createAuth0Client(Auth0ClientOptions options) {
  return promiseToFuture(_createAuth0Client(options))
      .then((auth0js) => Auth0._(auth0js));
}

@JS()
abstract class _Auth0JS {
  @JS()
  external _Promise<void> loginWithRedirect(RedirectLoginOptions options);
  @JS()
  external _Promise<void> loginWithPopup(
      PopupLoginOptions options, PopupConfigOptions config);
  @JS()
  external _Promise<void> handleRedirectCallback(String url);
  @JS()
  external void logout(LogoutOptions options);
  @JS()
  external _Promise<String> getTokenWithPopup(
      GetTokenWithPopupOptions options, PopupConfigOptions config);
  @JS()
  external _Promise<String> getTokenSilently(GetTokenSilentlyOptions options);
  @JS()
  external _Promise<Map<String, dynamic>> getUser(GetUserOptions options);
  @JS()
  external _Promise<Map<String, dynamic>> getIdTokenClaims(
      GetIdTokenClaimsOptions options);
  @JS()
  external _Promise<bool> isAuthenticated();
  @JS()
  external _Promise<Map<String, dynamic>> getUserInfo(String accessToken);
}

class Auth0 {
  final _Auth0JS _auth0js;

  Auth0._(this._auth0js);

  /// Calls Auth0 loginWithRedirect method.
  Future<String?> loginWithRedirect({String redirectUri = ''}) async {
    return await promiseToFuture(_auth0js
        .loginWithRedirect(RedirectLoginOptions(redirect_uri: redirectUri)));
  }

  /// Calls Auth0 loginWithPopup method.
  Future<void> loginWithPopup(
      {PopupLoginOptions? options, PopupConfigOptions? config}) {
    return promiseToFuture(
        _auth0js.loginWithPopup(options ?? jsify({}), config ?? jsify({})));
  }

  Future<void> handleRedirectCallback(String url) {
    return promiseToFuture(_auth0js.handleRedirectCallback(url));
  }

  /// Calls Auth0 logout method.
  void logout({LogoutOptions? options}) =>
      _auth0js.logout(options ?? jsify({}));

  /// Calls Auth0 getTokenWithPopup method.
  Future<String> getTokenWithPopup(
      {GetTokenWithPopupOptions? options, PopupConfigOptions? config}) {
    return promiseToFuture(
        _auth0js.getTokenWithPopup(options ?? jsify({}), config ?? jsify({})));
  }

  /// Calls Auth0 getTokenSilently method.
  Future<String> getTokenSilently({GetTokenSilentlyOptions? options}) {
    return promiseToFuture(_auth0js.getTokenSilently(options ?? jsify({})));
  }

  /// Calls Auth0 getUser method.
  Future<Map<String, dynamic>?> getUser({GetUserOptions? options}) =>
      promiseToFutureAsMap(_auth0js.getUser(options ?? jsify({})));

  /// Calls Auth0 getIdTokenClaims method.
  Future<Map<String, dynamic>?> getIdTokenClaims(
          {GetIdTokenClaimsOptions? options}) =>
      promiseToFutureAsMap(_auth0js.getIdTokenClaims(options ?? jsify({})));

  /// Calls Auth0 isAuthenticated method.
  Future<bool> isAuthenticated() => promiseToFuture(_auth0js.isAuthenticated());

  /// Calls Auth0 getUserInfo method.
  Future<Map<String, dynamic>?> getUserInfo(String accessToken) =>
      promiseToFuture(
        _auth0js.getUserInfo(accessToken),
      );
}
