import 'package:flutter/material.dart';
import 'package:money_management_app/screens/home/screen_home.dart';

class MoneyManagerBottomNavigation extends StatelessWidget {
  const MoneyManagerBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      builder: (BuildContext ctx, int updatedindex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 240, 22, 6),
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.blue,
          currentIndex: updatedindex,
          onTap: (newindex) {
            ScreenHome.selectedIndexNotifier.value = newindex;
          },
          items:const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'catrgory',
            ),
          ],
        );
      },
    );
  }
}
