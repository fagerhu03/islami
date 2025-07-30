import 'package:flutter/material.dart';
import 'package:islami/thems/app_color.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Image.asset("assets/images/welcom_images/onboarding_header.png"),
          TextField(
            decoration: InputDecoration(
              prefixIcon: ImageIcon(
                AssetImage("assets/icons/quran_icon.png"),
                color: AppColors.textPrimary,
              ),
              filled: true,
              fillColor: Color(0xFF202020).withOpacity(.7),
              hintText: "Sura Name",
              hintStyle: TextStyle(
                fontFamily: "janna",
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textPrimary),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textPrimary),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.textPrimary),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Most Recently",
            style: TextStyle(
              fontFamily: "janna",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
