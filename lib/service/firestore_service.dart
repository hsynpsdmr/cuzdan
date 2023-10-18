import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuzdan/core/constant/db/collection_names.dart';
import '../models/onboard_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<OnboardModel>> getOnboardData() async {
    final CollectionReference _onboardRef = _firestore.collection(CollectionNames.ONBOARD);
    QuerySnapshot querySnapsot = await _onboardRef.get();
    List<DocumentSnapshot> list = querySnapsot.docs;
    List<OnboardModel> onboardModelList = [];
    for (var i = 0; i < list.length; i++) {
      DocumentSnapshot data = list[i];
      Map<String, dynamic> map = data.data() as Map<String, dynamic>;
      OnboardModel model = OnboardModel.fromJson(map);
      onboardModelList.add(model);
    }
    return onboardModelList;
  }
}
