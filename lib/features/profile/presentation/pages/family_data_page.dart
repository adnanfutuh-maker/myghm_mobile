import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/design_system/themes/dimension.dart';
import '../../../../core/design_system/widgets/appbar/custom_appbar.dart';

class FamilyDataPage extends StatelessWidget {
  const FamilyDataPage({super.key});

  static const _bgColor = Color(0xFFF5F6FA);
  static const _cardColor = Colors.white;
  static const _borderColor = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: CustomAppbar(
        title: "Data Keluarga",
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: Dimension.radius36),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _FamilyCard(
            status: 'Ibu Kandung',
            name: 'ELIS MULYANI',
            gender: 'Perempuan',
            birthPlace: '-',
            birthDate: '-',
            kk: '-',
            nik: '-',
          ),
          _FamilyCard(
            status: 'Istri / Suami',
            name: '-',
            gender: '-',
            birthPlace: '-',
            birthDate: '-',
            kk: '-',
            nik: '-',
          ),
          _FamilyCard(
            status: 'Anak 1',
            name: '-',
            gender: '-',
            birthPlace: '-',
            birthDate: '-',
            kk: '-',
            nik: '-',
          ),
          _FamilyCard(
            status: 'Anak 2',
            name: '-',
            gender: '-',
            birthPlace: '-',
            birthDate: '-',
            kk: '-',
            nik: '-',
          ),
        ],
      ),
    );
  }
}

class _FamilyCard extends StatelessWidget {
  final String status;
  final String name;
  final String gender;
  final String birthPlace;
  final String birthDate;
  final String kk;
  final String nik;

  const _FamilyCard({
    required this.status,
    required this.name,
    required this.gender,
    required this.birthPlace,
    required this.birthDate,
    required this.kk,
    required this.nik,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: FamilyDataPage._cardColor,
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: FamilyDataPage._borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Status
            Text(
              'Status Keluarga • $status',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            _rowItem('Nama', name),
            _rowItem('Jenis Kelamin', gender),
            _rowItem('Tempat Lahir', birthPlace),
            _rowItem('Tanggal Lahir', birthDate),
            _rowItem('No. KK', kk),
            _rowItem('NIK', nik),
          ],
        ),
      ),
    );
  }

  Widget _rowItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const Text(':  '),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
