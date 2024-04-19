
class FormValidation {

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "كلمة السر مطلوبة";
    }
    return null;
  }



  static String? validateFormEmail(String? email) {
    if (email!.isEmpty) {
      return "البريد الالكتروني مطلوب";
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email)) {
      return "البريد الالكتروني خطا";
    }
    return null;
  }
}
