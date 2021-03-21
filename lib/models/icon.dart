import 'package:flutter/material.dart';

class IconB {
  final IconData iconData;
  final Function onPressed;

  IconB({
    @required this.iconData,
    @required this.onPressed,
  });

  static List<IconB> get items => [
        IconB(
          iconData: Icons.keyboard_arrow_left_rounded,
          onPressed: () {},
        ),
        IconB(
          iconData: Icons.cast_sharp,
          onPressed: () {},
        ),
        IconB(
          iconData: Icons.star_rate,
          onPressed: () {},
        ),
        IconB(
          iconData: Icons.more_vert,
          onPressed: () {},
        ),
      ];
}
