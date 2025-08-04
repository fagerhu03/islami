import 'package:flutter/material.dart';
import '../../../data/hadeth_model.dart';
import '../../../thems/app_color.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = "HadethDetailsScreen";

  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HadethModel model = ModalRoute.of(context)!.settings.arguments as HadethModel;

    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      appBar: AppBar(
        backgroundColor: const Color(0xFF202020),
        title: Text(
          model.title,
          style: const TextStyle(
            fontFamily: "janna",
            color: Color(0xFFE2BE7F),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFFE2BE7F)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sura_details_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Opacity(
                      opacity: 0.05,
                      child: Image.asset(
                        "assets/images/sura_details_bg.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      const Divider(
                        color: Color(0xFF202020),
                        indent: 60,
                        endIndent: 60,
                        thickness: 2,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListView.separated(
                            itemCount: model.content.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12),
                            itemBuilder: (context, index) => Text(
                              model.content[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: "janna",
                                fontSize: 20,
                                color: Color(0xFFE2BE7F),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
