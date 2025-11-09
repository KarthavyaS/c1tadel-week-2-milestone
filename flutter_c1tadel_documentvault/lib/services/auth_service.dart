class AuthService {
  static Future<bool> login(String email, String password) async {
    // Add your authentication logic here (mock or Firebase)
    return email == "test@test.com" && password == "123456";
  }
}
