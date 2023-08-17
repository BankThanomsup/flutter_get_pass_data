import 'package:flutter/material.dart';
import 'package:flutter_database/models/Transaction.dart';
import 'package:flutter_database/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class Formscreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final  titleController = TextEditingController();
  final  amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                  autofocus: true,
                  controller: titleController ,
                  validator:(str){
                    //ชื่อรายการเป็นค่าว่าง
                    if(str!.isEmpty){
                      return "กรุณาป้อนชื่อรายการ";
                    } 
                    return null;

                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                  keyboardType: TextInputType.number,
                  controller: amountController,
                  validator: (str){
                        if(str!.isEmpty){
                      return "กรุณาป้อนจำนวนเงิน";
                    } 
                    if(double.parse(str)<=0){
                      return "กรุณาป้อนตัวเลขมากกว่า 0";
                    }
                    return null;
                  },
                ),
                ElevatedButton( child: Text("เพิ่มข้อมูล"),style: ElevatedButton.styleFrom(primary: Colors.purple,//backgroud
                onPrimary: Colors.white,),
                  onPressed: (){
                    if(formkey.currentState!.validate()){
                      var title =titleController.text;
                      var amount =amountController.text;
                      print(title);
                      print(amount);
                      //เตรียมข้อมูลลง Provinder
                      Transaction statement = Transaction(
                        title: title,
                        amount: double.parse(amount),
                        date: DateTime.now()

                        );
                      //เรียก Povider 
                      var provider = Provider.of<TransactionProvider>(context,listen:false);
                          provider.addTransaction(statement);
                    Navigator.pop(context);
                      
                    }
                   
                  }
                )
              ],
            ),
          ),
        ));
  }
}
