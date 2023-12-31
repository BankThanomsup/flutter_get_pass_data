import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/Transaction.dart';

class TransactionProvider with ChangeNotifier{
  //ตัวอย่างข้อมูล
  List<Transaction> transactions = [
    Transaction(title: "หนังสือ",amount:500,date:DateTime.now()),
    Transaction(title: "เสื้อผ้า",amount:900,date:DateTime.now()),
    Transaction(title: "กางเกง",amount:400,date:DateTime.now()),
    Transaction(title: "นาฬิกา",amount:1400,date:DateTime.now())
  ];
  //ดึงข้อมูล
    List<Transaction>getTransaction(){
      return transactions;
    }
    void addTransaction(Transaction statement){
      transactions.insert(0,statement);
      //แจ้งเตือนไปที่ Cosumer
      notifyListeners();
    }
}