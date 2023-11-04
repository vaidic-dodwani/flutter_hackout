import 'package:flutter/material.dart';
import 'package:flutter_hackout/utils/constants/colors/app_colors.dart';
import 'package:flutter_hackout/utils/constants/typography_constants.dart';
import 'package:flutter_hackout/utils/constants/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Text(
                  "Hackout",
                  style: TT.f22w700.copyWith(fontSize: 48),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Login",
                  style: TT.f22w700
                      .copyWith(color: AppColors.primaryColor, fontSize: 34),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(controller: email, label: "Email ID"),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(controller: pass, label: "Password"),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.go('/dashboard');
                  },
                  child: Text(
                    "Login",
                    style: TT.f18w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
