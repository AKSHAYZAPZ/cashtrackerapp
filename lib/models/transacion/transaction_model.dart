
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/models/category/category_model.dart';
part 'transaction_model.g.dart';


@HiveType(typeId: 3)
class TransactionModel {

  @HiveField(0)
  final String purpose;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final CategoryType type;

  @HiveField(4)
  final CategoryModel category;

  @HiveField(5)
  String? id;

  TransactionModel({
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  }){
    id = DateTime.now().microsecondsSinceEpoch.toString();
  }
}
