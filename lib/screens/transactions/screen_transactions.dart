import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/db/transaction/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transacion/transaction_model.dart';

class Screentransactions extends StatelessWidget {
  const Screentransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
      builder: (BuildContext ctx, List<TransactionModel> newList, Widget? _) {
        return ListView.separated(
            padding: const EdgeInsets.all(7),
            ///values
            itemBuilder: (ctx, index) {
              final _value = newList[index];
              return Slidable(
                key: Key(_value.id!),
                  startActionPane: ActionPane(
                    motion: ScrollMotion(),
                     children: [
                      SlidableAction(onPressed: (ctx){
                        TransactionDB.instance.deleteTransaction(_value.id!);
                      },
                      icon: Icons.delete,
                      label: 'Delete',
                      backgroundColor:  Colors.red,
                      foregroundColor: Colors.white,
                      )
                     ]),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _value.type == CategoryType.income
                          ? Colors.green
                          : Colors.red,
                      radius: 50,
                      child: Text(
                        parseDate(_value.date),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    title: Text('Rs ${_value.amount}'),
                    subtitle: Text(_value.category.name),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(height: 2);
            },
            itemCount: newList.length);
      },
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitedDate = _date.split(' ');
    return '${_splitedDate.last}\n${_splitedDate.first}';
//   return '${date.day}\n${date.month}';
  }
}
