import 'dbhelper.dart';
import 'passport.dart';

class User {
  int? user_id;
  String? first_name;
  String? last_name;
  String? username;
  String? password;
  String? bank_name;
  String? account_num;
  Passport? passport;

  User(this.user_id, this.first_name, this.last_name, this.username, this.password, this.bank_name, this.account_num, this.passport);

  User.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    first_name = map['first_name'];
    last_name = map['last_name'];
    username = map['username'];
    password = map['password'];
    bank_name = map['bank_name'];
    account_num = map['account_num'];
    passport = map['passport'];
  }

  Map<String, dynamic> toMap() {
    Passport passport = Passport(user_id, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false);
    return {
      DatabaseHelper.columnId: user_id,
      DatabaseHelper.columnFirstName: first_name,
      DatabaseHelper.columnLastName: last_name,
      DatabaseHelper.columnUsername: username,
      DatabaseHelper.columnPassword: password,
      DatabaseHelper.columnBankName: bank_name,
      DatabaseHelper.columnAccountNum: account_num,
      DatabaseHelper.columnPassport: passport
    };
  }
}