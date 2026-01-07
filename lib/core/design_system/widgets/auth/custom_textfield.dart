import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/core/design_system/themes/textstyles.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _isHidden : false,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyles.textSmRegular,
        floatingLabelStyle: const TextStyle(color: Pallet.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius16),
          borderSide: const BorderSide(color: Pallet.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius16),
          borderSide: BorderSide(color: Colors.red, width: 1.5.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius16),
          borderSide: BorderSide(color: Colors.red, width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimension.radius16),
          borderSide: BorderSide(color: Pallet.primary, width: 1.5.w),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _isHidden = !_isHidden),
              )
            : null,
      ),
    );
  }
}
