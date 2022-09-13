import 'package:flutter/material.dart';

import 'widgets/learning_patch_list.dart';
class LearningPathPage extends StatelessWidget {
  const LearningPathPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicoding Learning Paths'),
      ),
      body: const LearningPathList(),
    );
  }
}
