

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ng_demo_17/controllers/likes_controller.dart';
import '../views/likes_item.dart';

class MyLikesPage extends StatefulWidget {
  const MyLikesPage({Key? key}) : super(key: key);

  @override
  State<MyLikesPage> createState() => _MyLikesPageState();
}

class _MyLikesPageState extends State<MyLikesPage> {

  final likescontroller = Get.find<LikesController>();

  @override
  void initState() {
    super.initState();
    likescontroller.apiLoadLikes();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LikesController>(
      builder: (_){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Likes",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Billabong', fontSize: 30),
            ),
          ),
          body: Stack(
            children: [
              ListView.builder(
                itemCount: likescontroller.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(likescontroller.items[index], likescontroller, context);
                },
              ),
              likescontroller.isLoading
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }


}