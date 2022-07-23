import 'package:flutter/material.dart';
import 'package:money_management_app/screens/add%20transaction/screen_add_transactions.dart';
import 'package:money_management_app/screens/category/category_add_popup.dart';
import 'package:money_management_app/screens/category/screen_category.dart';
import 'package:money_management_app/screens/home/widgets/bottom_navigation.dart';
import 'package:money_management_app/screens/transactions/screen_transactions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    Screentransactions(),
    Screencategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('MONEY MANAGER'),
      ),
      bottomNavigationBar: const MoneyManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            Navigator.of(context).pushNamed(ScreenAddTransactions.routename);
            // print('add Transactions');
          } else {
            ShowCategoryAddPopup(context);
            // print('add category');
            // final _sample = CategoryModel(
            //   id: DateTime.now().microsecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
