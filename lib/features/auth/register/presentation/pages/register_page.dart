import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/core/design_system/themes/textstyles.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordHidden = true;
  bool _isRePasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: Dimension.height40),
                Center(
                  child: Image.asset(
                    'assets/icon/icon.png',
                    width: 200.w,
                    height: 200.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.60,
            minChildSize: 0.60,
            maxChildSize: 0.80,
            snap: true,
            snapSizes: const [0.60, 0.80],
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimension.radius32),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: Dimension.height12),

                    Center(
                      child: Container(
                        width: Dimension.width48,
                        height: Dimension.height5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(
                            Dimension.radius3,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimension.width24,
                          vertical: Dimension.height32,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: TextStyles.textXlBold,
                            ),

                            SizedBox(height: Dimension.height32),

                            TextField(
                              decoration: InputDecoration(
                                labelText: "NIP",
                                labelStyle: TextStyles.textSmRegular,
                                floatingLabelStyle: const TextStyle(
                                  color: Pallet.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Pallet.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: BorderSide(
                                    color: Pallet.primary,
                                    width: 1.5.w,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: Dimension.height16),

                            TextField(
                              decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyles.textSmRegular,
                                floatingLabelStyle: const TextStyle(
                                  color: Pallet.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Pallet.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: BorderSide(
                                    color: Pallet.primary,
                                    width: 1.5.w,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: Dimension.height16),

                            TextField(
                              decoration: InputDecoration(
                                labelText: "No Hp",
                                labelStyle: TextStyles.textSmRegular,
                                floatingLabelStyle: const TextStyle(
                                  color: Pallet.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Pallet.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: BorderSide(
                                    color: Pallet.primary,
                                    width: 1.5.w,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: Dimension.height16),

                            TextField(
                              obscureText: _isPasswordHidden,
                              decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyles.textSmRegular,
                                floatingLabelStyle: const TextStyle(
                                  color: Pallet.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Pallet.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: BorderSide(
                                    color: Pallet.primary,
                                    width: 1.5.w,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: Dimension.radius24,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordHidden = !_isPasswordHidden;
                                    });
                                  },
                                ),
                              ),
                            ),

                            SizedBox(height: Dimension.height16),

                            TextField(
                              obscureText: _isRePasswordHidden,
                              decoration: InputDecoration(
                                labelText: "RePassword",
                                labelStyle: TextStyles.textSmRegular,
                                floatingLabelStyle: const TextStyle(
                                  color: Pallet.black,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: const BorderSide(
                                    color: Pallet.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    Dimension.radius16,
                                  ),
                                  borderSide: BorderSide(
                                    color: Pallet.primary,
                                    width: 1.5.w,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isRePasswordHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: Dimension.radius24,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isRePasswordHidden =
                                          !_isRePasswordHidden;
                                    });
                                  },
                                ),
                              ),
                            ),

                            SizedBox(height: 32),

                            SizedBox(
                              height: Dimension.height48,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.go("/login");
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
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: Dimension.height16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
