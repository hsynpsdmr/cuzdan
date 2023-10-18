// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardViewModel on _OnboardViewModelBase, Store {
  final _$onboardModelListAtom =
      Atom(name: '_OnboardViewModelBase.onboardModelList');

  @override
  List<OnboardModel>? get onboardModelList {
    _$onboardModelListAtom.reportRead();
    return super.onboardModelList;
  }

  @override
  set onboardModelList(List<OnboardModel>? value) {
    _$onboardModelListAtom.reportWrite(value, super.onboardModelList, () {
      super.onboardModelList = value;
    });
  }

  final _$currentPageAtom = Atom(name: '_OnboardViewModelBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$getOnboardDataAsyncAction =
      AsyncAction('_OnboardViewModelBase.getOnboardData');

  @override
  Future getOnboardData() {
    return _$getOnboardDataAsyncAction.run(() => super.getOnboardData());
  }

  final _$_OnboardViewModelBaseActionController =
      ActionController(name: '_OnboardViewModelBase');

  @override
  dynamic onPageChanged(int index) {
    final _$actionInfo = _$_OnboardViewModelBaseActionController.startAction(
        name: '_OnboardViewModelBase.onPageChanged');
    try {
      return super.onPageChanged(index);
    } finally {
      _$_OnboardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onboardModelList: ${onboardModelList},
currentPage: ${currentPage}
    ''';
  }
}
