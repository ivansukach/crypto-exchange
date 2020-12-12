import 'actions.dart';

class CryptoWallet{
  String cryptocurrency;
  String address;
  CryptoWallet(this.cryptocurrency, this.address);
}
class AppState{
  var email;
  var password;
  var cards;
  AppState({email, password, cards});
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
    newState.cards = new Map <String, List<CryptoWallet>>();
    newState.cards = prevState.cards;
    if(newState.cards[action.card].length==0) {
      newState.cards[action.card] =
      [CryptoWallet(action.cryptocurrency, action.address)];
    } else {
      newState.cards[action.card].add(CryptoWallet(action.cryptocurrency, action.address));
    }
  }
  return newState;
}