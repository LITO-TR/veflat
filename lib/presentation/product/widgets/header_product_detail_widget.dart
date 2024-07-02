import 'package:flutter/material.dart';
import 'package:veflat/presentation/product/widgets/custom_buttom_header_widget.dart';

class HeaderProductDetailWidget extends StatefulWidget {
  const HeaderProductDetailWidget({
    super.key,
  });
  @override
  State<HeaderProductDetailWidget> createState() =>
      _HeaderProductDetailWidgetState();
}

class _HeaderProductDetailWidgetState extends State<HeaderProductDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomHeaderButton(
              icon: Icons.arrow_back_outlined,
              onTap: () => Navigator.pop(context),
            ),
            Row(
              children: [
                CustomHeaderButton(
                  icon: Icons.favorite_border,
                  onTap: () => Navigator.pop(context),
                ),
                const SizedBox(
                  width: 12,
                ),
                CustomHeaderButton(
                  icon: Icons.ios_share_rounded,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
