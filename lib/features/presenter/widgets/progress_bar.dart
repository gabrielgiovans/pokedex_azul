import 'package:flutter/material.dart';

class GradientProgressBar extends StatelessWidget {
  final double value;
  final String label;
  final Color color;
  final Color backgroundColor;

  const GradientProgressBar(
      {required this.value,
      required this.label,
      required this.color,
      required this.backgroundColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Flexible(
                flex: value.toInt(),
                fit: FlexFit.tight,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: value == 100
                        ? const BorderRadius.all(Radius.circular(4))
                        : const BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            topLeft: Radius.circular(4),
                          ),
                  ),
                  child: const SizedBox(height: 40.0),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 100 - value.toInt(),
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: value == 0
                        ? const BorderRadius.all(Radius.circular(4))
                        : const BorderRadius.only(
                            bottomRight: Radius.circular(4),
                            topRight: Radius.circular(4)),
                  ),
                  child: const SizedBox(height: 40.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    label.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  '$value',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
