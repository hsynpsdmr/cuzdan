import 'package:cuzdan/ui/add/view/add_view.dart';
import 'package:cuzdan/ui/onboard/view/welcome_view.dart';

import 'package:flutter/material.dart';
import '../core/constant/enum/preferences_keys_enum.dart';
import '../core/init/memory/preferences_manager.dart';

Widget initiator() {
  int isFirstEntry = PreferencesManager.instance.getIntVal(PreferencesKeys.IS_FIRST_ENTRY);
  if (isFirstEntry == -1) {
    PreferencesManager.instance.setIntVal(PreferencesKeys.IS_FIRST_ENTRY, 0);
    return WelcomeView();
  } else {
    return AddView();
  }
}
