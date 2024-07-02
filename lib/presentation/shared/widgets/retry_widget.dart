import 'package:flutter/material.dart';
import 'package:veflat/config/theme/colors_custom.dart';

class RetryWidget extends StatelessWidget {
  final String errorMessage;
  final void Function()? onPressed;
  const RetryWidget({super.key, this.onPressed, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsCustom.primaryBlack,
              foregroundColor: Colors.black,
            ),
            onPressed: onPressed,
            child: const Text("Reintentar"),
          )
        ],
      ),
    );
  }
}
