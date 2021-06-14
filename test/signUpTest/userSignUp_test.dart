import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/signup/model.dart';

void main() {
  test(
      "Given User when tries to signup then check whether account doesnot exists if yes return true else false",
      () async {
    //arrange
    SignupModel model = SignupModel();
    //act
    bool result = await model.addUserDetails("swaroopsam@gmail.com", "1234");
    //assert
    expect(true, result);
  });
}
