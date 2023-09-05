import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/post_detail_Screen.dart';

import 'apiController.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  PostController postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx with flutter"),
      ),


      body: Obx(() {
        if (postController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                 TextField(
                  onChanged: (val){


                    setState(() {
                      postController.fetchnewPost(val);

                    });

                  },
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Colors.greenAccent), //<-- SEE HERE
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: postController.postList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: ()=> Get.to(() => const PostDetailScreen()),
                        child: Card(
                          child: ListTile(
                            leading: Text("${postController.postList[index].id}"),
                            title:
                            Text("${postController.postList[index].title}"),
                            subtitle:
                            Text("${postController.postList[index].body}"),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          );
        }
      }),
    );
  }
}
