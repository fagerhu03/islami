import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/zikr_model.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaListTabState();
}

class _SebhaListTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  List<ZikrModel> azkar = [];
  int currentIndex = 0;
  double rotationAngle = 0;

  @override
  void initState() {
    super.initState();
    loadZikrFromTxt();
  }

  Future<void> loadZikrFromTxt() async {
    try {
      final raw = await rootBundle.loadString("assets/file/ziker/azkar_list.txt");
      final lines = raw.trim().split('\n');

      for (int i = 0; i < lines.length; i += 3) {
        if (i + 2 < lines.length) {
          azkar.add(ZikrModel(
            english: lines[i].trim(),
            arabic: lines[i + 1].trim(),
            maxCount: int.tryParse(lines[i + 2].trim()) ?? 30,
          ));
        }
      }

      setState(() {});
    } catch (e) {
      print("Error loading azkar: $e");
    }
  }

  void incrementCounter() {
    setState(() {
      final currentZikr = azkar[currentIndex];
      if (currentZikr.currentCount < currentZikr.maxCount) {
        currentZikr.currentCount++;
        rotationAngle += (2 * pi) / 33; // evenly rotate assuming 33 beads
      }

      if (currentZikr.currentCount >= currentZikr.maxCount &&
          currentIndex < azkar.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: azkar.isEmpty
          ? const Center(
        child: Text(
          "No azkar loaded",
          style: TextStyle(color: Colors.white),
        ),
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          const Text(
            'سَبِّحِ ٱسْمَ رَبِّكَ ٱلْأَعْلَى',
            style: TextStyle(
              fontFamily: 'janna',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: incrementCounter,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedRotation(
                  turns: rotationAngle / (2 * pi),
                  duration: const Duration(milliseconds: 300),
                  child: Image.asset(
                    'assets/images/sebha/Sebha.png',
                  ),
                ),
                Column(
                  children: [
                    Text(
                      azkar[currentIndex].arabic,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "janna",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      azkar[currentIndex].english,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${azkar[currentIndex].currentCount}/${azkar[currentIndex].maxCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
