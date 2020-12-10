import 'package:crypto_exchange/animations/opacityAnimation.dart';
import 'package:crypto_exchange/pages/loginPage.dart';
import 'package:crypto_exchange/store/reducers.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  final _initialState = AppState(email: '', password: '');
  final Store<AppState> _store =
      Store<AppState>(mainReducer, initialState: _initialState);
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
          store:
              _store))); //A convenience widget that wraps a number of widgets
  // that are commonly required for material design applications.
}

class HomePage extends StatefulWidget {
  final Store<AppState> store;

  HomePage({this.store});

  // This widget is the root of your application.
  @override
  _HomePageState createState() => _HomePageState(store: store);
}

class _HomePageState extends State<HomePage> {
  final Store<AppState> store;

  _HomePageState({this.store});

  double buttonWidth = 80.0;

  @override
  Widget build(BuildContext context) {
    //size of the current media (e.g., the window containing your app)
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return StoreProvider<AppState>(
        store: store,
        child: Scaffold(
          //Implements the basic material design visual layout structure.
          backgroundColor: Color.fromRGBO(3, 9, 23, 1),
          body: Plasma(
              particles: 8,
              foregroundColor: Color(0x9b171b1e),
              backgroundColor: Color(0xcb1d2b41),
              size: 1.00,
              speed: 6.00,
              offset: 0.00,
              blendMode: BlendMode.difference,
              //The Color Dodge blend mode divides the bottom layer by the inverted top layer.
              child: Container(
                  //A widget that positions its children relative to the edges of its box.
                  child: Stack(
                //when you pass the <Widget>[] you tell to compiler the input list
                // type is Widget and all list child must be Widget not anything else
                children: <Widget>[
                  Positioned(
                      top: -height / 10,
                      left: 0,
                      child: OpacityAnimation(
                          1.0,
                          Container(
                            width: width,
                            height: height / 2,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/shapeOfBackground.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))),
                  Positioned(
                      top: -height / 5,
                      left: 0,
                      child: OpacityAnimation(
                          1.3,
                          Container(
                            width: width,
                            height: height / 2,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/shapeOfBackground.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          OpacityAnimation(
                              1.5,
                              Text("Welcome",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40))),
                          Padding(
                            padding: EdgeInsets.only(bottom: height / 3),
                          ),
                          Center(
                              child: ConfirmationSlider(
                                  // width: 250,
                                  // height: 80,
                                  backgroundColor: Colors.indigo[200],
                                  foregroundColor: Colors.indigo[700],
                                  //   icon: Icons.arrow_forward,
                                  text: "swipe to start",
                                  onConfirmation: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: LoginPage()));
                                  })
                              //   child: AnimatedContainer(
                              //         width: buttonWidth,
                              //         height: 80,
                              //         duration: Duration(milliseconds: 500),
                              //         curve: Curves.easeIn,
                              //         padding: EdgeInsets.all(10),
                              //         decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(40),
                              //             color: Colors.blue.withOpacity(.4)
                              //         ),
                              //     child: InkWell(
                              //         onTap: () { setState((){
                              //           buttonWidth = 400.0;
                              //         });
                              //         },
                              //         child: Container(
                              //           // width: 10,
                              //           // height: 10,
                              //             decoration: BoxDecoration(
                              //                 shape: BoxShape.circle,
                              //                 color: Colors.blue
                              //             ),
                              //             child: Icon(Icons.arrow_forward, color: Colors.white)
                              //         )
                              //     ),
                              // )
                              )
                        ],
                      )),
                ],
              ))),
        ));
  }
}
