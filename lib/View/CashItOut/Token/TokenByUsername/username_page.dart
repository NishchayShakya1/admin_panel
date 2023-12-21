// ignore_for_file: deprecated_member_use
import 'package:admin_cashitout/View/CashItOut/Token/TokenByUsername/list_token_by_username.dart';
import 'package:admin_cashitout/View/CashItOut/Token/TokenByUsername/token_by_username_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../Widgets/Components/custom_button.dart';
import '../../../../Widgets/Components/custom_textfield.dart';
import '../../../../Widgets/Components/themes.dart';
// import 'package:intl/src/intl/date_format.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({Key key}) : super(key: key);

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final _gmailFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Token By Username",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: GoogleFonts.poppins().fontFamily)),
        backgroundColor: MyTheme.darkCreamColor,
        centerTitle: true,
      ),
      backgroundColor: MyTheme.darkBluishColor,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Form(
                key: _gmailFormKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: CustomTextField(
                      controller: emailController,
                      hintText: 'Email',
                      labelText: 'Email',
                      maxlines: 1,
                      icon: Icons.email_sharp,
                    ),
                  ),
                  HeightBox(size.height * 0.02),
                  CustomButton(
                      text: 'Submit',
                      onTap: () async {
                        if (_gmailFormKey.currentState.validate()) {
                          setState(() {
                            ListTokenByUsernamePage.email =
                                emailController.text;
                          });
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    FirebaseTokenByUsernameFuture()),
                          );
                        }
                        emailController.clear();
                      })
                ])),
          ],
        ),
      ),
    );
  }
}
