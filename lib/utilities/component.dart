import 'package:flutter/material.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';

Row buildTitle() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text('meet', style: textStyleLogoAppBar),
      Text('campus', style: textStyleLogoAppBar2),
    ],
  );
}
