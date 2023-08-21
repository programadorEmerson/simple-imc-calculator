import 'package:hive/hive.dart';

part 'imc.g.dart';

@HiveType(typeId: 0)
class ImcModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  double height;

  @HiveField(2)
  double weight;

  @HiveField(3)
  double imc;

  @HiveField(4)
  String message;

  ImcModel(this.id, this.height, this.weight, this.imc, this.message);
}
