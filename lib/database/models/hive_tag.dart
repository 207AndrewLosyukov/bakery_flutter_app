import 'package:hive/hive.dart';
import 'package:shop_flutter_app/models/tag.dart';

part 'hive_tag.g.dart';

@HiveType(typeId: 3)
class HiveTag {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;

  HiveTag({
    required this.id,
    required this.title,
  });

  static HiveTag fromTag(Tag tag) {
    return HiveTag(id: tag.id, title: tag.title);
  }

  Tag toTag() {
    return Tag(id: id, title: title);
  }
}
