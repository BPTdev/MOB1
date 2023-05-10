import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylofonKey extends StatelessWidget {
  final int iconSize;
  final Color iconColor;
  final int sizedBoxSize;
  final String keyText;
  final Color keyColor;
  final int audioNumber;

  const XylofonKey({
    Key? key,
    required this.iconSize,
    required this.iconColor,
    required this.sizedBoxSize,
    required this.keyText,
    required this.keyColor,
    required this.audioNumber,
  }) : super(key: key);

  void playSound(audioPath) {
    final player = AudioPlayer();
    player.play(AssetSource('note$audioNumber.wav'));
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  {
        playSound(audioNumber);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: sizedBoxSize.toDouble(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: keyColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.circle,
                  color: iconColor,
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
                  color: iconColor,
                  size: iconSize.toDouble(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
