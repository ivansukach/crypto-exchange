import 'package:crypto_exchange/components/divider.dart';
import 'package:crypto_exchange/components/transactionCard.dart';
import 'package:crypto_exchange/theme/themeStyles.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  final String title;
  final String subTitle;
  final String price;
  final String letter;
  final Color color;
  TransactionPage({
    this.color,
    this.letter,
    this.price,
    this.subTitle,
    this.title,
  });
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    print("Transaction page");
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(3, 13, 27, 1),
        centerTitle: true,
        title: Text('Transaction info', style: TextStyle(color: Colors.white)),
        elevation: 0.0,
      ),
      body: Container(
        child: Stack(
          children: [
            ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  TransactionCard(
                    color: widget.color,
                    letter: widget.letter,
                    title: widget.title,
                    subTitle: widget.subTitle,
                    price: widget.price,
                    preview: false
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
                    child: Text('Details', style: ThemeStyles.primaryTitle)
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('BIC', style: ThemeStyles.otherDetailsSecondary),
                        SizedBox(height: 5.0),
                        Text('DUISDE33XX',
                            style: ThemeStyles.otherDetailsPrimary),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Posting Key',
                            style: ThemeStyles.otherDetailsSecondary),
                        SizedBox(height: 5.0),
                        Text('153', style: ThemeStyles.otherDetailsPrimary),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Posting Text',
                            style: ThemeStyles.otherDetailsSecondary),
                        SizedBox(height: 5.0),
                        Text('Landing Page',
                            style: ThemeStyles.otherDetailsPrimary),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Purpose Code',
                            style: ThemeStyles.otherDetailsSecondary),
                        SizedBox(height: 5.0),
                        Text('OLOA', style: ThemeStyles.otherDetailsPrimary),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SEPA Reference',
                            style: ThemeStyles.otherDetailsSecondary),
                        SizedBox(height: 5.0),
                        Text('DE56 3902 0000 1203 2339 39',
                            style: ThemeStyles.otherDetailsPrimary),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SEPA Reference',
                            style: ThemeStyles.otherDetailsSecondary),
                        SizedBox(height: 5.0),
                        Text('DE56 3902 0000 1203 2339 39',
                            style: ThemeStyles.otherDetailsPrimary),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
                    child: FlatButton(
                      height: 120,
                      onPressed: (){},
                      color: Color.fromRGBO(3, 13, 33, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 25.0),
                          Text("Create transaction", style: TextStyle(color: Colors.white, fontSize: 25.0))
                        ],
                      )
                    )
                  )

                ]

            )
          ],
        )
      )
    );
  }
}
