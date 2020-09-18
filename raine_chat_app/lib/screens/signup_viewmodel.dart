import 'package:raine_chat_app/app/locator.dart';
import 'package:raine_chat_app/services/authentication_services.dart';
import 'package:stacked/stacked.dart';

class SignupViewModel extends BaseViewModel {
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  Future signup({String username, String password}) async {
    setBusy(true);
    await authenticationService.signupUser(
      username: username,
      password: password,
    );
    setBusy(false);
    print(authenticationService.user.username);
  }
}
