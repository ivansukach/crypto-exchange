import 'package:crypto_exchange/pages/transactionPage.dart';
import 'package:crypto_exchange/theme/themeColors.dart';
import 'package:page_transition/page_transition.dart';
import 'package:crypto_exchange/theme/themeStyles.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String letter;
  final Color color;
  final bool preview;
  TransactionCard({
    this.color,
    this.letter,
    this.price,
    this.subTitle,
    this.title,
    this.preview
  });
  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.preview) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionPage(
                        title: widget.title,
                        subTitle: widget.subTitle,
                        price: widget.price,
                        letter: widget.letter,
                        color: widget.color
                    ))
            );
          },
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
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              widget.letter,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,
                                style: ThemeStyles.otherDetailsPrimary),
                            Text(widget.subTitle,
                                style: ThemeStyles.otherDetailsSecondary),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.price, style: TextStyle(color: Colors.red)),
                        SizedBox(width: 4.0),
                        Icon(Icons.keyboard_arrow_right, color: Colors.white),
                      ],
                    )
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
        ),
      );
    }else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
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
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              widget.letter,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,
                                style: ThemeStyles.otherDetailsPrimary),
                            Text(widget.subTitle,
                                style: ThemeStyles.otherDetailsSecondary),
                          ],
                        )
                      ],
                    ),
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
}
