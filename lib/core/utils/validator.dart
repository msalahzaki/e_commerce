
  class Validator {

  // Validate Email
  static String? validateEmail(String? value) {
  if (value == null || value.isEmpty) return "Email is required";
  final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  return regex.hasMatch(value) ? null : "Enter a valid email";
  }

  // Validate Name (Only Letters, Min 2 Characters)
  static String? validateName(String? value) {
  if (value == null || value.isEmpty) return "Name is required";
  final regex = RegExp(r"^[a-zA-Z\u0621-\u064A ]{2,}$"); // Supports Arabic & English
  return regex.hasMatch(value) ? null : "Enter a valid name (at least 2 letters)";
  }

  // Validate Password (Min 8 chars, at least 1 letter & 1 number)
  static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return "Password is required";
  final regex = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
  return regex.hasMatch(value)
  ? null
      : "Password must be at least 8 characters and contain a letter and a number";
  }

  // Validate Confirm Password (Must match the original password)
  static String? validateConfirmPassword(String? value, String? originalPassword) {
  if (value == null || value.isEmpty) return "Confirm Password is required";
  return value == originalPassword ? null : "Passwords do not match";
  }

  // Validate 11-digit Phone Number (Only Numbers)
  static String? validatePhone(String? value) {
  if (value == null || value.isEmpty) return "Phone number is required";
  final regex = RegExp(r"^\d{11}$");
  return regex.hasMatch(value) ? null : "Enter a valid 11-digit phone number";
  }
  }

