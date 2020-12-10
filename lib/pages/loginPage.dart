import 'package:crypto_exchange/store/actions.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crypto_exchange/pages/bankingPage.dart';
import 'package:crypto_exchange/animations/opacityAnimation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:crypto_exchange/store/reducers.dart';

class LoginPage extends StatelessWidget {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  // final onFormSubmit =(context) {
  //   StoreProvider.of<AppState>(context).dispatch(
  //       SetLoginData(emailFieldController.text, passwordFieldController.text));
  //   Navigator.push(context,
  //       PageTransition(type: PageTransitionType.fade, child: BankingPage()));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                OpacityAnimation(
                    1.2,
                    Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 30,
                ),
                OpacityAnimation(
                    1.6,
                    Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[300]))),
                              child: TextField(
                                controller: emailFieldController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    hintText: "Email"),
                              ),
                            ),
                            Container(
                              child: TextField(
                                controller: passwordFieldController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    hintText: "Password"),
                              ),
                            ),
                          ],
                        ))),
                SizedBox(
                  height: 30,
                ),
                OpacityAnimation(
                    2,
                    Center(
                        child: FlatButton(
                      onPressed: () {
                        StoreProvider.of<AppState>(context).dispatch(
                            SetLoginData(emailFieldController.text,
                                passwordFieldController.text));
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                child: BankingPage()));
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)),
                      color: Colors.indigo[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )))
              ],
            )));
  }
}
