import 'package:flutter/material.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import '../../../core/design_system/themes/dimension.dart';
import '../../../core/design_system/widgets/appbar/custom_appbar.dart';

enum DataType { absensi, report, lembur, cuti, sakit, izin }

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  DataType _selected = DataType.absensi;

  static const titles = {
    DataType.absensi: 'Data Absensi',
    DataType.report: 'Data Report',
    DataType.lembur: 'Data Lembur',
    DataType.cuti: 'Data Cuti',
    DataType.sakit: 'Data Sakit',
    DataType.izin: 'Data Izin',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: CustomAppbar(title: "MyGHM"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SegmentedControl(
              selected: _selected,
              onChanged: (v) => setState(() => _selected = v),
            ),

            const SizedBox(height: 24),

            Text(
              titles[_selected]!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Data hanya tersedia 3 bulan terakhir',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_selected == DataType.absensi || _selected == DataType.lembur) {
      return ListView(
        children: const [
          DataCard(title: 'Januari 2026'),
          SizedBox(height: 12),
          DataCard(title: 'Desember 2025'),
          SizedBox(height: 12),
          DataCard(title: 'November 2025'),
        ],
      );
    }

    return const Center(
      child: Text(
        'Belum ada data',
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// ================= SEGMENTED CONTROL =================
class _SegmentedControl extends StatelessWidget {
  final DataType selected;
  final ValueChanged<DataType> onChanged;

  const _SegmentedControl({required this.selected, required this.onChanged});

  static const labels = {
    DataType.absensi: 'Absensi',
    DataType.report: 'Report',
    DataType.lembur: 'Lembur',
    DataType.cuti: 'Cuti',
    DataType.sakit: 'Sakit',
    DataType.izin: 'Izin',
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: DataType.values.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final type = DataType.values[index];
          final active = type == selected;

          return GestureDetector(
            onTap: () => onChanged(type),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active
                    ? Pallet.primary.withValues(alpha: 0.12)
                    : Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: active ? Pallet.primary : const Color(0xFFE5E7EB),
                ),
              ),
              child: Text(
                labels[type]!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: active ? Pallet.primary : const Color(0xFF64748B),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ================= DATA CARD =================
class DataCard extends StatelessWidget {
  final String title;

  const DataCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimension.radius16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimension.radius16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.35)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: Dimension.width44,
            height: Dimension.height44,
            decoration: BoxDecoration(
              color: Pallet.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(Dimension.radius12),
            ),
            child: Icon(
              Icons.calendar_month_outlined,
              color: Pallet.primary,
              size: Dimension.radius28,
            ),
          ),
          SizedBox(width: Dimension.width12),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: Dimension.style16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ),
          ),

          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(Dimension.radius16),
            child: InkWell(
              borderRadius: BorderRadius.circular(Dimension.radius16),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.download_rounded,
                  color: Pallet.grey,
                  size: Dimension.radius28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
