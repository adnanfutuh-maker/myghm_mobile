import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/core/design_system/themes/textstyles.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';

import '../../../../../core/utils/zona/indonesia_timezone_util.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';
import '../../data/models/register_data_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nipController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  bool _isPasswordHidden = true;
  bool _isRePasswordHidden = true;

  @override
  void dispose() {
    _nipController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  void _submitRegister(BuildContext blocContext) {
    final timezone = IndonesianTimezoneUtil.getTimezone();

    final data = RegisterDataModel(
      deviceId: 'device_id',
      nip: _nipController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      password: _passwordController.text,
      rePassword: _rePasswordController.text,
      timezone: timezone,
    );

    blocContext.read<RegisterBloc>().add(RegisterEvent.submit(data: data));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                    const Center(child: CircularProgressIndicator()),
              );
            },
            success: (result) {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(result.message)));
              context.go('/login');
            },
            failure: (failure) {
              Navigator.pop(context);
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(failure.message)));
            },
          );
        },
        child: Scaffold(
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
                                  controller: _nipController,
                                  decoration: _inputDecoration("NIP"),
                                ),
                                SizedBox(height: Dimension.height16),

                                TextField(
                                  controller: _emailController,
                                  decoration: _inputDecoration("Email"),
                                ),
                                SizedBox(height: Dimension.height16),

                                TextField(
                                  controller: _phoneController,
                                  decoration: _inputDecoration("No Hp"),
                                ),
                                SizedBox(height: Dimension.height16),

                                TextField(
                                  controller: _passwordController,
                                  obscureText: _isPasswordHidden,
                                  decoration: _inputDecoration("Password")
                                      .copyWith(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isPasswordHidden
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isPasswordHidden =
                                                  !_isPasswordHidden;
                                            });
                                          },
                                        ),
                                      ),
                                ),
                                SizedBox(height: Dimension.height16),

                                TextField(
                                  controller: _rePasswordController,
                                  obscureText: _isRePasswordHidden,
                                  decoration: _inputDecoration("RePassword")
                                      .copyWith(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _isRePasswordHidden
                                                ? Icons.visibility_off
                                                : Icons.visibility,
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
                                SizedBox(height: Dimension.height32),

                                Builder(
                                  builder: (blocContext) {
                                    return SizedBox(
                                      height: Dimension.height48,
                                      child: ElevatedButton(
                                        onPressed: () =>
                                            _submitRegister(blocContext),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Pallet.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              Dimension.radius12,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          "Register",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyles.textSmRegular,
      floatingLabelStyle: const TextStyle(color: Pallet.black),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimension.radius16),
        borderSide: const BorderSide(color: Pallet.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimension.radius16),
        borderSide: BorderSide(color: Pallet.primary, width: 1.5.w),
      ),
    );
  }
}
