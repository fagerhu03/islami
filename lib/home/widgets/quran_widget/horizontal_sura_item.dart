import 'package:flutter/material.dart';

class HorizontalSuraItem extends StatelessWidget {
  final String nameAr;
  final String nameEn;
  final int index;
  final int numOfVerses;

  const HorizontalSuraItem({
    super.key,
    required this.index,
    required this.numOfVerses,
    required this.nameAr,
    required this.nameEn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Color(0xFFE2BE7F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                nameEn,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "janna",
                ),
              ),
              SizedBox(height: 8),
              Text(
                nameAr,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "janna",
                ),
              ),
              SizedBox(height: 8),
              Text(
                "$numOfVerses Verses",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: "janna",
                ),
              ),
            ],
          ),
          Image.asset("assets/images/most_recently_icon.png"),
        ],
      ),
    );
  }
}
