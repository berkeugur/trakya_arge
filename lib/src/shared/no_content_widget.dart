import 'package:flutter/material.dart';

class NoContentWidget extends StatelessWidget {
  const NoContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("İçerik Bulunamadı"),
    );
  }
}
