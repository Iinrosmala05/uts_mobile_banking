import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Banking',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
    @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double saldo = 10000000;

  void updateSaldo(double nilai) {
    setState(() {
      saldo += nilai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Banking"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Container Saldo
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Saldo Anda",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Rp ${saldo.toStringAsFixed(0)}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        
          // Grid Menu
          Expanded(
            child: GridView.count(
            crossAxisCount: 3,
            children: [
               menuItem(Icons.send, "Transfer"),
               menuItem(Icons.phone_android, "pulsa"),
               menuItem(Icons.receipt, "Tagihan"),
               menuItem(Icons.account_balance, "Top Up"),
               menuItem(Icons.history, "Riwayat"),
               menuItem(Icons.settings, "Pengaturan"),
              ],
            ),
           ),
          ], 
        ),
      );
     }
     
     Widget menuItem(IconData icon, String title){
      return GestureDetector(
        onTap: () {
          //contoh interaksi: Update saldo jika Transfer/Top Up di klik
          if (title == "Transfer") updateSaldo(-500000);
          if (title == "Top Up") updateSaldo(500000);
        },
        child: Card(
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Colors.blue),
              SizedBox(height: 10),
              Text(title),
            ],
          ),
        ),
      );
     }
    }
