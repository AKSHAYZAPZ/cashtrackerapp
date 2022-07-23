import 'package:flutter/material.dart';
import 'package:money_management_app/db/category/category_db.dart';
import 'package:money_management_app/db/transaction/transaction_db.dart';
import 'package:money_management_app/models/category/category_model.dart';
import 'package:money_management_app/models/transacion/transaction_model.dart';

class ScreenAddTransactions extends StatefulWidget {
  static const routename = 'add-tranasaction';
  const ScreenAddTransactions({Key? key}) : super(key: key);

  @override
  State<ScreenAddTransactions> createState() => _ScreenAddTransactionsState();
}

class _ScreenAddTransactionsState extends State<ScreenAddTransactions> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategoryType;
  CategoryModel? _selectedCategoryModel;

  final _purposeTextEditingController = TextEditingController();
  final _amountTextEditingController = TextEditingController();

  String? _categoryID;

  @override
  void initState() {
    _selectedCategoryType = CategoryType.income;
    super.initState();
  }

  /*
  purpose
  date
  amount
  income/expense
  category type
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // purpose

              TextFormField(
                controller: _purposeTextEditingController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Puspose',
                ),
              ),

              // amount

              TextFormField(
                controller: _amountTextEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Amount',
                ),
              ),

              //Date

              TextButton.icon(
                onPressed: () async {
                  final _selectedDateTemp = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 30)),
                    lastDate: DateTime.now(),
                  );
                  if (_selectedDateTemp == null) {
                    return;
                  } else {
                    // print(_selectedDateTemp.toString());
                    setState(() {
                      _selectedDate = _selectedDateTemp;
                    });
                  }
                },
                icon: Icon(Icons.calendar_today),
                label: Text(
                  _selectedDate == null
                      ? 'Scelect Date'
                      : _selectedDate!.toString(),
                ),
              ),

              // income/expense

              Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: CategoryType.income,
                        groupValue: _selectedCategoryType,
                        onChanged: (newvalue) {
                          setState(
                            () {
                              _selectedCategoryType = CategoryType.income;
                              _categoryID = null;
                            },
                          );
                        },
                      ),
                      Text('Income'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: CategoryType.expense,
                        groupValue: _selectedCategoryType,
                        onChanged: (newvalue) {
                          setState(
                            () {
                              _selectedCategoryType = CategoryType.expense;
                              _categoryID = null;
                            },
                          );
                        },
                      ),
                      Text('Expense'),
                    ],
                  ),
                ],
              ),

              //category type
              DropdownButton<String>(
                hint: const Text('Select category'),
                value: _categoryID,
                items: (_selectedCategoryType == CategoryType.income
                        ? CategoryDB().incomeCategoryListListener
                        : CategoryDB().expenseCategoryListListener)
                    .value
                    .map((e) {
                  return DropdownMenuItem(
                    onTap: () {
                      _selectedCategoryModel = e;
                    },
                    value: e.id,
                    child: Text(e.name),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  setState(() {
                    _categoryID = selectedValue;
                  });
                },
              ),

              //Submit

              ElevatedButton(
                onPressed: () {
                  addTransaction();
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addTransaction() async {
    final _purposeText = _purposeTextEditingController.text;
    final _amountText = _amountTextEditingController.text;

    if (_purposeText.isEmpty) {
      return;
    }
    if (_amountText.isEmpty) {
      return;
    }
    // if (_categoryID == null) {
    //   return;
    // }
    if(_selectedCategoryModel==null){
      return;
    }
    if (_selectedDate == null) {
      return;
    }
    final _parsedamount = double.tryParse(_amountText);
    if(_parsedamount == null){
      return;
    }

   final _model = TransactionModel(
      purpose: _purposeText,
      amount: _parsedamount,
      date: _selectedDate!,
      type: _selectedCategoryType! ,
      category: _selectedCategoryModel!,
    );

   await TransactionDB.instance.addTransacion(_model);
   Navigator.of(context).pop();
   TransactionDB.instance.refresh();
  }
}
