
 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/member_model.dart';
import '../model/post_model.dart';
import '../pages/signin_page.dart';
import '../services/auth_service.dart';
import '../services/db_service.dart';
import '../services/file_service.dart';
import '../services/utils_service.dart';

class ProfileController extends GetxController{
  bool isLoading = false;
  int axisCount = 2;
  List<Post> items = [];
  File? _image;
  String fullname = "", email = "", img_url = "";
  int count_posts = 0, count_followers = 0, count_following = 0;
  final ImagePicker _picker = ImagePicker();

  axisCountt(){
    axisCount = 1;
    update();

  }

  imgFromGallery() async {
    XFile? image =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    print(image!.path.toString());

      _image = File(image.path);
      update();
    apiChangePhoto();
  }

  imgFromCamera() async {
    XFile? image =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    print(image!.path.toString());

      _image = File(image.path);
      update();
    apiChangePhoto();
  }

  apiChangePhoto() {
    if (_image == null) return;

      isLoading = true;
      update();

    FileService.uploadUserImage(_image!).then((downloadUrl) => {
      _apiUpdateMember(downloadUrl),
    });
  }

  _apiUpdateMember(String downloadUrl) async {
    Member member = await DBService.loadMember();
    member.img_url = downloadUrl;
    await DBService.updateMember(member);
    apiLoadMember();
  }

  showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Pick Photo'),
                    onTap: () {
                      imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Take Photo'),
                  onTap: () {
                    imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  dialogRemovePost(BuildContext context,Post post) async {
    var result = await Utils.dialogCommon(context, "Instagram", "Do you want to detele this post?", false);

    if (result) {

        isLoading = true;
        update();
      DBService.removePost(post).then((value) => {
        apiLoadPost(),
      });
    }
  }

  dialogLogout(BuildContext context) async{
    var result = await Utils.dialogCommon(context, "Instagram", "Do you want to logout?", false);
    if(result){
      update();
        isLoading = true;

      signOutUser(context);
    }
  }

  signOutUser(BuildContext context){
    AuthService.signOutUser(context);
    // Navigator.pushReplacementNamed(context, SignInPage.id);
    Get.offNamed(SignInPage.id);
  }

  void apiLoadMember(){

      isLoading = true;
      update();
    DBService.loadMember().then((value) => {
      _showMemberInfo(value),
    });
  }

  void _showMemberInfo(Member member){

      isLoading = false;
      fullname = member.fullname;
      email = member.email;
      img_url = member.img_url;
      count_following = member.following_count;
      count_followers = member.followers_count;
      update();
  }

  apiLoadPost(){
    DBService.loadPosts().then((value) => {
      resLoadPosts(value),
    });
  }

  resLoadPosts(List<Post> posts){

      isLoading = false;
      items = posts;
      count_posts  = posts.length;
      update();
  }
}
