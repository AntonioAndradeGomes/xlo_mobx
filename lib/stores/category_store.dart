import 'package:mobx/mobx.dart';
import 'package:xlo_clone/models/Category.dart';
import 'package:xlo_clone/repositories/category_reporitory.dart';
part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  ObservableList<Category> categoryList = ObservableList<Category>();

  @observable
  String error = '';

  _CategoryStoreBase() {
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();
      setCategories(categories);
    } catch (e) {
      setError(e);
    }
  }

  @action
  void setCategories(List<Category> value) {
    categoryList.clear();
    categoryList.addAll(value);
  }

  @action
  void setError(String value) => error = value;
}
