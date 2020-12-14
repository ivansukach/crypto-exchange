import 'package:crypto_exchange/theme/themeStyles.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatefulWidget {
  final String address;
  final double balance;
  final String cryptocurrency;
  final String rate;
  WalletCard({
    this.address,
    this.balance,
    this.cryptocurrency,
    this.rate,
  });
  @override
  _WalletCardState createState() => _WalletCardState();
}

class _WalletCardState extends State<WalletCard> {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
        child: Container(
            height: 70.0,
            width: 350.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/crypto/${widget.cryptocurrency}.png", height: 30.0),
                        SizedBox(width: 16.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.address,
                                style: ThemeStyles.otherDetailsPrimary),
                            Text(widget.balance.toString(),
                                style: ThemeStyles.otherDetailsSecondary),
                          ],
                        )
                      ],
                    ),
                    Text(widget.rate + " \$", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.5),
                  thickness: 0.5,
                  endIndent: 10.0,
                  indent: 10.0,
                )
              ],
            ),
          ),
        );

  }
}
