import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: SizedBox(
              width: constraints.maxWidth * controller.image.value,
              height: constraints.maxHeight * 0.5,
            ),
          );
        },
      ),
    );
  }
}
