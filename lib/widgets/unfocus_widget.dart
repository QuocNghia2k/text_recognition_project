import 'package:flutter/material.dart';

class UnfocusWidget extends StatefulWidget {
  final Widget child;

  const UnfocusWidget({required this.child, Key? key}) : super(key: key);

  @override
  State<UnfocusWidget> createState() => _UnfocusWidgetState();
}

class _UnfocusWidgetState extends State<UnfocusWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (primaryFocus != null) {
          primaryFocus!.unfocus();
        }
      },
      child: widget.child,
    );
  }
}
