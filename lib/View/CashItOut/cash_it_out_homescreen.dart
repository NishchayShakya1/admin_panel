import 'package:admin_cashitout/View/CashItOut/Query/QueryByUsername/email_page.dart';
import 'package:admin_cashitout/View/CashItOut/Token/TokenByUsername/username_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Widgets/Components/themes.dart';
import 'Query/All_Query/query_page.dart';
import 'Token/All_Token/all_token_page.dart';



class CashItOutScreen extends StatelessWidget {
  const CashItOutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Cash It Out",
              style: TextStyle(
                  color: MyTheme.lightBluishColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: GoogleFonts.poppins().fontFamily)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirebaseQueryFuture()),
                  );
                },
                child: VxBox(
                        child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Queries",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 0.08 * size.width,
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                  ),
                ))
                    .color(MyTheme.darkBluishColor)
                    .roundedLg
                    .square(150)
                    .make()
                    .py2()
                    .px0(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirebaseAllTokenFuture()),
                  );
                },
                child: VxBox(
                        child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("All Tokens",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 0.08 * size.width,
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                  ),
                ))
                    .color(MyTheme.darkBluishColor)
                    .roundedLg
                    .square(150)
                    .make()
                    .py2()
                    .px0(),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UsernamePage()),
                  );
                },
                child: VxBox(
                        child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Tokens By Username",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 0.08 * size.width,
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                  ),
                ))
                    .color(MyTheme.darkBluishColor)
                    .roundedLg
                    .square(150)
                    .make()
                    .py2()
                    .px0(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmailPage()),
                  );
                },
                child: VxBox(
                        child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Queries By Username",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 0.08 * size.width,
                            fontFamily: GoogleFonts.poppins().fontFamily)),
                  ),
                ))
                    .color(MyTheme.darkBluishColor)
                    .roundedLg
                    .square(150)
                    .make()
                    .py2()
                    .px0(),
              ),
            ),
          ],
        ));
  }
}