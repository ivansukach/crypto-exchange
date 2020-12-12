import 'actions.dart';

class CryptoWallet{
  String cryptocurrency;
  String address;
  CryptoWallet(this.cryptocurrency, this.address);
}
class AppState{
  var email;
  var password;
  Map <String, List<CryptoWallet>> cards;
  AppState({this.email, this.password, this.cards});
  AppState.fromAnotherState(AppState another){
    email = another.email;
    password = another.password;
    cards = another.cards;
  }
}
AppState mainReducer(AppState prevState, action){
  AppState newState = AppState.fromAnotherState(prevState);
  if (action is SetLoginData) {
    newState.email = action.email;
    newState.password = action.password;
  }
  if (action is AssociateCryptoWallet) {
    newState.cards[action.card]=newState.cards[action.card]..add(CryptoWallet(action.cryptocurrency, action.address));
  }
  return newState;
}