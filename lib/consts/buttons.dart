import 'package:flutter/material.dart';
import 'colors.dart';

/// Utility class for managing app buttons
class ButtonsCustom {
  ButtonsCustom._();

  ///elevatedBtn default
  static ButtonStyle defaultElevatedButton = ElevatedButton.styleFrom(
    backgroundColor: ColorsApp.primary,
    foregroundColor: ColorsApp.lightYellow,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    iconColor: ColorsApp.lightYellow,
    iconAlignment: IconAlignment.start,
    iconSize: 16,
  );

  // ///default outline button
  // static ButtonStyle defaultOutlineButton = OutlinedButton.styleFrom(
  //   side: BorderSide(color: ColorsApp.disable),
  //   backgroundColor: ColorsApp.background,
  //   foregroundColor: ColorsApp.icons,
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  //   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  //   textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  //   iconColor: ColorsApp.disable,
  //   iconAlignment: IconAlignment.start,
  //   iconSize: 16,
  // );

  // ///icon btn default
  // static ButtonStyle defaultIconButton = IconButton.styleFrom(
  //   iconSize: 20,
  //   backgroundColor: ColorsApp.mainRed,
  //   foregroundColor: ColorsApp.white,
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //   padding: const EdgeInsets.all(10),
  // );

  // ///icon btn outline
  // static ButtonStyle outlineIconButton = IconButton.styleFrom(
  //   iconSize: 20,
  //   side: BorderSide(color: ColorsApp.disable),
  //   backgroundColor: ColorsApp.background,
  //   foregroundColor: ColorsApp.icons,
  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //   padding: const EdgeInsets.all(10),
  // );
}
