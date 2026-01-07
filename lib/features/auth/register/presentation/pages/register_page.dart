import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/core/design_system/themes/textstyles.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import 'package:myghm_mobile/core/utils/validator/validation.dart';
import 'package:myghm_mobile/features/auth/register/presentation/widgets/register_dialog.dart';

import '../../../../../core/device/device_id/device_id.dart';
import '../../../../../core/utils/zona/indonesioa_timezone_util.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';
import '../bloc/register_state.dart';
import '../../data/models/register_data_model.dart';
import '../../../../../core/design_system/widgets/auth/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nipController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  void dispose() {
    _nipController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  void _submitRegister(BuildContext blocContext) async {
    if (!_formKey.currentState!.validate()) return;

    final registerBloc = blocContext.read<RegisterBloc>();
    final deviceIdService = GetIt.instance<DeviceId>();
    final deviceId = await deviceIdService.getDeviceId();

    final timezone = IndonesianTimezoneUtil.getTimezone();

    final data = RegisterDataModel(
      deviceId: deviceId,
      nip: _nipController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      password: _passwordController.text,
      rePassword: _rePasswordController.text,
      timezone: timezone,
    );
    registerBloc.add(RegisterEvent.submit(data: data));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          state.whenOrNull(
            noInternet: () => RegisterDialog.noInternet(context),
            serverDown: () => RegisterDialog.serverDown(context),
            dataNotFound: () => RegisterDialog.dataNotFound(context),
            success: (result) => context.go('/login'),
            failure: (failure) =>
                RegisterDialog.genericError(context, failure.message),
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
                builder: (context, scrollController) => Container(
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
                            vertical: Dimension.height16,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Register",
                                  textAlign: TextAlign.center,
                                  style: TextStyles.textXlBold,
                                ),
                                SizedBox(height: Dimension.height32),

                                CustomTextField(
                                  controller: _nipController,
                                  label: "NIP",
                                  validator: (value) =>
                                      MyValidatior.validateEmptyText(
                                        "NIP",
                                        value,
                                      ),
                                ),
                                SizedBox(height: Dimension.height16),

                                CustomTextField(
                                  controller: _emailController,
                                  label: "Email",
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) =>
                                      MyValidatior.validateEmail(value),
                                ),
                                SizedBox(height: Dimension.height16),

                                CustomTextField(
                                  controller: _phoneController,
                                  label: "No Hp",
                                  keyboardType: TextInputType.phone,
                                  validator: (value) =>
                                      MyValidatior.validatePhoneNUmber(value),
                                ),
                                SizedBox(height: Dimension.height16),

                                CustomTextField(
                                  controller: _passwordController,
                                  label: "Password",
                                  isPassword: true,
                                  validator: (value) =>
                                      MyValidatior.validatePassword(value),
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
                                SizedBox(height: Dimension.height32),

                                Builder(
                                  builder: (blocContext) => SizedBox(
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
                                  ),
                                ),
                                SizedBox(height: Dimension.height16),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
