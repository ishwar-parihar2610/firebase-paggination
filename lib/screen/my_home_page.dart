import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/controller/data_provider.dart';
import 'package:wallpaper_app/model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DataProvider dataProvider;
  late NumberPaginatorController controller;
  late PageController pageController;
  int endIndex=0;
  @override
  void initState() {
    dataProvider = Provider.of(context, listen: false);
    controller = NumberPaginatorController();
    pageController = PageController(initialPage: 0, keepPage: true);


    // dataProvider.getDataList();
    //  uploadRandom();
    super.initState();
  }



  void uploadRandom() async {
    final collectionReference = FirebaseFirestore.instance
        .collection("post")
        .withConverter<Post>(
            fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
            toFirestore: (post, _) => post.toJson());

    final number = List.generate(90, (index) => index + 1);
    for (var num in number) {
      final post = Post(
          createdAt: DateTime.now().toString(),
          imgUrl: 'https://source.unsplash.com/random?=sig=$num',
          likes: Random().nextInt(1000),
          title: 'Random title $num');

      collectionReference.add(post);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff1e787d)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: SizedBox()),
                      Expanded(child: tableHaders("Sr")),
                      Expanded(child: tableHaders("Image")),
                      Expanded(child: tableHaders("Title")),
                      Expanded(child: tableHaders("Total Likes")),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                )),
            Expanded(
                flex: 9,
                child: Consumer<DataProvider>(builder: (context, value, data) {
                  return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: PaginateFirestore(
                        itemsPerPage: 5,

                        pageController: pageController,

                        padding: EdgeInsets.zero,
                        onPageChanged: (val) {
                          print("current page changes $val");
                        },
                        options: GetOptions(source: Source.serverAndCache),
                        initialLoader: CircularProgressIndicator(),
                        itemBuilder: (context, snapshot, index) {
                          value.setDataInList(
                              snapshot[index].data() as Map<String, dynamic>);

                          Post post = value.postList[index];

                          return customTable(post, index);
                        },
                        query: FirebaseFirestore.instance
                            .collection("post")
                            .orderBy("title"),
                        itemBuilderType: PaginateBuilderType.listView,
                        isLive: true,
                      )

                      // ListView.builder(
                      //     itemCount: value.postList.length,
                      //     itemBuilder: (child, index) {
                      //       Post post = value.postList[index];
                      //       return customTable(post, index);
                      //    }),
                      );
                })),



            // Consumer<DataProvider>(builder: (context, value, child) {
            //   return NumberPaginator(
            //     controller: controller,
            //     numberPages: value.postList.length ~/ 10,
            //     initialPage: 1,
            //     onPageChange: (val) {},
            //   );
            // })
          ]),
        ),
      ),
    );
  }

  Widget tableHaders(String text) {
    return Text(
      "$text",
      style: TextStyle(fontSize: 15, color: Colors.white),
    );
  }

  Widget customTable(Post post, int sr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: SizedBox()),
        Expanded(
            child: Text(
          "${sr + 1}",
          style: TextStyle(fontSize: 15, color: Colors.black),
        )),
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              post.imgUrl ?? "",
              height: 50,
              width: 50,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "${post.title}",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            )),
        Expanded(
            child: Text(
          "${post.likes}",
          style: TextStyle(fontSize: 15, color: Colors.black),
        )),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}
