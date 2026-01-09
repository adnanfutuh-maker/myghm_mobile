import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/themes/dimension.dart';
import '../../../../core/design_system/themes/pallet.dart';
import '../../../../core/design_system/widgets/appbar/custom_appbar.dart';
import '../bloc/profile_image_bloc.dart';
import '../bloc/profile_image_state.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  static const _bgColor = Color(0xFFF5F6FA);
  static const _cardColor = Colors.white;
  static const _borderColor = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: CustomAppbar(
        title: "Data Pribadi",
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: Dimension.radius36),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _profileHeader(),
          const SizedBox(height: 16),

          _section(
            title: "Data Identitas",
            children: [
              _gridItem("NIP", "3175031804071002"),
              _gridItem("No KTP", "3175031804071002"),
              _gridItem("No KK", "3175031804071002"),
              _gridItem("NPWP", "-"),
              _gridItem("Tempat Lahir", "Jakarta"),
              _gridItem("Tanggal Lahir", "18 April 2007"),
              _gridItem("Jenis Kelamin", "Laki-laki"),
              _gridItem("Agama", "-"),
            ],
          ),

          _section(
            title: "Data Pekerjaan",
            children: [
              _gridItem("Project", "PT. Grha Humanindo Manajemen"),
              _gridItem("Area", "Kantor Pusat"),
              _gridItem("Lokasi", "Divisi IT"),
              _gridItem("Unit Kerja", "-"),
              _gridItem("Jabatan", "Staff IT"),
            ],
          ),

          _section(
            title: "Alamat",
            children: const [
              _FullItem(
                "Alamat KTP",
                "Perum VGH Jln Sunan Gresik 3 Blok J6 No.32A RT 002 RW 036",
              ),
              _FullItem("Alamat Domisili", "Sama dengan alamat KTP"),
            ],
          ),

          _section(
            title: "Kontak",
            children: [
              _gridItem("Email", "rizki@email.com"),
              _gridItem("No HP", "08xxxxxxxx"),
              _gridItem("Telepon", "-"),
            ],
          ),

          _section(
            title: "Data Fisik",
            children: [
              _gridItem("Tinggi Badan", "170 cm"),
              _gridItem("Berat Badan", "60 kg"),
              _gridItem("Ukuran Baju", "L"),
              _gridItem("Ukuran Celana", "32"),
              _gridItem("No Sepatu", "42"),
            ],
          ),

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
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileHeader() {
    return Card(
      color: _cardColor,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: _borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            BlocBuilder<ProfileImageBloc, ProfileImageState>(
              builder: (context, state) {
                File? image;

                state.whenOrNull(success: (file) => image = file);

                return CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.amber.shade100,
                  backgroundImage: image != null ? FileImage(image!) : null,
                  child: image == null
                      ? const Text(
                          'A',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        )
                      : null,
                );
              },
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Rizki Adnan Futuh",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "Staff IT • Divisi IT",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _section({required String title, required List<Widget> children}) {
    return Card(
      color: _cardColor,
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: _borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(runSpacing: 16, spacing: 16, children: children),
          ],
        ),
      ),
    );
  }

  static Widget _gridItem(String label, String value) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _FullItem extends StatelessWidget {
  final String label;
  final String value;

  const _FullItem(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
