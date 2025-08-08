import 'package:flutter/material.dart';
import '../../thems/app_color.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedTab = 0; // 0 = Radio, 1 = Reciters
  int? playingIndex;

  final List<Map<String, String>> radioData = [
    {
      'title': 'Radio Ibrahim Al-Akdar',
      'image': 'assets/images/radio/radio1.png',
    },
    {
      'title': 'Radio Al-Qaria Yassen',
      'image': 'assets/images/radio/radio1.png',
    },
    {
      'title': 'Radio Ahmed Al-trabulsi',
      'image': 'assets/images/radio/radio1.png',
    },
    {
      'title': 'Radio Addokali Mohammad Alalim',
      'image': 'assets/images/radio/radio1.png',
    },
  ];

  final List<Map<String, String>> reciterData = [
    {
      'title': 'Ibrahim Al-Akdar',
      'image': 'assets/images/radio/radio1.png',
    },
    {
      'title': 'Akram Alalaqmi',
      'image': 'assets/images/radio/radio1.png',
    },
    {
      'title': 'Majed Al-Enezi',
      'image': 'assets/images/radio/radio1.png',
    },
    {
      'title': 'Malik shaibat Alhamed',
      'image': 'assets/images/radio/radio1.png',
    },
  ];

  void togglePlay(int index) {
    setState(() {
      playingIndex = (playingIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = selectedTab == 0 ? radioData : reciterData;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTab('Radio', 0),
                  const SizedBox(width: 8),
                  buildTab('Reciters', 1),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // List of Radios or Reciters
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final isPlaying = playingIndex == index;
                  final item = items[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.textPrimary,
                    ),
                    child: Stack(
                      children: [
                        // Bottom image only
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                            child: Image.asset(
                              item['image']!,
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.bottomCenter,
                            ),
                          ),
                        ),

                        // Foreground content
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Title centered at top
                              Text(
                                item['title']!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const Spacer(),

                              // Icons in a row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      isPlaying ? Icons.pause_circle_filled : Icons.play_circle,
                                      color: Colors.black,
                                      size: 32,
                                    ),
                                    onPressed: () => togglePlay(index),
                                  ),
                                  const SizedBox(width: 16),
                                  Icon(
                                    isPlaying ? Icons.volume_up : Icons.volume_off,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper for building tab buttons
  Expanded buildTab(String label, int tabIndex) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = tabIndex),
        child: Container(
          decoration: BoxDecoration(
            color: selectedTab == tabIndex ? AppColors.textPrimary : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: selectedTab == tabIndex ? Colors.black : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
