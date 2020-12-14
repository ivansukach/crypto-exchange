import 'package:crypto_exchange/store/actions.dart';
import 'package:flutter/material.dart';
import 'package:crypto_exchange/pages/bankingPage.dart';
import 'package:crypto_exchange/animations/opacityAnimation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:crypto_exchange/store/reducers.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatelessWidget {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // final onFormSubmit =(context) {
  //   StoreProvider.of<AppState>(context).dispatch(
  //       SetLoginData(emailFieldController.text, passwordFieldController.text));
  //   Navigator.push(context,
  //       PageTransition(type: PageTransitionType.fade, child: BankingPage()));
  // }

  @override
  Widget build(BuildContext context) {
    print("Login page");
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
                            fontWeight: FontWeight.bold
                        )
                    )
                ),
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
                        child: Form(
                            key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[300]))),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailFieldController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value){
                                  if(!isEmail(value)) return "Please, enter valid email";
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    hintText: "Email"),
                              ),
                            ),
                            Container(
                              child: TextFormField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                controller: passwordFieldController,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value){
                                  if(!isAlphanumeric(value)) return "Please, use only alphanumeric symbols";
                                  if(!isLength(value, 6, 25)) return "Please, enter from 6 to 25 symbols";
                                  return null;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    hintText: "Password"),
                              ),
                            ),
                          ],
                        )))),
                SizedBox(
                  height: 30,
                ),
                OpacityAnimation(
                    2,
                    Center(
                        child: FlatButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          print("LOGGED IN");
                          StoreProvider.of<AppState>(context).dispatch(
                              SetLoginData(emailFieldController.text,
                                  passwordFieldController.text));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) => BankingPage()));
                        }
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.white)),
                      color: Color.fromRGBO(3, 18, 36, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )))
              ],
            )));
  }
}
