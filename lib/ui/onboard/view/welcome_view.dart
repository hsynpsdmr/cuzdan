import '../../../core/base/state/base_state.dart';
import '../../../core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../core/init/theme/color_scheme_dark.dart';
import '../viewmodel/onboard_viewmodel.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends BaseState<WelcomeView> {
  var onboardViewModel = OnboardViewModel();
  @override
  void initState() {
    onboardViewModel.getOnboardData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton(),
      body: buildBody(),
    );
  }

  Column buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildAsset(),
        buildText(),
      ],
    );
  }

  Image buildAsset() {
    return Image.asset(
      'assets/icons/cuzdanicon.png',
      height: dynamicHeight(65),
    );
  }

  Text buildText() {
    return Text(
      'kolay cüzdan yönetimi',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, fontFamily: 'Gilroy'),
      textAlign: TextAlign.center,
    );
  }

  Container floatingButton() {
    return Container(
      margin: EdgeInsets.only(
        bottom: dynamicHeight(80),
        right: dynamicWidth(60),
      ),
      height: 60,
      decoration: BoxDecoration(
        color: ColorSchemeDark.instance!.blue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () => NavigationService.instance.navigateToPageClear(path: '/onboard'),
        icon: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}
