import 'package:hive/hive.dart' show Box, Hive;

class Favoirets {
  late Box _box;

  Favoirets._internal(this._box);

  static Future<Favoirets> create() async {
    if (!Hive.isBoxOpen('favoirets')) {
      await Hive.openBox('favoirets');
    }
    return Favoirets._internal(Hive.box('favoirets'));
  }

  void addToFavorites(Map<String, dynamic> data) {
    _box.put(data['name'], data); // name as key, full data as value
  }

  void removeFavorite(String name) {
    _box.delete(name);
  }

  bool isFavorite(String name) {
    return _box.containsKey(name);
  }

  List<Map<String, dynamic>> getAllFavorites() {
    return _box.values.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
