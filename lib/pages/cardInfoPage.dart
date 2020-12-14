import 'dart:convert';
import 'dart:math';

import 'package:crypto_exchange/components/card.dart';
import 'package:crypto_exchange/components/walletCard.dart';
import 'package:crypto_exchange/db/db.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CardInfoPage extends StatefulWidget {
  final String cardId;
  CardInfoPage({
    this.cardId,
  });
  @override
  _CardInfoPageState createState() => _CardInfoPageState();
}

class _CardInfoPageState extends State<CardInfoPage> {
  var associatedWallets;
  Future<double> getPrice(String symbol) async {
    return http
        .get('https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=$symbol',headers: {"X-CMC_PRO_API_KEY": "27d4aacb-1ad0-471e-888b-33ea0da458dd"})
        .then((response) => jsonDecode(response.body)).then((value) => value["data"][symbol]["quote"]["USD"]["price"]);
  }
  @override
  Widget build(BuildContext context) {
    print("CardInfo page");
    print(widget.cardId);
    getPrice("ETH").then((value) => print(value));
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: Column(
            children: [
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(height: 250, child: CreditCard())),
          Flexible(
                flex: 1, child: FutureBuilder<List<Wallet>>(
                future: context.watch<WalletDatabase>().wallets(widget.cardId),
                builder: (context, snapshot) {
                  if(snapshot.data != null && snapshot.data.isNotEmpty) {
                    var rng = new Random();
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final wallet = snapshot.data[index];

                          return FutureBuilder<double>(
                          future: getPrice(wallet.cryptocurrency),
                          builder: (context, snapshot) {
                            return WalletCard(
                              address: wallet.address,
                              balance: rng.nextDouble()*10000,
                              cryptocurrency: wallet.cryptocurrency,
                              rate: snapshot.data.toString());
                          });
                        }
                    );
                  } else {
                    return Text("You haven't got any associated wallets", style: TextStyle(color: Colors.white));
                  }
                }
              ))
    ])

        );
  }
}
