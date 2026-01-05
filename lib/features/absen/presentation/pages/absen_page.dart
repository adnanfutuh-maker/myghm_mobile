import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/design_system/themes/dimension.dart';
import '../../../../core/design_system/themes/pallet.dart';
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
        appBar: AppBar(
          backgroundColor: Pallet.primary,
          elevation: 0,
          title: Text(
            'MyGHM',
            style: TextStyle(color: Colors.black, fontSize: Dimension.style22),
          ),
        ),

        // 🔽 LISTENER KHUSUS ERROR
        body: BlocListener<AbsenBloc, AbsenState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: Column(
                      children: const [
                        Icon(Icons.error_outline, size: 48, color: Colors.red),
                        SizedBox(height: 8),
                        Text('Foto Tidak Valid', textAlign: TextAlign.center),
                      ],
                    ),
                    content: Text(message, textAlign: TextAlign.center),
                    actions: [
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('OK'),
                        ),
                      ),
                    ],
                  ),
                );
              },
              orElse: () {},
            );
          },

          // 🔽 UI UTAMA
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
                    Text(
                      'Aktifitas Terakhir Melakukan Absensi',
                      style: TextStyle(
                        fontSize: Dimension.style14,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Anda Telah Melakukan Absen Check IN pada :',
                      style: TextStyle(
                        fontSize: Dimension.style16,
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '02 January 2026 07:23:03',
                      style: TextStyle(
                        fontSize: Dimension.style16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    /// 📸 CARD AMBIL FOTO
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
                                    Icons.camera_alt_outlined,
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

                    /// 🚀 BUTTON UPLOAD
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
