import 'package:crypto_exchange/components/cardList.dart';
import 'package:crypto_exchange/components/customAppBar.dart';
import 'package:crypto_exchange/components/recentTransactions.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("Home screen");
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            CustomAppBar(),
            CardList(),
            RecentTransactions()
          ],

        )
      )
    );
  }
}
