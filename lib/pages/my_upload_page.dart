import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ng_demo_17/controllers/upload_controller.dart';



class MyUploadPage extends StatefulWidget {
  final PageController? pageController;

  const MyUploadPage({super.key, this.pageController});

  @override
  State<MyUploadPage> createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {

  final uploadcontroller = Get.find<UploadController>();




  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadController>(
      builder: (_){
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Upload",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    uploadcontroller.uploadNewPost(widget.pageController!);

                  },
                  icon: const Icon(
                    Icons.drive_folder_upload,
                    color: Color.fromRGBO(193, 53, 132, 1),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            uploadcontroller.showPicker(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery
                                .of(context)
                                .size
                                .width,
                            color: Colors.grey.withOpacity(0.4),
                            child: uploadcontroller.image == null
                                ? const Center(
                              child: Icon(
                                Icons.add_a_photo,
                                size: 50,
                                color: Colors.grey,
                              ),
                            )
                                : Stack(
                              children: [
                                Image.file(
                                  uploadcontroller.image!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: double.infinity,
                                  color: Colors.black12,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            uploadcontroller.image = null;
                                          });
                                        },
                                        icon: const Icon(Icons.highlight_remove),
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                          child: TextField(
                            controller: uploadcontroller.captionController,
                            style: const TextStyle(color: Colors.black),
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: const InputDecoration(
                                hintText: "Caption",
                                hintStyle:
                                TextStyle(fontSize: 17, color: Colors.black38)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                uploadcontroller.isLoading
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : const SizedBox.shrink(),
              ],
            ));
      },
    );
  }
}