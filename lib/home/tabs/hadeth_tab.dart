import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/hadeth_model.dart';
import '../widgets/hadeth_widget/hadeeth_details_screen.dart';

class AhadethTab extends StatefulWidget {
  static const String routeName = "AhadethTab";

  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> ahadethData = [];

  @override
  void initState() {
    super.initState();
    loadAllAhadethFiles();
  }

  @override
  Widget build(BuildContext context) {
    return ahadethData.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 24), // Add space from bottom
      child: CarouselSlider.builder(
        itemCount: ahadethData.length,
        itemBuilder: (context, index, realIdx) {
          final hadeth = ahadethData[index];
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              Navigator.pushNamed(
                context,
                HadethDetailsScreen.routeName,
                arguments: hadeth,
              );
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2BE7F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/hadeeth_tab_bg.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 28),
                    Text(
                      hadeth.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: "janna",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF202020),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: hadeth.content.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                hadeth.content[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: "janna",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF202020),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.75,
          viewportFraction: 0.85,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: false,
        ),
      ),
    );
  }

  Future<void> loadAllAhadethFiles() async {
    for (int i = 1; i <= 50; i++) {
      try {
        String fileContent = await rootBundle.loadString(
          "assets/file/Hadeeth/h$i.txt",
        );

        List<String> lines = fileContent.trim().split("\n");

        if (lines.isNotEmpty) {
          String title = lines.first.trim();
          List<String> content = lines
              .sublist(1)
              .map((line) => line.trim())
              .toList();

          HadethModel hadeth = HadethModel(title, content);
          ahadethData.add(hadeth);
        }
      } catch (e) {
        debugPrint("Error loading Hadeeth/h$i.txt: $e");
      }
    }

    setState(() {});
  }
}
