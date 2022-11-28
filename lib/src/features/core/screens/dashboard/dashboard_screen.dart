import 'package:catalogo_app/src/constants/colors.dart';
import 'package:catalogo_app/src/features/core/controllers/dashboard_controller.dart';
import 'package:catalogo_app/src/features/core/screens/my_catalogs_screen/my_catalogs_screen.dart';
import 'package:catalogo_app/src/features/core/screens/read_catalog/read_catalog.dart';
import 'package:catalogo_app/src/features/core/screens/saved_catalogs_screen/saved_catalogs_screen.dart';
import 'package:flutter/material.dart';
import 'package:catalogo_app/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class Dashboard extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController());
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark; //Dark mode


    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(isDark: isDark,),
        body:  Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children:  const [
              SavedCatalogsScreen(),
              QRViewExample(),
              MyCatalogsScreen()
            ],
          ),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
          backgroundColor: tPrimaryColor,
          unselectedItemColor: Colors.white38,
          selectedItemColor: tWhiteColor,
          onTap: (index) {
            controller.changeTabIndex(index);
          },
          currentIndex: controller.tabIndex.value,
          items: [
            _bottomNavigationBarItem(Icons.save, "Guardados"),
            _bottomNavigationBarItem(Icons.qr_code, "Leer Catálogo"),
            _bottomNavigationBarItem(Icons.library_books, "Mis Catálogos"),
          ],),
      ),
      ),
    );
  }

  _bottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(icon),
        label: label);
  }


}






