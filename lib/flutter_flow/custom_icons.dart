import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myfailediconFamily = 'Myfailedicon';
  static const String _successIconFamily = 'SuccessIcon';
  static const String _successIconsFamily = 'SuccessIcons';

  // Myfailedicon
  static const IconData kproductIcon =
      IconData(0xe803, fontFamily: _myfailediconFamily);
  static const IconData kordersIcon =
      IconData(0xe804, fontFamily: _myfailediconFamily);
  static const IconData krupeePriceListIcon =
      IconData(0xe805, fontFamily: _myfailediconFamily);
  static const IconData kchartIcon =
      IconData(0xe806, fontFamily: _myfailediconFamily);

  // SuccessIcon
  static const IconData ktrashEmpty =
      IconData(0xe800, fontFamily: _successIconFamily);
  static const IconData kdeleteForever =
      IconData(0xe801, fontFamily: _successIconFamily);

  // SuccessIcons
  static const IconData ksuccessGreenCheckMarkIcon1 =
      IconData(0xe802, fontFamily: _successIconsFamily);
}
