import 'package:advance_notification/advance_notification.dart';

import 'package:flutter/material.dart';

class AddToCart {
  static void addToCart(bool data, BuildContext context) {
    bool contains = data;

    if (contains == true) {
      const AdvanceSnackBar(
        icon: Icon(Icons.check),
        iconPosition: IconPosition.RIGHT,
        textColor: Colors.black,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.right,
        textSize: 17.0,
        message: "با موفقیت اضافه شد ",
        mode: Mode.MODERN,
        duration: Duration(seconds: 1, milliseconds: 250),
      ).show(context);
    } else {
      const AdvanceSnackBar(
        fontWeight: FontWeight.bold,
        iconPosition: IconPosition.RIGHT,
        textSize: 17.0,
        bgColor: Colors.red,
        message: 'با موفقیت از سبد خرید حذف شد',
        mode: Mode.MODERN,
        duration: Duration(seconds: 1, milliseconds: 250),
      ).show(context);
    }
  }
}
