import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class ListaMercadoAppAuthUser {
  ListaMercadoAppAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ListaMercadoAppAuthUser> listaMercadoAppAuthUserSubject =
    BehaviorSubject.seeded(ListaMercadoAppAuthUser(loggedIn: false));
Stream<ListaMercadoAppAuthUser> listaMercadoAppAuthUserStream() =>
    listaMercadoAppAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
