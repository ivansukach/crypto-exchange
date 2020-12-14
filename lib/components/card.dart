import 'package:crypto_exchange/pages/cardInfoPage.dart';
import 'package:crypto_exchange/theme/themeStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreditCard extends StatefulWidget {
  final String cardId;

  CreditCard({
    this.cardId,
  });
  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  bool visible;
  void loadValue(){
    SharedPreferences.getInstance().then((prefs) =>
        setState((){visible = prefs.getBool("Visibility") ?? true;})
    );

  }
  @override
  Widget build(BuildContext context) {
    if (visible == null) loadValue();
    return Padding(
        padding: const EdgeInsets.all(12.0),
    child: InkWell(
      onTap: (){ Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => CardInfoPage(cardId: widget.cardId)));
      print("CARD ID"+widget.cardId);},
        child: Container(
      height: 200,
      width: 380,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text("11 000 \$", style: ThemeStyles.cardMoney),
                IconButton(
                    icon: visible==true ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  onPressed: (){
                    SharedPreferences.getInstance().then((prefs) => prefs.setBool("Visibility", !visible));
                    // prefs.setBool("Visibility", false);
                    setState((){visible = !visible;});
                      },
                ),
              ])),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name Surname', style: ThemeStyles.cardDetails),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Text('XXXX', style: ThemeStyles.cardDetails),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: SvgPicture.asset('assets/images/card-dots.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: SvgPicture.asset('assets/images/card-dots.svg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: Text('XXXX', style: ThemeStyles.cardDetails),
                    ),
                  ],
                )
              ],
            ),
          )

        ],
      ),
    )));
  }
}

