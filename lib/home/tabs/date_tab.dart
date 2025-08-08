import 'package:flutter/material.dart';
import '../../thems/app_color.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/azkar/pray_header.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 125),
                      child: Column(
                        children: [
                          Align(
                            child: Center(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children:
                                      [
                                        {'name': 'Fajr', 'time': '04:04 AM'},
                                        {'name': 'Dhuhr', 'time': '01:01 PM'},
                                        {'name': 'ASR', 'time': '04:38 PM'},
                                        {'name': 'Maghrib', 'time': '07:57 PM'},
                                        {'name': 'Isha', 'time': '09:12 PM'},
                                      ].map((prayer) {
                                        final timeParts = prayer['time']!.split(
                                          ' ',
                                        );
                                        return Container(
                                          width: 125,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 32,
                                            horizontal: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Colors.black87,
                                                Colors.black26,
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                prayer['name']!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "janna",
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                timeParts[0],
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                  fontFamily: "janna",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                timeParts[1],
                                                style: const TextStyle(
                                                  fontFamily: "janna",
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Next Pray - 02:32',
                            style: TextStyle(
                              fontFamily: "janna",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.background,
                            ),
                          ),
                          Icon(Icons.volume_off, color: AppColors.background),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '15 Aug\n 2025',
                              style: TextStyle(
                                fontFamily: "janna",
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              '06 Sufer\n1447',
                              style: TextStyle(
                                fontFamily: "janna",
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Friday',
                        style: TextStyle(
                          fontFamily: "janna",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.background,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 📿 Azkar section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Azkar',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 260,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.textPrimary, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset('assets/images/azkar/evening.png'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Evening Azkar',
                          style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "janna",),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 260,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.textPrimary, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.asset('assets/images/azkar/morning.png'),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Morning Azkar',
                          style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "janna",),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
