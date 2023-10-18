import 'package:cuzdan/core/base/model/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'add_view_model.g.dart';

class AddViewModel = _AddViewModelBase with _$AddViewModel;

abstract class _AddViewModelBase with Store, BaseViewModel {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  TextEditingController? nameController;
  TextEditingController? priceController;
  TextEditingController? dateController;
  TextEditingController? ioController;
  TextEditingController? categoryController;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    dateController = TextEditingController();
    ioController = TextEditingController();
    categoryController = TextEditingController();
  }
}
