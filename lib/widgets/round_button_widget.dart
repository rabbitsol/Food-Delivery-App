import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/model/app_colors.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget(
      {super.key,
      required this.title,
      required this.onpres,
      this.loading = false});
  final String title;
  final VoidCallback onpres;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpres,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.red, borderRadius: BorderRadius.circular(40)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3, color: Colors.white)
                : Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}
