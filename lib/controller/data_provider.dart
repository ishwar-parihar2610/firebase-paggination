import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/post_model.dart';

class DataProvider extends ChangeNotifier {
  List<Post> postList = [];


  setDataInList(Map<String,dynamic> json){

    postList.add(Post.fromJson(json));
     // notifyListeners();
  }

  Future getDataList() async {
    postList=[];
    QuerySnapshot temp =
        await FirebaseFirestore.instance.collection('post').get();
    List<QueryDocumentSnapshot> dataList = temp.docs;
    for (var item in dataList) {
      Map<String, dynamic> mapData = item.data() as Map<String, dynamic>;
      postList.add(Post.fromJson(mapData));
    }
    print("get data list ${postList.length}");

  }
}
