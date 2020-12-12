import 'package:crypto_exchange/components/transactionCard.dart';
import 'package:crypto_exchange/theme/themeStyles.dart';
import 'package:flutter/material.dart';

class RecentTransactions extends StatefulWidget {
  @override
  _RecentTransactionsState createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              top: 30.0,
              right: 15.0,
              bottom: 15.0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions', style: ThemeStyles.primaryTitle),
                Text('See All', style: ThemeStyles.minorTitle),
              ],
            ),
          ),
          Flexible(
            flex: 1,//flex-factor
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                TransactionCard(
                  color: Colors.black,
                  letter: 'S',
                  title: 'Salary',
                  subTitle: 'Effective-Soft',
                  price: '+ 500 \$',
                  preview: true,
                ),
                TransactionCard(
                  color: Color(0xfffe695d),
                  letter: 'R',
                  title: 'Rent',
                  subTitle: 'Apartment rent',
                  price: '- 250 \$',
                  preview: true,
                ),
                TransactionCard(
                  color: Color(0xff103289),
                  letter: 'F',
                  title: 'Food',
                  subTitle: 'Food market',
                  price: '- 59,99 \$',
                  preview: true,
                ),
                TransactionCard(
                  color: Colors.greenAccent,
                  letter: 'B',
                  title: 'Booking.com',
                  subTitle: 'Rent apartments at booking.com',
                  price: '- 41 \$',
                  preview: true,
                ),
                TransactionCard(
                  color: Colors.amberAccent,
                  letter: 'A',
                  title: 'Air-bnb.com',
                  subTitle: 'Airline tickets',
                  price: '- 100,26 \$',
                  preview: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
