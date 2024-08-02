import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _category = (await secureStorage.getStringList('ff_category'))
              ?.map((x) {
                try {
                  return CategoriesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _category;
    });
    await _safeInitAsync(() async {
      _products = (await secureStorage.getStringList('ff_products'))
              ?.map((x) {
                try {
                  return TopProductStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _products;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_users') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_users') ?? '{}';
          _users = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _profileImage =
          await secureStorage.getString('ff_profileImage') ?? _profileImage;
    });
    await _safeInitAsync(() async {
      _address = await secureStorage.getStringList('ff_address') ?? _address;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
  }

  List<CategoriesStruct> _categories = [
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"images\":\"Hello World\",\"name\":\"Hello World\",\"image\":\"https://picsum.photos/seed/166/600\"}'))
  ];
  List<CategoriesStruct> get categories => _categories;
  set categories(List<CategoriesStruct> value) {
    _categories = value;
  }

  void addToCategories(CategoriesStruct value) {
    categories.add(value);
  }

  void removeFromCategories(CategoriesStruct value) {
    categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    CategoriesStruct Function(CategoriesStruct) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
  }

  void insertAtIndexInCategories(int index, CategoriesStruct value) {
    categories.insert(index, value);
  }

  List<CategoriesStruct> _category = [
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"images\":\"Hello World\",\"name\":\"Fresh\",\"image\":\"https://picsum.photos/seed/24/600\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"images\":\"Hello World\",\"name\":\"Bazaar\",\"image\":\"https://picsum.photos/seed/550/600\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"images\":\"Hello World\",\"name\":\"Electronic\",\"image\":\"https://picsum.photos/seed/832/600\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"images\":\"Hello World\",\"name\":\"Moblies\",\"image\":\"https://picsum.photos/seed/794/600\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"images\":\"Hello World\",\"name\":\"Milk\",\"image\":\"https://picsum.photos/seed/855/600\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"images\":\"Hello World\",\"name\":\"Milk Product\",\"image\":\"https://picsum.photos/seed/855/600\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"images\":\"Hello World\",\"name\":\"Fresh\",\"image\":\"https://picsum.photos/seed/855/600\"}'))
  ];
  List<CategoriesStruct> get category => _category;
  set category(List<CategoriesStruct> value) {
    _category = value;
    secureStorage.setStringList(
        'ff_category', value.map((x) => x.serialize()).toList());
  }

  void deleteCategory() {
    secureStorage.delete(key: 'ff_category');
  }

  void addToCategory(CategoriesStruct value) {
    category.add(value);
    secureStorage.setStringList(
        'ff_category', _category.map((x) => x.serialize()).toList());
  }

  void removeFromCategory(CategoriesStruct value) {
    category.remove(value);
    secureStorage.setStringList(
        'ff_category', _category.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategory(int index) {
    category.removeAt(index);
    secureStorage.setStringList(
        'ff_category', _category.map((x) => x.serialize()).toList());
  }

  void updateCategoryAtIndex(
    int index,
    CategoriesStruct Function(CategoriesStruct) updateFn,
  ) {
    category[index] = updateFn(_category[index]);
    secureStorage.setStringList(
        'ff_category', _category.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategory(int index, CategoriesStruct value) {
    category.insert(index, value);
    secureStorage.setStringList(
        'ff_category', _category.map((x) => x.serialize()).toList());
  }

  List<TopProductStruct> _products = [
    TopProductStruct.fromSerializableMap(jsonDecode(
        '{\"discount\":\"10\",\"image\":\"https://picsum.photos/seed/24/600\"}')),
    TopProductStruct.fromSerializableMap(jsonDecode(
        '{\"discount\":\"30\",\"image\":\"https://picsum.photos/seed/550/600\"}')),
    TopProductStruct.fromSerializableMap(jsonDecode(
        '{\"discount\":\"40\",\"image\":\"https://picsum.photos/seed/832/600\"}')),
    TopProductStruct.fromSerializableMap(jsonDecode(
        '{\"discount\":\"10\",\"image\":\"https://picsum.photos/seed/794/600\"}')),
    TopProductStruct.fromSerializableMap(jsonDecode(
        '{\"discount\":\"20\",\"image\":\"https://picsum.photos/seed/855/600\"}'))
  ];
  List<TopProductStruct> get products => _products;
  set products(List<TopProductStruct> value) {
    _products = value;
    secureStorage.setStringList(
        'ff_products', value.map((x) => x.serialize()).toList());
  }

  void deleteProducts() {
    secureStorage.delete(key: 'ff_products');
  }

  void addToProducts(TopProductStruct value) {
    products.add(value);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeFromProducts(TopProductStruct value) {
    products.remove(value);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProducts(int index) {
    products.removeAt(index);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void updateProductsAtIndex(
    int index,
    TopProductStruct Function(TopProductStruct) updateFn,
  ) {
    products[index] = updateFn(_products[index]);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProducts(int index, TopProductStruct value) {
    products.insert(index, value);
    secureStorage.setStringList(
        'ff_products', _products.map((x) => x.serialize()).toList());
  }

  UserStruct _users = UserStruct();
  UserStruct get users => _users;
  set users(UserStruct value) {
    _users = value;
    secureStorage.setString('ff_users', value.serialize());
  }

  void deleteUsers() {
    secureStorage.delete(key: 'ff_users');
  }

  void updateUsersStruct(Function(UserStruct) updateFn) {
    updateFn(_users);
    secureStorage.setString('ff_users', _users.serialize());
  }

  List<dynamic> _ProductSearch = [];
  List<dynamic> get ProductSearch => _ProductSearch;
  set ProductSearch(List<dynamic> value) {
    _ProductSearch = value;
  }

  void addToProductSearch(dynamic value) {
    ProductSearch.add(value);
  }

  void removeFromProductSearch(dynamic value) {
    ProductSearch.remove(value);
  }

  void removeAtIndexFromProductSearch(int index) {
    ProductSearch.removeAt(index);
  }

  void updateProductSearchAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    ProductSearch[index] = updateFn(_ProductSearch[index]);
  }

  void insertAtIndexInProductSearch(int index, dynamic value) {
    ProductSearch.insert(index, value);
  }

  bool _wishlist = false;
  bool get wishlist => _wishlist;
  set wishlist(bool value) {
    _wishlist = value;
  }

  List<bool> _wishlists = [];
  List<bool> get wishlists => _wishlists;
  set wishlists(List<bool> value) {
    _wishlists = value;
  }

  void addToWishlists(bool value) {
    wishlists.add(value);
  }

  void removeFromWishlists(bool value) {
    wishlists.remove(value);
  }

  void removeAtIndexFromWishlists(int index) {
    wishlists.removeAt(index);
  }

  void updateWishlistsAtIndex(
    int index,
    bool Function(bool) updateFn,
  ) {
    wishlists[index] = updateFn(_wishlists[index]);
  }

  void insertAtIndexInWishlists(int index, bool value) {
    wishlists.insert(index, value);
  }

  String _profileImage =
      'https://i.ibb.co/j33Xyj9/depositphotos-179308454-stock-illustration-unknown-person-silhouette-glasses-profile.webp';
  String get profileImage => _profileImage;
  set profileImage(String value) {
    _profileImage = value;
    secureStorage.setString('ff_profileImage', value);
  }

  void deleteProfileImage() {
    secureStorage.delete(key: 'ff_profileImage');
  }

  List<String> _address = ['Jaysingpur', 'Shirol', 'Kolhapur'];
  List<String> get address => _address;
  set address(List<String> value) {
    _address = value;
    secureStorage.setStringList('ff_address', value);
  }

  void deleteAddress() {
    secureStorage.delete(key: 'ff_address');
  }

  void addToAddress(String value) {
    address.add(value);
    secureStorage.setStringList('ff_address', _address);
  }

  void removeFromAddress(String value) {
    address.remove(value);
    secureStorage.setStringList('ff_address', _address);
  }

  void removeAtIndexFromAddress(int index) {
    address.removeAt(index);
    secureStorage.setStringList('ff_address', _address);
  }

  void updateAddressAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    address[index] = updateFn(_address[index]);
    secureStorage.setStringList('ff_address', _address);
  }

  void insertAtIndexInAddress(int index, String value) {
    address.insert(index, value);
    secureStorage.setStringList('ff_address', _address);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
