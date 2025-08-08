import 'package:flutter/material.dart';
import 'package:islami/home/widgets/quran_widget/sura_details_screen.dart';
import 'package:islami/home/widgets/quran_widget/sura_name_item.dart';
import 'package:islami/thems/app_color.dart';
import '../../data/suar_item_model.dart';
import '../../data/sura_list.dart';
import '../widgets/quran_widget/horizontal_sura_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  final TextEditingController searchController = TextEditingController();
  String query = "";
  bool isFocused = false;

  late final List<Map<String, dynamic>> surahs = List.generate(
    114,
        (index) => {
      "number": index + 1,
      "name": englishQuranSurahs[index],
      "arabic": arabicAuranSuras[index],
      "verses": AyaVerses[index],
    },
  );

  @override
  Widget build(BuildContext context) {
    final filteredSurahs = query.isEmpty
        ? surahs
        : surahs.where((surah) {
      final name = surah["name"]?.toLowerCase() ?? '';
      final arabic = surah["arabic"] ?? '';
      return name.contains(query.toLowerCase()) || arabic.contains(query);
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),

          FocusScope(
            child: Focus(
              onFocusChange: (focus) {
                setState(() {
                  isFocused = focus;
                });
              },
              child: TextField(
                controller: searchController,
                onChanged: (val) => setState(() => query = val),
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
            ),
          ),

          const SizedBox(height: 20),

          if (isFocused || query.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: filteredSurahs.length,
                itemBuilder: (context, index) {
                  final surah = filteredSurahs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SuraDetailsScreen.routeName,
                        arguments: SuraItemModel(
                          index: surah['number'] - 1,
                          nameEn: surah['name'],
                          nameAr: surah['arabic'],
                          numOfVerses: surah['verses'],
                        ),
                      );
                    },
                    child: SuraNameItem(
                      index: surah['number'],
                      nameAr: surah['arabic'],
                      nameEn: surah['name'],
                      numofVerses: surah['verses'],
                    ),
                  );
                },
              ),
            )
          else ...[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Most Recently",
                style: TextStyle(
                  fontFamily: "janna",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 180,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return HorizontalSuraItem(
                    index: index + 1,
                    nameAr: arabicAuranSuras[index],
                    nameEn: englishQuranSurahs[index],
                    numOfVerses: AyaVerses[index],


                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Suras List",
                style: TextStyle(
                  fontFamily: "janna",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                  endIndent: 40,
                  indent: 40,
                  color: Color(0xFFE2BE7F),
                ),
                itemCount: surahs.length,
                itemBuilder: (context, index) {
                  final surah = surahs[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SuraDetailsScreen.routeName,
                        arguments: SuraItemModel(
                          index: index,
                          nameEn: surah['name'],
                          nameAr: surah['arabic'],
                          numOfVerses: surah['verses'],
                        ),
                      );
                    },
                    child: SuraNameItem(
                      index: surah['number'],
                      nameAr: surah['arabic'],
                      nameEn: surah['name'],
                      numofVerses: surah['verses'],
                    ),

                  );

                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}
