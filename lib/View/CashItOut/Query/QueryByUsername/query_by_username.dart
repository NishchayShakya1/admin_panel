import 'package:admin_cashitout/View/CashItOut/Query/QueryByUsername/list_query_by_username.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../Widgets/Components/themes.dart';



class FirebaseQueryByUsernameFuture extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
 
  FirebaseQueryByUsernameFuture({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          if (kDebugMode) {
            print("Something went Wrong");
          }
          Toast.show("No Internet");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Particular Queries",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: GoogleFonts.poppins().fontFamily)),
              centerTitle: true,
              backgroundColor: MyTheme.darkCreamColor,
              elevation: 0.0,
            ),
            backgroundColor: MyTheme.darkCreamColor,
            body: SafeArea(
                child:
                    Container(padding: Vx.m12, child:  const ListQueryByUsernamePage())),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
