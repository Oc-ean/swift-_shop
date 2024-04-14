import 'package:hive/hive.dart';
import 'package:swift_shop/models/user_model.dart';

class CategoryItemDatabase {
  late Box<UserModel> _userModelBox;

  Future<void> init() async {
    _userModelBox = await Hive.openBox<UserModel>('UserModels');
  }

  Future<void> assignCategoryItemModel(
      {required List<UserModel> userModel}) async {
    await _userModelBox.clear();
    await _userModelBox.addAll(userModel);
  }

  List<UserModel> getCategories() => _userModelBox.values.toList();
}
