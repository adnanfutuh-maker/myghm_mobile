import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/core/design_system/widgets/appbar/custom_appbar.dart';

import '../../../../../../core/design_system/themes/dimension.dart';
import '../../../../../../core/design_system/widgets/auth/custom_textfield.dart';
import '../../../../../../core/utils/validator/validation.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Reset Password",
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: Dimension.radius36),
          onPressed: () => context.pop(),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimension.width24,
            vertical: Dimension.height32,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: _passwordController,
                  label: "Password",
                  isPassword: true,
                  validator: (value) => MyValidatior.validatePassword(value),
                ),
                SizedBox(height: Dimension.height16),

                CustomTextField(
                  controller: _rePasswordController,
                  label: "RePassword",
                  isPassword: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 32),

                SizedBox(
                  height: Dimension.height48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Pallet.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimension.radius12),
                      ),
                    ),
                    child: Text(
                      "Proses",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
