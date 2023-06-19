import 'package:android_app/components/add_post.dart';
import 'package:android_app/components/custom_card.dart';
import 'package:android_app/components/login_screen.dart';
import 'package:android_app/services/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String getAuthor(DocumentReference docRef)  {
    String data = "";
    docRef.get().then((DocumentSnapshot doc) {
      final data1 = doc.data() as Map<dynamic, dynamic>;
      data = data1['userName'];
      return data;
    });
    return "Author";
  }

  final fireStoreRef =
      FirebaseFirestore.instance.collection("posts").snapshots();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              icon: Icon(Icons.logout_outlined)),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: 10,
        ),
        StreamBuilder<QuerySnapshot>(
            stream: fireStoreRef,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text("Error");
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final docRef = FirebaseFirestore.instance
                          .collection('users')
                          .doc(snapshot.data?.docs[index]['userId'].toString());

                      return CustomCard(
                          description: snapshot.data?.docs[index]
                              ['description'],
                          title: snapshot.data?.docs[index]['title'],
                          date: snapshot.data?.docs[index]['time'],
                          author: getAuthor(docRef));
                    }),
              );
            }),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
