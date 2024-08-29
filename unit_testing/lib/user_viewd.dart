import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rawant/user_repo.dart';

class UserViewd extends StatefulWidget {
  const UserViewd({super.key});

  @override
  State<UserViewd> createState() => _UserViewdState();
}

class _UserViewdState extends State<UserViewd> {
  final UserRepo userRepo = UserRepo(Client());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userRepo.getUser(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return Text(snap.data.toString());
          }
        });
  }
}
