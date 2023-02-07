String? validateEmail(String? formEmail) {
  final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (formEmail == null || formEmail.isEmpty) {
    return 'Enter your E-mail Address';
  }

  if (!emailRegExp.hasMatch(formEmail)) {
    return 'Enter a valid email address';
  }

  return null;
}
