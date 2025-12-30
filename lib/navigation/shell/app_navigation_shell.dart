import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:myghm_mobile/core/design_system/themes/dimension.dart';
import 'package:myghm_mobile/core/design_system/themes/pallet.dart';
import 'package:myghm_mobile/navigation/widgets/bottom_nav_item.dart';

class AppNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppNavigationShell({super.key, required this.navigationShell});

  void _go(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,

      floatingActionButton: FloatingActionButton(
        onPressed: () => _go(0),
        backgroundColor: Pallet.primary,
        elevation: 4,
        child: Icon(
          Icons.fingerprint,
          size: Dimension.radius30,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(0),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.h,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          height: Dimension.height60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                icon: Icons.description,
                label: 'Form',
                isActive: navigationShell.currentIndex == 1,
                onTap: () => _go(1),
              ),
              BottomNavItem(
                icon: Icons.folder,
                label: 'Data',
                isActive: navigationShell.currentIndex == 2,
                onTap: () => _go(2),
              ),

              SizedBox(width: Dimension.width48),

              BottomNavItem(
                icon: Icons.receipt_long,
                label: 'Slip',
                isActive: navigationShell.currentIndex == 3,
                onTap: () => _go(3),
              ),
              BottomNavItem(
                icon: Icons.person,
                label: 'Profile',
                isActive: navigationShell.currentIndex == 4,
                onTap: () => _go(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
