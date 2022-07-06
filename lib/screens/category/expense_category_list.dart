import 'package:flutter/material.dart';

class ExpenseCatogery extends StatelessWidget {
  const ExpenseCatogery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((ctx, index) {
        return Card(
          child: ListTile(
            title: Text(
              'Expense Catogery $index',
            ),
            trailing: IconButton(
              onPressed: () {},
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
      itemCount: 100,
    );
  }
}
