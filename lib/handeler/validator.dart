import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ValidationType { phone, notEmpty, email, password, validationCode }

class AppValidator {
  static FilteringTextInputFormatter priceValueOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'));
  }

  static String? validateFields(
    String? value,
    ValidationType fieldType,
    BuildContext context, {
    String? errorMeassge,
    int passwordLength = 4,
    int phoneLength = 10,
    int codeLength = 4,
  }) {
    if (value == null) {
      return errorMeassge ?? "Field required";
    } else if (fieldType == ValidationType.email) {
      if (value.isEmpty) {
        return errorMeassge ?? "Email required";
      }
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        return errorMeassge ?? "It must be an email";
      }
    } else if (fieldType == ValidationType.password) {
      if (value.isEmpty) {
        return errorMeassge ?? "Password required";
      }
      if (value.length < passwordLength) {
        return errorMeassge ??
            "The password must be greater than or equal to $passwordLength";
      }
    } else if (fieldType == ValidationType.phone) {
      if (value.length != phoneLength) {
        return errorMeassge ?? "Field required";
      }
    } else if (fieldType == ValidationType.notEmpty) {
      if (value.trim().isEmpty || value.isEmpty) {
        return errorMeassge ?? "Field required";
      }
    } else if (fieldType == ValidationType.validationCode) {
      if (value.isEmpty || value.length != codeLength) {
        return errorMeassge ?? "Validate code";
      }
    }
    return null;
  }
}
