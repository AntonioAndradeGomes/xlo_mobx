import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_clone/helpers/extensions.dart';
import 'package:xlo_clone/models/User.dart';
import 'package:xlo_clone/repositories/user_repository.dart';
import 'package:xlo_clone/stores/user_manager_store.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @observable
  bool loading = false;

  /*@action
  void setLoading(bool value) => loading = value;*/

  @observable
  String error;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  @computed
  bool get pass1Valid => pass1 != null && pass1.length >= 6;
  String get pass1Error {
    if (pass1 == null || pass1Valid) {
      return null;
    } else if (pass1.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Senha muito curta';
    }
  }

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error {
    if (pass2 == null || pass2Valid) {
      return null;
    } else {
      return 'Senhas não coincidem';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @action
  Future<void> _signUp() async {
    loading = true;
    final user = User(
      name: name,
      email: email,
      password: pass1,
      phone: phone,
    );
    try {
      final resultUser = await UserRepository().signUp(
        user: user,
      );
      print(resultUser.toString());
      GetIt.I<UserManagerStore>().setUser(resultUser);
      error = null;
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
