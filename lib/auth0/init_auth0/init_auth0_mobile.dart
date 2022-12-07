import 'package:auth0_flutter/auth0_flutter.dart';

/// Initialize Auth0 class on mobile.
Auth0 initAuth0Mobile(
  String auth0Domain,
  String auth0ClientId,
) {
  return Auth0(
    auth0Domain,
    auth0ClientId,
  );
}
