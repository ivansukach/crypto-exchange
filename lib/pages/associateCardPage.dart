import 'package:crypto_exchange/components/card.dart';
import 'package:crypto_exchange/components/divider.dart';
import 'package:crypto_exchange/components/transactionCard.dart';
import 'package:crypto_exchange/store/actions.dart';
import 'package:crypto_exchange/store/reducers.dart';
import 'package:crypto_exchange/theme/themeStyles.dart';
import 'package:crypto_exchange/db/db.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:postgres/postgres.dart';
import 'package:smart_select/smart_select.dart';
import 'package:validators/validators.dart';

class AssociateCardPage extends StatefulWidget {
  final String cardId;

  AssociateCardPage({
    this.cardId,
  });

  @override
  _AssociateCardPageState createState() => _AssociateCardPageState();
}

class _AssociateCardPageState extends State<AssociateCardPage> {
  final addressFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String cryptocurrency = "bitcoin";
  List <S2Choice<String>> options = [
    S2Choice<String>(value: 'BTC', title: 'Bitcoin'),
    S2Choice<String>(value: 'ETH', title: 'Ethereum'),
    S2Choice<String>(value: 'XMR', title: 'Monero'),
  ];
  @override
  Widget build(BuildContext context) {
    int insertWallet(creditCard, wallet, cryptocurrency){
      return context.watch<WalletDatabase>().insertWallet(Wallet(creditCard: creditCard, address: wallet, cryptocurrency: cryptocurrency));
    }
    return Scaffold(
        backgroundColor: Color.fromRGBO(3, 9, 23, 1),
        body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                  child: Container(
                        height: 250,
                        child: CreditCard()
                    )
              ),
              Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Text("Associate crypto wallet\n with this credit card",
                  style: TextStyle(color: Colors.white))
              ),
              Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SmartSelect<String>.single(
                          title: "Cryptocurrencies",
                          placeholder: "select one",
                          value: "bitcoin",
                          choiceItems: options,
                          choiceStyle: S2ChoiceStyle(
                            titleStyle: TextStyle(color: Colors.white),
                            subtitleStyle: TextStyle(color: Colors.white),
                            color: Colors.grey,
                          ),
                          modalHeaderStyle: S2ModalHeaderStyle(
                            textStyle: TextStyle(color: Colors.white),
                            iconTheme: IconThemeData(color: Colors.white),
                            backgroundColor: Color.fromRGBO(3, 13, 30, 1),
                          ),
                          modalStyle: S2ModalStyle(
                            backgroundColor: Color.fromRGBO(3, 9, 23, 1),
                          ),
                          onChange: (state) => setState(()=> cryptocurrency = state.value),
                          tileBuilder: (context, state) {
                            return S2Tile.fromState(
                              state,
                              title: Text("Cryptocurrency", style: TextStyle(color: Colors.white)),
                              isTwoLine: true,
                              leading: Builder(
                                builder: (context) {
                                  return CircleAvatar(
                                    backgroundImage: AssetImage('assets/images/cryptocurrencies.jpeg'),
                                  );
                                },
                              ),
                            );
                          },
                      ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: addressFieldController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value){
                              if(!isLength(value, 6, 50)) return "Please, enter valid wallet address";
                              return null;
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                                border: InputBorder.none,
                                hintStyle:
                                TextStyle(color: Colors.grey[400]),
                                hintText: "Wallet address"),
                          ),
                        ),
                        Center(
                            child: FlatButton(
                              onPressed: () async{
                                if(_formKey.currentState.validate()) {
                                  StoreProvider.of<AppState>(context).dispatch(
                                      AssociateCryptoWallet(widget.cardId, addressFieldController.text, cryptocurrency));
                                  // var connection = PostgreSQLConnection("localhost", 5432, "crypto_exchange", username: "su", password: "su");
                                  // await connection.open();
                                  // connection.query("INSERT INTO wallets VALUES(@creditCard, @walletAddress, @cryptocurrency)",
                                  // substitutionValues: {"creditCard": widget.cardId, "walletAddress": addressFieldController.text, "cryptocurrency": cryptocurrency}).then((result)=>print(result));

                                  context.read<WalletDatabase>().insertWallet(Wallet(creditCard: widget.cardId, address: addressFieldController.text, cryptocurrency: cryptocurrency));
                                  // insertWallet(widget.cardId, addressFieldController.text, cryptocurrency);
                                  print("Value inserted for credit card " + widget.cardId);
                                  Navigator.pop(
                                      context, -1);
                                }
                              },
                              child:
                              Text("Associate", style: TextStyle(color: Colors.white)),
                              color: Color.fromRGBO(3, 18, 36, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ))
    ]
                    )
                  )
              )

            ]
        )
    );
  }
}
