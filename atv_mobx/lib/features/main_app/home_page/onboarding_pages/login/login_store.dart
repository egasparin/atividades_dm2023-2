import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

// ignore: library_private_types_in_public_api
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String emailError = '';

  @action
  changeEmail(String newEmail) => email = newEmail;

  @action
  changePassword(String newPassword) => password = newPassword;

  @computed
  bool get isEmailValid => email.isEmpty || email.contains('@');

  @computed
  bool get isPasswordValid => password.isEmpty || password.length >=4;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
