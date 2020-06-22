import 'package:todo/models/user.dart';

abstract class AuthenticationService {
  Future signIn(User user);

  Future signOut();

  Future<User> currentUser();
}
