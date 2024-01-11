class Validator {
  bool validatePassword({String? value}) {
    if (value == null || value.trim() == "") return false;

    if (value.length < 6) return false;

    if (!value.contains(RegExp(r"[A-Z]"))) return false;

    return true;
  }

  bool validateEmail({String? value}) {
    if (value == null || value.trim() == "") return false;

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(value);
  }
}
