import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/services/signInNotifier.dart';

void main() {
  test(
      'Given the user when starts app then checkwhether he is signedIn and mark as signedIn ',
      () async {
    //ARRANGE
    final signInNotifier = SignInNotifier();
    SharedPreferences pref = await SharedPreferences.getInstance();
    //ACT
    signInNotifier.setIsSigned(!(pref.getString("signedIn") == null));

    //ASSERT
    expect(signInNotifier.value, !(pref.getString("signedIn") == null));
  });
}
