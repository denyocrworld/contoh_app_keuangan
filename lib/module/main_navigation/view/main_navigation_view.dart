import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class MainNavigationView extends StatefulWidget {
  MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    /*
    TODO: Implement this @ controller
    int selectedIndex = 0;
    updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
    }
    */

    //Idealnya jumlahnya 4

    List<Widget> pages = [
      DashboardView(),
      Container(
        color: Colors.green[100],
      ),
      Container(
        color: Colors.blue[100],
      ),
      ProfileView(),
    ];
    List<Map<String, dynamic>> menus = [
      {
        "icon": Icons.home,
        "label": "Home",
      },
      {
        "icon": Icons.list,
        "label": "Order",
      },
      {
        "icon": Icons.favorite,
        "label": "Favorite",
      },
      {
        "icon": Icons.person,
        "label": "Profile",
      }
    ];

    return DefaultTabController(
      length: pages.length,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomAppBar(
          color: primaryColor,
          padding: const EdgeInsets.all(0.0),
          shape: CircularNotchedRectangle(), // Membuat notch
          child: Container(
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(menus.length, (index) {
                var item = menus[index];
                bool selected = index == controller.selectedIndex;
                if ((menus.length / 2).floor() == index) {}

                return Expanded(
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 400),
                    scale: selected ? 1.2 : 1.0,
                    child: IconButton(
                      onPressed: () => controller.updateIndex(index),
                      icon: Icon(
                        item["icon"],
                        color: selected
                            ? Colors.white
                            : Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        floatingActionButton: Container(
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Icon(Icons.point_of_sale),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
