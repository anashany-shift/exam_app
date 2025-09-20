import 'package:exam_app/core/models/button_model.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/utils/app_assets.dart';
import 'package:exam_app/core/utils/app_colors.dart';
import 'package:exam_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, this.text="time out"} );
  final String text ;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 16,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // الصورة
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
            AppAssets.sandClock,
           
          ),

          // النص
           Text(
            text,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.red,
            ),
            textAlign: TextAlign.center,
          ),

            ],
          ),
          const SizedBox(height: 24),

          // الزرار
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              buttonModel: ButtonModel(
                text: "View score",
                onPressed: () {

                Navigator.pushNamed(context,Routes.examScore);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
