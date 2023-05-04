import 'country.dart';
import 'dbhelper.dart';

class Passport {
  int? pass_id;
  List<Country>? visited;

  Passport(this.pass_id, this.visited);

  Passport.firstPassport(this.pass_id, this.visited);

  Passport.fromMap(Map<String, dynamic> map) {
    pass_id = map['id'];
    visited = map['visited'];
  }
}