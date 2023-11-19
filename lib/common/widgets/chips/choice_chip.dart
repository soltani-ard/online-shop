import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:online_shop/utils/constants/colors.dart';
import 'package:online_shop/utils/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final haveColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: haveColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: haveColor
            ? TRoundedContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(text)!)
            : null,
        labelPadding: haveColor ? const EdgeInsets.all(0) : null,
        padding: haveColor ? const EdgeInsets.all(0) : null,
        shape: haveColor ? const CircleBorder() : null,
        backgroundColor: haveColor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
