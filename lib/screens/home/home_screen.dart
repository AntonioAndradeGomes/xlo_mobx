import 'package:flutter/material.dart';
import 'package:xlo_clone/components/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(),
        ),
      );
}
