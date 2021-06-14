import 'package:flutter_test/flutter_test.dart';
import 'package:todo/screens/signIn/model.dart';

void main() {
  test(
      "Give the user when tries to signIn then checkCredentials and display false if incorrect",
      () async {
    //arrange
    SigninModel model = SigninModel();
    //act
    bool mockValue =
        await model.checkUserDetails("swaroopsam@gmail.com", "123");

    //assert
    expect(false, mockValue);
  });
}
