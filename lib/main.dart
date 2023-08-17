import 'package:flutter/material.dart';
import 'package:flutter_database/models/Transaction.dart';
import 'package:flutter_database/providers/transaction_provider.dart';
import 'package:flutter_database/screens/form_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'แอพบัญชี'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (Context) {
                    return Formscreen();
                  }));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body:Consumer (builder: (context,TransactionProvider provider,child){
          
          return ListView.builder(
            itemCount: provider.transactions.length,
            itemBuilder: (context, int index){
              Transaction data = provider.transactions[index];
              return Card(
                elevation: 5,
                margin:const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: FittedBox(
                      child: Text(data.amount.toString()),
                    ),
                  ),
                title: Text(data.title),
                subtitle: Text(data.date.toString()),
                ),
              );
            });
        }
    ));
  }
 }
        
        
  


