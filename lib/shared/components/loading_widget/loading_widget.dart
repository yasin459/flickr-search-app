import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const double _kSize = 100;

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LoadingAnimationWidget.halfTriangleDot(
              color: Colors.amber,
              size: _kSize,
            ),
          ),
          const Text(
            "Fetching Data...",
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
