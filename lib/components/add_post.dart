import 'package:android_app/components/round_button.dart';
import 'package:android_app/services/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final fireStore = FirebaseFirestore.instance.collection("posts");

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");


  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  

  void addPost() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await fireStore.add({
        "title": titleController.text.toString(),
        "description": descriptionController.text.toString(),
        "userId": auth.currentUser?.uid.toString(),
        "time": DateTime.now().toString()
      }).then((value) {
        setState(() {
          isLoading = false;
          titleController.text = "";
          descriptionController.text = "";
        });
        Utils().toastMessage("Posted");
      }).onError((error, stackTrace) {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: titleController,
                      decoration: InputDecoration(hintText: "Title"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintText: "Start writing your post here"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Description';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 50,
            ),
            RoundButton(
                isLoading: isLoading,
                title: "Post",
                onTap: () {
                  addPost();
                }),
          ],
        ),
      ),
    );
  }
}
