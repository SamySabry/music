

class User {
    int _id;
   String _email;
   String _firstName;
    String _password;


    User.inti();

    User(this._id, this._email, this._firstName, this._password);

    String get password => _password;

    set password(String value) {
      _password = value;
    }

    int get id => _id;

  set id(int value) {
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
