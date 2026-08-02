// Replaces the unmodified Flutter template counter test, which referenced a
// counter widget and '+' icon that don't exist in this app.
//
// LoginPage/CreateAccount can't be widget-tested directly without mocking the
// firebase_core platform channel (they call Firebase.initializeApp() during
// build), so this covers the form-validation logic they both rely on instead.

import 'package:flutter_test/flutter_test.dart';
import 'package:kaagapay/auth/validator.dart';

void main() {
  group('Validator.validateEmail', () {
    test('accepts a well-formed email', () {
      expect(Validator.validateEmail(email: 'user@example.com'), isNull);
    });

    test('rejects an empty email', () {
      expect(Validator.validateEmail(email: ''), isNotNull);
    });

    test('rejects a malformed email', () {
      expect(Validator.validateEmail(email: 'not-an-email'), isNotNull);
    });
  });

  group('Validator.validatePassword', () {
    test('accepts a password of at least 6 characters', () {
      expect(Validator.validatePassword(password: 'abcdef'), isNull);
    });

    test('rejects an empty password', () {
      expect(Validator.validatePassword(password: ''), isNotNull);
    });

    test('rejects a password shorter than 6 characters', () {
      expect(Validator.validatePassword(password: 'ab'), isNotNull);
    });
  });

  group('Validator.validateConfirmPassword', () {
    test('accepts a confirmation of at least 6 characters', () {
      expect(Validator.validateConfirmPassword(confirmPassword: 'abcdef'),
          isNull);
    });

    test('rejects an empty confirmation', () {
      expect(
          Validator.validateConfirmPassword(confirmPassword: ''), isNotNull);
    });
  });
}
