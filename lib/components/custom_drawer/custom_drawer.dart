import 'package:flutter/material.dart';
import 'package:xlo_clone/components/custom_drawer/widgets/custon_drawer_header.dart';
import 'package:xlo_clone/components/custom_drawer/widgets/page_section.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(60),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Drawer(
            child: ListView(
              children: [
                CustonDrawerHeader(),
                PageSection(),
              ],
            ),
          ),
        ),
      );
}
