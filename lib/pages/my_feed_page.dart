import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ng_demo_17/controllers/feed_controller.dart';
import '../views/feed_item_post.dart';

class MyFeedPage extends StatefulWidget {
  final PageController? pageController;

  const MyFeedPage({super.key, this.pageController});

  @override
  State<MyFeedPage> createState() => _MyFeedPageState();
}

class _MyFeedPageState extends State<MyFeedPage> {
  final feedController = Get.find<FeedController>();

  @override
  void initState() {
    super.initState();
    feedController.apiLoadFeeds();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(
      builder: (_){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              "Instagram",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Billabong', fontSize: 30),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  widget.pageController!.animateToPage(2,
                      duration: Duration(microseconds: 200), curve: Curves.easeIn);
                },
                icon: Icon(Icons.camera_alt),
                color: Color.fromRGBO(193, 53, 132, 1),
              ),
            ],
          ),
          body: Stack(
            children: [
              ListView.builder(
                itemCount: feedController.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(feedController.items[index], context, feedController);
                },
              ),
              feedController.isLoading
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