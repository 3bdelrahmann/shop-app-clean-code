import '../enums/enums.dart';

extension NavBarItemsX on NavBarItems {
  String get name {
    switch (this) {
      case NavBarItems.home:
        return 'Home';
      case NavBarItems.cart:
        return 'Cart';
    }
  }

  int get value {
    switch (this) {
      case NavBarItems.home:
        return 0;
      case NavBarItems.cart:
        return 1;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
