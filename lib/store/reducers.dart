import 'actions.dart';

class AppState{
  var email;
  var password;
  AppState({this.email, this.password});
  AppState.fromAnotherState(AppState another){
    email = another.email;
    password = another.password;
  }
}
AppState mainReducer(AppState prevState, action){
  AppState newState = AppState.fromAnotherState(prevState);
  if (action is SetLoginData) {
    newState.email = action.email;
    newState.password = action.password;
  }
  return newState;
}