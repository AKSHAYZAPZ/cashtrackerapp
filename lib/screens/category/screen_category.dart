import 'package:flutter/material.dart';
import 'package:money_management_app/screens/category/expense_category_list.dart';
import 'package:money_management_app/screens/category/income_catogery_list.dart';

class Screencategory extends StatefulWidget {
  const Screencategory({Key? key}) : super(key: key);

  @override
  State<Screencategory> createState() => _ScreencategoryState();
}

class _ScreencategoryState extends State<Screencategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: 'Income',
            ),
            Tab(
              text: 'Expense',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
             IncomeCategoryList(),
             ExpenseCatogery(),
            ],
          ),
        ),
      ],
    );
  }
}
