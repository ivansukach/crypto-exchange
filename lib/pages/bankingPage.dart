import 'package:crypto_exchange/screens/homeScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class BankingPage extends StatefulWidget {
  @override
  _BankingPageState createState() => _BankingPageState();
}

class _BankingPageState extends State<BankingPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List <Widget> widgetOptions = <Widget>[
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
    void onTap(index){
      setState(() {
        selectedIndex = index;
      });
    }
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(3, 13, 27, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,//z-index
        onTap: onTap,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/home.svg', color: Colors.white),
              backgroundColor: Color.fromRGBO(3, 13, 27, 1),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/transactions.svg', color: Colors.white),
              backgroundColor: Color.fromRGBO(3, 13, 27, 1),
              label: "Transactions"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/settings.svg', color: Colors.white),
              backgroundColor: Color.fromRGBO(3, 13, 27, 1),
              label: "Settings"
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/account.svg', color: Colors.white),
              backgroundColor: Color.fromRGBO(3, 13, 27, 1),
              label: "Account"
          )
        ],
      ),
    );
  }
}