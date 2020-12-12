import 'package:crypto_exchange/pages/associateCardPage.dart';
import 'package:crypto_exchange/theme/themeColors.dart';
import 'package:crypto_exchange/theme/themeStyles.dart';
import 'package:flutter/material.dart';

import 'card.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List cardList = [
    CreditCard(),
    CreditCard(),
    CreditCard()
  ];
  List<String> _cardNumbers = ["5354 1234 2567 9843", "4583 1256 2941 3293", "9023 4214 3921 2394"];
  int _currentCard = 0;

  final PageController _pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentCard = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your cards', style: ThemeStyles.primaryTitle),
                FlatButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                          MaterialPageRoute(
                              builder: (context) => AssociateCardPage(
                                  cardId: _cardNumbers[_currentCard],
                              )
                          )
                      );
                      },
                    color: Color.fromRGBO(3, 11, 27, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.link, color: Colors.white, size: 20.0),
                        SizedBox(width: 6.0),
                        Text("Associate", style: TextStyle(color: Colors.white, fontSize: 17.0))
                      ],
                    )
                )
              ],
            ),
          ),
          Container(
            height: 250,
            child: PageView.builder(//MAGIC TOOL)))))
              itemCount: cardList.length,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) => CreditCard(),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < cardList.length; i++)
                  if (_currentCard == i)
                    DotIndicator(true)
                  else
                    DotIndicator(false)
              ],
            ),
          )
        ],
      ),
    );
  }
}


//dots under credit cards
class DotIndicator extends StatefulWidget {
  final bool isActive;
  DotIndicator(this.isActive);
  @override
  _DotIndicatorState createState() => _DotIndicatorState();
}

class _DotIndicatorState extends State<DotIndicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: widget.isActive ? Colors.white : Colors.blueGrey,
        ),
      ),
    );
  }
}