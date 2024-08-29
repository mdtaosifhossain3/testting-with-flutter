import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rawant/user_mode.dart';

class UserRepo {
  final http.Client client;
  UserRepo(this.client);
  Future<User> getUser() async {
    final res = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body.toString());
      return User.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }
}
