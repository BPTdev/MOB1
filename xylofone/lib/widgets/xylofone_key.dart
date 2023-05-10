import 'package:flutter/material.dart';

class XylofonKey extends StatelessWidget {
  final int iconSize;
  final int sizedBoxSize;
  final String keyText;
  final Color keyColor;

  const XylofonKey({
    Key? key,
    required this.iconSize,
    required this.sizedBoxSize,
    required this.keyText,
    required this.keyColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.95,
      height: sizedBoxSize.toDouble(),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: keyColor,
          ),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.circle,
                  color: Color.fromRGBO(119, 119, 119, 1.0),
                  size: iconSize.toDouble(),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(keyText, style: TextStyle(fontSize: iconSize.toDouble())),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.circle,
                  color: Color.fromRGBO(119, 119, 119, 1.0),
                  size: iconSize.toDouble(),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
