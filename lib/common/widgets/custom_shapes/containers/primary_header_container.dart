import 'package:flutter/cupertino.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:online_shop/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(child: Container(
      color: TColors.primary,
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(top: -150, right: -250, child: TRoundedContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),)),
          Positioned(top: 100, right: -300, child: TRoundedContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),)),
          child,
        ],
      ),

    ),);
  }
}
