import 'package:cuzdan/core/base/state/base_state.dart';
import 'package:cuzdan/core/base/view/base_view.dart';
import 'package:cuzdan/core/constant/enum/authentication_enum.dart';
import 'package:cuzdan/core/constant/navigation/navigation_constants.dart';
import 'package:cuzdan/core/init/navigation/navigation_service.dart';
import 'package:cuzdan/core/init/theme/color_scheme_dark.dart';
import 'package:cuzdan/ui/login/viewmodel/login_view_model.dart';
import 'package:cuzdan/ui/onboard/widgets/custom_outline_button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  final Authentication authentication;
  const LoginView({Key? key, required this.authentication}) : super(key: key);

  @override
  BaseState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  OutlineInputBorder border = OutlineInputBorder(borderSide: BorderSide(color: ColorSchemeDark.instance!.blue, width: 1.0), borderRadius: BorderRadius.circular(20.0));
  TextStyle style = TextStyle(fontSize: 16, color: ColorSchemeDark.instance!.grey, fontWeight: FontWeight.w400, fontFamily: 'Gilroy');
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => Scaffold(
        key: value.scaffoldState,
        backgroundColor: Color(0xff111016),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //buildBackButton(value),
              buildTextHeader(),
              buildTextDetail(),
              buildTextFormFieldEmail(value),
              buildTextFormFieldPassword(value),
              buildTextForgetPassword(),
              buildElevatedButtonLogin(value),
              buildTextAccount()
              //buildText(),
              //buildElevatedButtonLoginWithGoogle(value),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBackButton(LoginViewModel viewModel) => IconButton(onPressed: () => viewModel.goBack(), icon: Icon(Icons.arrow_back));

  Widget buildTextHeader() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(32), top: dynamicHeight(124)),
          width: dynamicWidth(62),
          height: dynamicHeight(62),
          decoration: BoxDecoration(
            color: ColorSchemeDark.instance!.blue,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(61), top: dynamicHeight(128)),
          child: Text(
            widget.authentication == Authentication.LOGIN ? 'giriş yap' : 'kayıt ol',
            style: TextStyle(fontSize: 44, fontWeight: FontWeight.w400, fontFamily: 'Gilroy'),
          ),
        ),
      ],
    );
  }

  Widget buildTextDetail() {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(36), top: dynamicHeight(29)),
      child: Text(
        'Lorem ipsum dolor sit amet, consec adipiscing elit.',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, fontFamily: 'Gilroy'),
      ),
    );
  }

  Widget buildTextFormFieldEmail(LoginViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(50)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        style: style,
        controller: viewModel.emailController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          enabledBorder: border,
          focusedBorder: border,
          filled: true,
          fillColor: Color.fromRGBO(196, 196, 196, 0.1),
          hintText: "Email",
          hintStyle: style,
        ),
      ),
    );
  }

  Widget buildTextFormFieldPassword(LoginViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(20)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        obscureText: viewModel.passwordVisible,
        style: style,
        controller: viewModel.passwordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          suffixIcon: IconButton(
              icon: Icon(
                viewModel.passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                viewModel.isLockStateChange();
              }),
          enabledBorder: border,
          focusedBorder: border,
          filled: true,
          fillColor: Color.fromRGBO(196, 196, 196, 0.1),
          hintText: "Password",
          hintStyle: style,
        ),
      ),
    );
  }

  Widget buildTextForgetPassword() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: dynamicWidth(30), top: dynamicHeight(20)),
      child: InkWell(
        onTap: () => {
          //TODO şifremi unuttum
        },
        child: Text(
          widget.authentication == Authentication.LOGIN ? 'şifremi unuttum' : '',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, fontFamily: 'Gilroy'),
        ),
      ),
    );
  }

  Widget buildElevatedButtonLogin(LoginViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(235), top: dynamicHeight(20)),
      width: dynamicWidth(125),
      height: dynamicHeight(45),
      child: CustomOutlineButton(
        buttonColor: ColorSchemeDark.instance!.blue,
        title: widget.authentication == Authentication.LOGIN ? 'giriş yap' : 'kayıt ol',
        onPressed: widget.authentication == Authentication.LOGIN ? viewModel.loginWithEmailAndPassword : viewModel.createUserWithEmailAndPassword,
      ),
    );
  }

  Widget buildTextAccount() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: dynamicHeight(150)),
      child: InkWell(
        onTap: () =>
          NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW, object: {'authentication': widget.authentication == Authentication.LOGIN ? Authentication.REGISTER : Authentication.LOGIN})
        ,
        child: Text(
          widget.authentication == Authentication.LOGIN ? 'Hesabın Yok Mu? Kayıt Ol' : 'Hesabın Var Mı? Giriş Yap',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Gilroy'),
        ),
      ),
    );
  }

  Widget buildText() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: dynamicHeight(60)),
      child: Text(
        'ya da',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget buildElevatedButtonLoginWithGoogle(LoginViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(30)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
            width: 1.0,
            color: Color(0xff2B44FF),
          )),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(43, 68, 255, 0.2),
          ),
          alignment: Alignment.centerLeft,
        ),
        icon: Image.asset(
          'assets/icons/googleicon.png',
          width: dynamicWidth(24),
          height: dynamicHeight(24),
        ),
        label: Text(
          'Google ile ' + (widget.authentication == Authentication.LOGIN ? 'giriş yap' : 'kayıt ol'),
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        onPressed: () {
          viewModel.signInWithGoogle();
        },
      ),
    );
  }
}
