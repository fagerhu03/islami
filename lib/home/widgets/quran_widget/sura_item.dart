import 'package:flutter/material.dart';

class SuraItem extends StatelessWidget {
  final String nameAr;
  final String nameEn;
  final int index;
  final int numOfVerses;

  const SuraItem(
      {super.key,
        required this.index,
        required this.numOfVerses,
        required this.nameAr,
        required this.nameEn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/index_ic.png",
              height: 52,
              width: 52,
            ),
            Text(
              "$index",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$nameEn",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "$numOfVerses Verses",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
        Text(
          "$nameAr",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }
}