

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ng_demo_17/controllers/profile_controller.dart';

import '../model/post_model.dart';


  Widget  itemOfPost(BuildContext context, Post post, ProfileController profileController) {
  return GestureDetector(
      onLongPress: (){
        profileController.dialogRemovePost(context,post);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                width: double.infinity,
                imageUrl: post.img_post,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              post.caption,
              style: TextStyle(color: Colors.black87.withOpacity(0.7)),
              maxLines: 2,
            )
          ],
        ),
      )
  );
}