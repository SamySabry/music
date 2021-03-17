

class User {
    String _id;
   String _email;
   String _firstName;
    String _password;


    User.inti();

    User(this._id, this._email, this._firstName, this._password);

    User.s(this._id, this._email, this._firstName);

    String get password => _password;

    set password(String value) {
      _password = value;
    }

    String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }



  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

}
