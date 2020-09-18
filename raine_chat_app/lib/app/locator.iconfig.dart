import 'package:get_it/get_it.dart';
import 'package:raine_chat_app/services/authentication_services.dart';
import 'package:raine_chat_app/services/firestore_services.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  g.registerLazySingleton<FirestoreService>(() => FirestoreService());
}