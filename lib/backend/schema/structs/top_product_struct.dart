// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopProductStruct extends BaseStruct {
  TopProductStruct({
    int? discount,
    String? image,
  })  : _discount = discount,
        _image = image;

  // "discount" field.
  int? _discount;
  int get discount => _discount ?? 0;
  set discount(int? val) => _discount = val;

  void incrementDiscount(int amount) => discount = discount + amount;

  bool hasDiscount() => _discount != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static TopProductStruct fromMap(Map<String, dynamic> data) =>
      TopProductStruct(
        discount: castToType<int>(data['discount']),
        image: data['image'] as String?,
      );

  static TopProductStruct? maybeFromMap(dynamic data) => data is Map
      ? TopProductStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'discount': _discount,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'discount': serializeParam(
          _discount,
          ParamType.int,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static TopProductStruct fromSerializableMap(Map<String, dynamic> data) =>
      TopProductStruct(
        discount: deserializeParam(
          data['discount'],
          ParamType.int,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TopProductStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TopProductStruct &&
        discount == other.discount &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([discount, image]);
}

TopProductStruct createTopProductStruct({
  int? discount,
  String? image,
}) =>
    TopProductStruct(
      discount: discount,
      image: image,
    );
