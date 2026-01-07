import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';

import '../../../../../core/design_system/themes/dimension.dart';
import '../../../../../core/design_system/themes/textstyles.dart';
import '../../../../../core/design_system/widgets/auth/custom_textfield.dart';
import '../../../../../core/utils/validator/validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Image.asset(
                  'assets/icon/icon.png',
                  width: 200.w,
                  height: 200.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimension.width24,
                  vertical: Dimension.height32,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius32),
                    topRight: Radius.circular(Dimension.radius32),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyles.textXlBold,
                        ),

                        SizedBox(height: Dimension.height32),

                        CustomTextField(
                          controller: _nipController,
                          label: "NIP",
                          validator: (value) =>
                              MyValidatior.validateEmptyText("NIP", value),
                        ),

                        SizedBox(height: Dimension.height16),

                        CustomTextField(
                          controller: _passwordController,
                          label: "Password",
                          isPassword: true,
                          validator: (value) =>
                              MyValidatior.validatePassword(value),
                        ),
                        SizedBox(height: Dimension.height8),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Lupa password ?",
                              style: TextStyle(
                                fontSize: Dimension.style14,
                                color: Pallet.primary,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 24),

                        SizedBox(
                          height: Dimension.height48,
                          child: ElevatedButton(
                            onPressed: () {
                              context.go("/absen");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Pallet.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  Dimension.radius12,
                                ),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
