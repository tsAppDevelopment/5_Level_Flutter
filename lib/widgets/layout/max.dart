import 'package:flutter/material.dart';

import '../../constant.dart';

class Max extends StatelessWidget {
  final Widget child;
  Max({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Spacer(),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxCardWidth),
          child: child
        ),
        Spacer()
      ],
    );
  }
}
