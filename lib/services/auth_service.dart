class User {
  final String email;
  final String password;
  final String? name;

  User({
    required this.email,
    required this.password,
    this.name,
  });
}

class AuthService {
  // In-memory storage of users (in a real app, this would be a database)
  static final List<User> _users = [];

  // Signup method
  static bool signup({
    required String email,
    required String password,
    required String name,
  }) {
    // Check if user already exists
    if (_users.any((user) => user.email.toLowerCase() == email.toLowerCase())) {
      return false;
    }

    // Add new user
    _users.add(User(
      email: email,
      password: password,
      name: name,
    ));
    return true;
  }

  // Login method
  static bool login({
    required String email,
    required String password,
  }) {
    // Find user and verify password
    return _users.any((user) =>
        user.email.toLowerCase() == email.toLowerCase() &&
        user.password == password);
  }

  // Get user by email
  static User? getUserByEmail(String email) {
    try {
      return _users.firstWhere(
          (user) => user.email.toLowerCase() == email.toLowerCase());
    } catch (e) {
      return null;
    }
  }
}
