// ignore_for_file: file_names

import 'dart:developer';
import 'package:admin_cashitout/View/CashItOut/Token/TokenByUsername/updateParticularToken.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class ListTokenByUsernamePage extends StatefulWidget {
  static String email = '';
  const ListTokenByUsernamePage({Key key}) : super(key: key);

  @override
  State<ListTokenByUsernamePage> createState() =>
      _ListTokenByUsernamePageState();
}

class _ListTokenByUsernamePageState extends State<ListTokenByUsernamePage> {
  final Stream<QuerySnapshot> tokenStream = (FirebaseFirestore.instance
      .collection('particularUser')
      .doc(ListTokenByUsernamePage.email)
      .collection(ListTokenByUsernamePage.email)
      .orderBy('createdAt', descending: true)
      .snapshots());

  // For Deleting User
  CollectionReference token = FirebaseFirestore.instance
      .collection('particularUser')
      .doc(ListTokenByUsernamePage.email)
      .collection(ListTokenByUsernamePage.email);
  Future<void> deleteToken(id) {
    // print("User Deleted $id");
    return token
        .doc(id)
        .delete()
        .then((value) => log('User Deleted'))
        .catchError((error) => log('Failed to Delete user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: tokenStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print('Something went Wrong');
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storequerydocs = [];
          snapshot.data.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storequerydocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 0),
                      shrinkWrap: true,
                      itemCount: storequerydocs.length,
                      itemBuilder: (context, i) {
                        return VxBox(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Date : ${storequerydocs[i]['date'].toString()}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 0.05 * size.width,
                                          fontFamily: GoogleFonts.poppins()
                                              .fontFamily)),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text("Status Update",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 0.04 * size.width,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily)),
                                            content: Text(
                                                'Are you sure want to Update?',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 0.04 * size.width,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily)),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            UpdateParticularTokenPage(
                                                                id: storequerydocs[
                                                                    i]['id']),
                                                      ),
                                                    );
                                                  },
                                                  child: Text('Update',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              0.03 * size.width,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily)))
                                            ],
                                          ),
                                        );
                                      },
                                      icon: const Icon(Icons.edit))
                                ],
                              ),
                              Text(
                                  "Amount to Pay : Rs. ${storequerydocs[i]['token'].toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 0.04 * size.width,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily)),
                              Text(
                                  "Upi : ${storequerydocs[i]['upi'].toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 0.04 * size.width,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily)),
                              Text(
                                  "Time : ${storequerydocs[i]['time'].toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 0.04 * size.width,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily)),
                              Text(
                                  "Status : ${storequerydocs[i]['status'].toString()}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 0.04 * size.width,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily))
                            ],
                          ),
                        )).color(Colors.blueGrey).rounded.make().py16().px0();
                      })),
            ],
          );
        });
    //     ),
    //   ),
    // );
  }
}
