String validateName(String value) {
  if (value.length < 1) return 'Enter a your name';
  if (value.length < 3) return 'Name must be more than 2 charater';
  return null;
}


String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

String validatePassword(String value) {
  if (value.length < 1) return 'Enter a password';
  if (value.length < 5) return 'Password must be 6 chrachter long';
  return null;
}

String validateConfirmPassword(String value, String value2) {
  if (value.length < 1) return 'Re enter password';
  if (value.length < 5) return 'Password must be 6 chrachter long';
  if (value != value2) return 'Confirm Password should match password';
  return null;
}
