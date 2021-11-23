import 'package:flutter/material.dart';

class CreateTweetScreen extends StatelessWidget {
  const CreateTweetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Tweet Screen',
        ),
      ),
    );
  }
}
