import 'package:crypto_exchange/pages/transactionPage.dart';
import 'package:crypto_exchange/theme/themeColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crypto_exchange/theme/themeStyles.dart';
import 'package:flutter/material.dart';

class WalletCard extends StatefulWidget {
  final String address;
  final double balance;
  final String pathToIcon;
  final String rate;
  WalletCard({
    this.address,
    this.balance,
    this.pathToIcon,
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
            height: 60.0,
            width: 350.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: null,
                            icon: SvgPicture.asset(widget.pathToIcon),
                          splashRadius: 7.0,
                        ),
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