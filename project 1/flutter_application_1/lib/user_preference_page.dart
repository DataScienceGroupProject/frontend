import 'package:flutter/material.dart';

class user_preference extends StatefulWidget {
  const user_preference({Key? key}) : super(key: key);

  @override
  State<user_preference> createState() => _user_preferenceState();
}

class _user_preferenceState extends State<user_preference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("user preference"),
      ),
    );
  }
}
