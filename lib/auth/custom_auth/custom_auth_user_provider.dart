import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class VishalIndustriesAuthUser {
  VishalIndustriesAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<VishalIndustriesAuthUser> vishalIndustriesAuthUserSubject =
    BehaviorSubject.seeded(VishalIndustriesAuthUser(loggedIn: false));
Stream<VishalIndustriesAuthUser> vishalIndustriesAuthUserStream() =>
    vishalIndustriesAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
