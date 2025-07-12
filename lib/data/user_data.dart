class UserData {
  static String? registeredName;
  static String? registeredEmail;
  static String? registeredPassword;

  static void registerUser(String name, String email, String password) {
    registeredName = name;
    registeredEmail = email;
    registeredPassword = password;
  }

  static bool loginUser(String email, String password) {
    return email == registeredEmail && password == registeredPassword;
  }
}
