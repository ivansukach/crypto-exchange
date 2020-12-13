import 'dart:convert';

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
  @override
  Widget build(BuildContext context) {
    var moneroRate;
    var bitcoinRate;
    var ethereumRate;
    http
        .get('https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?slug=monero')
        .then((response) => jsonDecode(response.body)).then((value) => moneroRate = value["data"]["328"]["quote"]["USD"]["price"]);
    http
        .get('https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?slug=bitcoin')
        .then((response) => jsonDecode(response.body)).then((value) => bitcoinRate = value["data"]["1"]["quote"]["USD"]["price"]);

        // .then((response) => {wallets = response}).then((value)=>{print(wallets)});
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: Column(children: [
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(height: 250, child: CreditCard())),
          Padding(
              padding: EdgeInsets.only(top: 30),
              child: FutureBuilder<List<Wallet>>(
                future: context.watch<WalletDatabase>().wallets(widget.cardId),
                builder: (context, snapshot) {
                  // if(snapshot.connectionState != ConnectionState.done){
                  //   return Text("Loading wallets");
                  // }
                  // e
                  // return Text(snapshot.data);
                  if(snapshot.data != null) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final wallet = snapshot.data[index];

                          return WalletCard(
                              address: "address",
                              balance: 200.22,
                              pathToIcon: "assets/images/cryptocurrencies/bitcoin.svg",
                              rate: "303\$");
                        }
                    );
                  } else {
                    return Text("You haven't got any associated wallets", style: TextStyle(color: Colors.white));
                  }
                }
              )
              // Consumer<WalletDatabase>(
              //   builder: (context, database, child){
              //     // return database.wallets("1111").then((wallets)=> Text(wallets.length.toString(), style: TextStyle(color: Colors.white)));
              //     database.wallets("1111").then((wallets)=> associatedWallets = wallets);
              //     // return ListView.builder(
              //     //   itemCount: wallets.length,
              //     //   itemBuilder: (context, index){
              //     //     final wallet = wallets[index];
              //     //
              //     //     return WalletCard(
              //     //       address: "address",
              //     //       balance: 200.22,
              //     //       pathToIcon: "assets/images/cryptocurrencies/bitcoin.svg",
              //     //       rate: "303\$");
              //     //   }
              //     // );
              //     return Text("Example", style: TextStyle(color: Colors.white));
              //   },
              // )
              // ListView.builder(
              //   itemCount: wallets.length,
              //   itemBuilder: (context, index){
              //     final wallet = wallets[index];
              //
              //     return wallet;
              //   }
              // )
          ),

        ]));
  }
}
