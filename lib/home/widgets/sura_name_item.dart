import 'package:flutter/material.dart';

import '../../data/sura_list.dart';

class SuraNameItem extends StatelessWidget {
  String nameAr, nameEn;
  int index;
  int numofVerses;

  SuraNameItem({
    required this.index,
    required this.nameAr,
    required this.nameEn,
    required this.numofVerses,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/icons/suraNum.png", height: 52, width: 52),
            Text("$index", style: TextStyle(fontSize: 18, color: Colors.white)),
          ],
        ),
        SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$nameEn",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                "$numofVerses Verses",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
        Text("$nameAr", style: TextStyle(fontSize: 18, color: Colors.white)),
      ],
    );
  }
}
