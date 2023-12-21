import 'dart:developer';

import 'package:admin_cashitout/Widgets/Components/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:admin_cashitout/View/CashItOut/Token/TokenByUsername/list_token_by_username.dart';

class UpdateParticularTokenPage extends StatefulWidget {
  final String id;

  const UpdateParticularTokenPage({Key key, this.id}) : super(key: key);

  @override
  _UpdateParticularTokenPageState createState() =>
      _UpdateParticularTokenPageState();
}

class _UpdateParticularTokenPageState extends State<UpdateParticularTokenPage> {
  final _particularTokenformKey = GlobalKey<FormState>();

  // Updaing Student
  CollectionReference particularToken = FirebaseFirestore.instance
      .collection('particularUser')
      .doc(ListTokenByUsernamePage.email)
      .collection(ListTokenByUsernamePage.email);

  Future<void> updateUser(id, status) {
    return particularToken
        .doc(id)
        .update({'status': status})
        .then((value) => log("User Updated"))
        .catchError((error) => log("Failed to update user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Status"),
        centerTitle: true,
        backgroundColor: MyTheme.darkBluishColor,
      ),
      body: Form(
          key: _particularTokenformKey,
          // Getting Specific Data by ID
          child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: FirebaseFirestore.instance
                .collection('particularUser')
                .doc(ListTokenByUsernamePage.email)
                .collection(ListTokenByUsernamePage.email)
                .doc(widget.id)
                .get(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                log('Something Went Wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data = snapshot.data.data();
              var status = data['status'];

              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        initialValue: status,
                        autofocus: false,
                        onChanged: (value) => status = value,
                        decoration: const InputDecoration(
                          labelText: 'Status',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Status';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, otherwise false.
                            if (_particularTokenformKey.currentState
                                .validate()) {
                              updateUser(widget.id, status);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey),
                          child: const Text(
                            'Reset',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
