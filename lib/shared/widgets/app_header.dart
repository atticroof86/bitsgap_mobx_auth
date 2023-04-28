import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) =>
      SvgPicture.asset('assets/path/header${Theme.of(context).brightness == Brightness.dark ? '_dark' : ''}.svg',
          width: MediaQuery.of(context).size.width);
}
