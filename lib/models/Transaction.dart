class Transaction{
  String title;//ชื่อรายการ
  double amount;//จำนวนเงิน
  DateTime  date;//วันที่ เวลา บันทึกรายการ

  Transaction({required this.title,required this.amount,required this.date});
}