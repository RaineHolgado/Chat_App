import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:raine_chat_app/app/locator.iconfig.dart';

final locator = GetIt.instance;

@injectableInit
void configure() => $initGetIt(locator);