import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, -1.2),
              child: Container(
                height: 300,
                width: 355,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  color: const Color.fromARGB(255, 174, 0, 255),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(2.3, 0.02),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-2.3, 0.02),
              child: Container(
                height: 300,
                width: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 0, 0),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
              ),
            ),
            const Center(child: CircularProgressIndicator(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
