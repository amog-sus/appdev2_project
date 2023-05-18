import 'dbhelper.dart';
import 'passport.dart';

class User {
  int? user_id;
  String? first_name;
  String? last_name;
  String? username;
  String? password;
  String? favCountry;
  String? nextDestination;
  Passport? passport;

  User(this.user_id, this.first_name, this.last_name, this.username, this.password, this.favCountry, this.nextDestination, this.passport);

  User.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    first_name = map['first_name'];
    last_name = map['last_name'];
    username = map['username'];
    password = map['password'];
    favCountry = map['favCountry'];
    nextDestination = map['nextDestination'];
    passport = map['passport'];
  }

  User.firstFromMap(Map<String, dynamic> map) {
    String favCountry = "";
    String nextDestination = "";
    Passport pass = Passport(user_id, List.empty(growable: true));
    user_id = map['user_id'];
    first_name = map['first_name'];
    last_name = map['last_name'];
    username = map['username'];
    password = map['password'];
    favCountry = favCountry;
    nextDestination = nextDestination;
    passport = pass;
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: user_id,
      DatabaseHelper.columnFirstName: first_name,
      DatabaseHelper.columnLastName: last_name,
      DatabaseHelper.columnUsername: username,
      DatabaseHelper.columnPassword: password,
      DatabaseHelper.columnFavCountry: favCountry,
      DatabaseHelper.columnNextDestination: nextDestination,
      DatabaseHelper.columnPassport: passport
    };
  }
}