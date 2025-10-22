import 'package:exam_app/core/helper/validation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("test cases of email validation", () {
    test("when call email validation with valid email should return null", () {
      // Arrange /prepare test data
      var email = "anas@gmail.com";

      // Act // call the method
      var actualResult = Validation.validateEmail(email);

      // Assert // Check The result
      expect(actualResult, null);
    });
    test("when call email validation with not valid email should return String", () {
      // Arrange /prepare test data
      var email = "anas@.com";

      // Act // call the method
      var actualResult = Validation.validateEmail(email);

      // Assert // Check The result
      expect(actualResult, "Enter a valid email");
    });
    test("when call email validation with null value should return String", () {
      // Arrange /prepare test data
      var email = "";

      // Act // call the method
      var actualResult = Validation.validateEmail(email);

      // Assert // Check The result
      expect(actualResult, "Please enter your email");
    });

  },);
}
