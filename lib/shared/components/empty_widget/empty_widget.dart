import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/falling-box.gif",
            height: 150.0,
            width: 150.0,
          ),
          const Text(
            "Sorry! could'nt fetch any data :( ",
            style: TextStyle(
              fontFamily: 'IndieFlower',
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
