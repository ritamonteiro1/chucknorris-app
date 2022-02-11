import 'package:hive/hive.dart';

part 'chuck_category_cm.g.dart';

@HiveType(typeId: 0)
class ChuckCategoryCM {
  ChuckCategoryCM(
    this.title,
  );

  @HiveField(0)
  final String title;
}
