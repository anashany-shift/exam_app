import 'package:exam_app/presentation/features/auth/forget_password/view/widgets/email_verification.dart';
import 'package:exam_app/presentation/features/auth/forget_password/view/widgets/enter_email.dart';
import 'package:exam_app/presentation/features/auth/forget_password/view/widgets/reset_pasword.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (selectedIndex < 2) {
      setState(() {
        selectedIndex++;
      });
      pageController.animateToPage(
        selectedIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void perviousPage() {
    if (selectedIndex > 0) {
      setState(() {
        selectedIndex--;
      });
      pageController.animateToPage(
        selectedIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),

              children: [
                EnterEmail(onContinue: nextPage),
                EmailVerification(onContinue: nextPage, onBack: perviousPage),
                ResetPassword(onBack: perviousPage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
