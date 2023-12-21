import 'package:admin_cashitout/View/CashItOut/cash_it_out_homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Widgets/Components/themes.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Choose App",
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
                        builder: (context) => const CashItOutScreen()),
                  );
                },
                child: VxBox(
                        child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("CashItOut",
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
                onTap: () {},
                child: VxBox(
                        child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Collegemate",
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
