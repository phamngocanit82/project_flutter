import 'package:flutter/material.dart';
import '../../utils/utils_device.dart';
import '../../constants.dart';

class MenuCategoryWidget extends StatelessWidget {
  final String? name;
  final int? indexSelected;
  final int? index;
  const MenuCategoryWidget(
      {Key? key,
      this.index,
      this.indexSelected,
      this.name,
      this.onClicked,
      this.callbackOnClicked})
      : super(key: key);
  final Function(int)? onClicked;
  final VoidCallback? callbackOnClicked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: GestureDetector(
        child: Text(
          name!,
          style: TextStyle(
              fontSize: 13 * UtilsDevice.shared.ratio,
              fontWeight: FontWeight.w600,
              color: index == indexSelected
                  ? colorMenuCategory
                  : colorCategoryTitle),
        ),
        onTap: () {
          callbackOnClicked!();
          onClicked!(index!);
        },
      ),
    );
  }
}
