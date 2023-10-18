import 'package:cuzdan/core/base/model/base_viewmodel.dart';
import 'package:cuzdan/core/constant/db/collection_names.dart';
import 'package:cuzdan/core/constant/enum/authentication_enum.dart';
import 'package:cuzdan/core/constant/navigation/navigation_constants.dart';
import 'package:cuzdan/core/init/navigation/navigation_service.dart';
import 'package:cuzdan/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  late final Authentication? authentication;
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  final AuthService _authService = AuthService();
  TextEditingController? emailController;
  TextEditingController? passwordController;
  bool passwordVisible = false;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @action
  void onPageChanged(Authentication authentication) => passwordVisible = authentication == Authentication.REGISTER;

  @action
  void isLockStateChange() {
    passwordVisible = !passwordVisible;
  }

  @action
  void goBack() {
    NavigationService.instance.navigateToPageClear(path: NavigationConstants.ONBOARD_VIEW);
  }

  @action
  Future<void> signInWithGoogle() async {
    _authService.signInWithGoogle();
  }

  @action
  Future<void> loginWithEmailAndPassword() async {
    String result = await _authService.loginWithEmailAndPassword(email: emailController!.text, password: passwordController!.text);
    if (result == AuthResultMessage.kAuthSuccessLogin) {
      showCustomSnackbar(context, 'Giriş başarılı!', Icons.done, Colors.green);
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_VIEW);
    } else if (result == AuthResultMessage.kUserNotFound) {
      showCustomSnackbar(context, 'Kullanıcı bulunamadı!', Icons.info, Colors.blue);
    } else if (result == AuthResultMessage.kWrongPassword) {
      showCustomSnackbar(context, 'Hatalı şifre girişi!', Icons.warning, Colors.red);
    } else if (result == AuthResultMessage.kUnExpectedErrorMessage) {
      showCustomSnackbar(context, 'Beklenmeyen bir hata oluştu!', Icons.warning, Colors.red);
    }
  }

  @action
  Future<void> createUserWithEmailAndPassword() async {
    String result = await _authService.createUserWithEmailAndPassword(email: emailController!.text, password: passwordController!.text);
    if (result == AuthResultMessage.kAuthSuccessRegister) {
      showCustomSnackbar(context, 'Kayıt başarılı!', Icons.done, Colors.green);
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW, object: {'authentication': Authentication.LOGIN});
    } else if (result == AuthResultMessage.kWeakPassword) {
      showCustomSnackbar(context, 'Şifre en az 6 karakter uzunluğunda olmalıdır!', Icons.info, Colors.blue);
    } else if (result == AuthResultMessage.kEmailAlreadyInUse) {
      showCustomSnackbar(context, 'Bu email adresine ait hesap bulunmakta!', Icons.warning, Colors.red);
    } else if (result == AuthResultMessage.kUnExpectedErrorMessage) {
      showCustomSnackbar(context, 'Beklenmeyen bir hata oluştu!', Icons.warning, Colors.red);
    }
  }

  void showCustomSnackbar(BuildContext context, String message, IconData icon, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Icon(icon), Expanded(child: Text(message))],
      ),
      backgroundColor: color,
      duration: Duration(seconds: 3),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ));
  }
}
