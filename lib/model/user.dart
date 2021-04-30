import 'package:firebase_database/firebase_database.dart';

class User {
  String _name;
  String _mobile;
  String _requirements;

  User(this._name, this._mobile, this._requirements);

  User.map(dynamic obj) {
    this._name = obj['name'];
    this._mobile = obj['mobile'];
    this._requirements = obj['requirements'];
  }

  String get name => _name;
  String get mobile => _mobile;
  String get requirements => _requirements;

  User.fromSnapshot(DataSnapshot snapshot) {
    _name = snapshot.key;
    _mobile = snapshot.value['mobile'];
    _requirements = snapshot.value['requirements'];
  }
}
