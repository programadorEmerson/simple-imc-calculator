import 'package:hive/hive.dart';
import 'package:imccalculator/models/imc.dart';

class ImcRepository {
  static late Box<ImcModel> dataBase;

  static Future<void> openBox() async {
    dataBase = await Hive.openBox<ImcModel>('imcList');
  }

  static List<ImcModel> getAllData() {
    return dataBase.values.toList();
  }

  static Future<void> addImc(ImcModel imcModel) async {
    await dataBase.add(imcModel);
  }

  static Future<void> updateImc(int index, ImcModel imcModel) async {
    await dataBase.putAt(index, imcModel);
  }

  static Future<void> deleteImc(int index) async {
    await dataBase.deleteAt(index);
  }
}
