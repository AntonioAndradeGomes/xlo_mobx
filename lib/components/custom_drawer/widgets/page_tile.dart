import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool highlighted;
  final Function onTap;

  PageTile({
    @required this.highlighted,
    @required this.iconData,
    @required this.label,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        label,
        style: TextStyle(
          color: highlighted ? Colors.purple : Colors.black54,
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.purple : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}
