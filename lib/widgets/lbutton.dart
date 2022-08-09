import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LButton extends StatelessWidget {
  const LButton({
    Key? key,
    this.title,
    this.color,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final Color? color;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Card(
        color: color,
        child: SizedBox(
          height: 70,
          width: 70,
          child: Center(
            child: Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
