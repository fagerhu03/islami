class ZikrModel {
  final String english;
  final String arabic;
  final int maxCount;
  int currentCount;

  ZikrModel({
    required this.english,
    required this.arabic,
    required this.maxCount,
    this.currentCount = 0,
  });
}
