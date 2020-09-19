import 'package:raine_chat_app/app/locator.dart';
import 'package:raine_chat_app/services/authentication_services.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  bool _isInvalidLogin = false;
  bool get isInvalidLogin => _isInvalidLogin;

  Future login({String username, String password}) async {
    setBusy(true);
    _isInvalidLogin = await authenticationService.loginUser(
      username: username,
      password: password,
    );
    setBusy(false);
    notifyListeners();
    return isInvalidLogin;
  }

  void resetValue() {
    _isInvalidLogin = false;
    notifyListeners();
  }
}
