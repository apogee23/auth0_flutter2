import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter2/auth0/init_auth0/init_auth0_mobile.dart';

/// Fetches authenticated user ID on mobile.
Future<String?> getLoggedInUserId({
  required String auth0Domain,
  required String auth0ClientId,
  String? redirectUri,
}) async {
  try {
    Auth0 auth0 = initAuth0Mobile(
      auth0Domain,
      auth0ClientId,
    );

    /// Check if user is logged in.
    if (await auth0.credentialsManager.hasValidCredentials()) {
      var creds = await auth0.credentialsManager.credentials();
      return creds.user.sub;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
