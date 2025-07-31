// lib/home/widgets/quran_widget/search_quran.dart

import 'package:flutter/material.dart';
import 'package:islami/thems/app_color.dart';

class SearchQuran extends StatefulWidget {
  final List<Map<String, dynamic>> surahList;

  const SearchQuran({Key? key, required this.surahList}) : super(key: key);

  @override
  State<SearchQuran> createState() => _SearchQuranState();
}

class _SearchQuranState extends State<SearchQuran> {
  final TextEditingController searchController = TextEditingController();
  String query = "";
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    final filtered = query.isEmpty
        ? widget.surahList
        : widget.surahList.where((surah) {
            final name = surah["name"]?.toLowerCase() ?? '';
            final arabic = surah["arabic"] ?? '';
            return name.contains(query.toLowerCase()) || arabic.contains(query);
          }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final surah = filtered[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(surah['number'].toString()),
                  ),
                  title: Text(
                    surah['name'] ?? '',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text('${surah['verses']} Verses'),
                  trailing: Text(
                    surah['arabic'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
