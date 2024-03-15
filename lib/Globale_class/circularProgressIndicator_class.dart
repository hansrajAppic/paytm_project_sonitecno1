import 'package:flutter/material.dart';

class GlobalCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final bool isLoading;

  const GlobalCircularProgressIndicator({
    Key? key,
    this.color = Colors.blue,
    this.strokeWidth = 4.0,
    required this.isLoading,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: strokeWidth,
            )
          : SizedBox(),
    );
  }
}
