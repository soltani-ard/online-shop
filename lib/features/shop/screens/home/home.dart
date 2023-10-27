import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/primary_header_container.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(child: Container()),
          ],
        ),
      )
    );
  }
}
