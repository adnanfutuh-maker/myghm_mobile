import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myghm_mobile/features/absen/presentation/widgets/error_dialog.dart';

import '../../../../core/design_system/themes/dimension.dart';
import '../../../../core/design_system/widgets/appbar/custom_appbar.dart';
import '../bloc/absen_bloc.dart';
import '../bloc/absen_event.dart';
import '../bloc/absen_state.dart';

class AbsenPage extends StatelessWidget {
  const AbsenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AbsenBloc>(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6FA),
        appBar: CustomAppbar(title: "MyGHM"),
        body: BlocListener<AbsenBloc, AbsenState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      ErrorDialog(title: 'Foto Tidak Valid', message: message),
                );
              },
              orElse: () {},
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<AbsenBloc, AbsenState>(
              builder: (context, state) {
                File? image;

                state.maybeWhen(success: (file) => image = file, orElse: () {});

                final isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );

                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade400),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aktivitas Terakhir',
                            style: TextStyle(
                              fontSize: Dimension.style14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'CHECK IN',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          /// TANGGAL
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                size: 18,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '02 January 2026',
                                style: TextStyle(
                                  fontSize: Dimension.style14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          /// JAM
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 18,
                                color: Colors.grey.shade600,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '07:23:03',
                                style: TextStyle(
                                  fontSize: Dimension.style14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// CARD FOTO
                    GestureDetector(
                      onTap: isLoading
                          ? null
                          : () {
                              context.read<AbsenBloc>().add(
                                const AbsenEvent.pickFromCamera(),
                              );
                            },
                      child: Container(
                        height: 220,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : image == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Tap untuk ambil foto absen',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                      ),
                    ),

                    const Spacer(),

                    /// BUTTON UPLOAD
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: image == null || isLoading
                            ? null
                            : () {
                                // TODO: upload API
                              },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text(
                          'PROSES UPLOAD',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
