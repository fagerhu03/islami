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
  double rotationTurns = 0;

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
        rotationTurns += 1 / 33; // one bead step (360/33 degrees)
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
      backgroundColor: Colors.transparent,
      body: azkar.isEmpty
          ? const Center(
        child: Text("No azkar loaded", style: TextStyle(color: Colors.white)),
      )
          : SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Sebha Image Rotating
            GestureDetector(
              onTap: incrementCounter,
              child: AnimatedRotation(
                turns: rotationTurns,curve: Curves.linear,
                duration: const Duration(milliseconds: 300),
                child: Center(
                  child: Image.asset(
                    'assets/images/sebha/Sebha.png',
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Text in the center of the Sebha
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  azkar[currentIndex].arabic,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: "janna",
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  azkar[currentIndex].english,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '${azkar[currentIndex].currentCount}/${azkar[currentIndex].maxCount}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Top Text
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'سَبِّحِ ٱسْمَ رَبِّكَ ٱلْأَعْلَى',
                  style: const TextStyle(
                    fontFamily: 'janna',
                    color: Colors.white,
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
