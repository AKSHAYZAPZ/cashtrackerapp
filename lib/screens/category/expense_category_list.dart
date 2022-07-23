import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/models/category/category_model.dart';

class ExpenseCatogery extends StatelessWidget {
  const ExpenseCatogery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListener,
      builder: (BuildContext ctx, List<CategoryModel> newlist, Widget? _){
       return ListView.separated(
      itemBuilder: ((ctx, index) {
        final category =newlist[index];
        return Card(
          child: ListTile(
            title: Text(
              category.name,
            ),
            trailing: IconButton(
              onPressed: () {
                 CategoryDB.instance.deleteCategory(category.id);
              },
              icon: Icon(Icons.delete),
            ),
          ),
        );
      }),
      separatorBuilder: (ctx, index) {
        return const SizedBox(
          height: 7,
        );
      },
      itemCount: newlist.length,
    );
      },
    );
  }
}
