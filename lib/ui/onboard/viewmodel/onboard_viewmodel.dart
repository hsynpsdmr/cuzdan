import 'package:mobx/mobx.dart';

import '../../../models/onboard_model.dart';
import '../../../service/firestore_service.dart';
part 'onboard_viewmodel.g.dart';

class OnboardViewModel = _OnboardViewModelBase with _$OnboardViewModel;

abstract class _OnboardViewModelBase with Store {
  @observable
  List<OnboardModel>? onboardModelList;
  @observable
  int currentPage = 0;

  @action
  getOnboardData() async {
    FirestoreService _service = FirestoreService();
    onboardModelList = await _service.getOnboardData();
  }

  @action
  onPageChanged(int index) => currentPage = index;
}
