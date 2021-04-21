import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/helpers/extensions.dart';
import 'package:xlo_clone/repositories/user_repository.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String pass;

  @action
  void setPass(String value) => pass = value;

  @observable
  bool loading = false;

  @observable
  String error;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError =>
      email == null || emailValid ? null : 'E-mail inválido';

  @computed
  bool get passValid => pass != null && pass.length >= 6;
  String get passError => pass == null || passValid ? null : 'Senha inválida';

  @computed
  bool get isFormValid => emailValid && passValid;

  @computed
  Function get loginPressed => (isFormValid && !loading) ? _login : null;

  @action
  Future<void> _login() async {
    loading = true;
    error = null;
    try {
      final user = await UserRepository().loginWithEmail(email, pass);
      GetIt.I<UserManagerStore>().setUser(user);
    } catch (e) {
      error = e;
    }
    loading = false;
  }
}
