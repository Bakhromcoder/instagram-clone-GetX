import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ng_demo_17/controllers/search_page_controller.dart';
import '../views/search_item.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({super.key});

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {

  final  controller =  Get.find<SearchPageController>();

  @override
  void initState() {
    super.initState();
    controller.apiSearchMember("");
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
      builder: (_){
        return GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text(
                  "Search",
                  style: TextStyle(
                      color: Colors.black, fontFamily: "Billabong", fontSize: 25),
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        //#search member
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.only(left: 10, right: 10),
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(7)),
                          child: TextField(
                            style: const TextStyle(color: Colors.black87),
                            controller: controller.searchController,
                            decoration: const InputDecoration(
                                hintText: "Search",
                                border: InputBorder.none,
                                hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                )),
                          ),
                        ),

                        //#member list
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.items.length,
                            itemBuilder: (ctx, index) {
                              return itemOfMember(controller.items[index], controller);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }


}