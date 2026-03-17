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

  String formatRupiah(double angka) {
    return "Rp ${angka.toStringAsFixed(0).replaceAllMapped(RegExp (r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]}.')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Banking"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          Icon(Icons.notifications),
          SizedBox(width: 10,)
        ],
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
                  "Halo, Iin Rosmala",
                  style:TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  "Saldo Anda",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  formatRupiah(saldo),
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
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.all(10),
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
      return InkWell(
        onTap: () {
          //contoh interaksi: Update saldo jika Transfer/Top Up di klik
          if (title == "Transfer") updateSaldo(-500000);
          if (title == "Top Up") updateSaldo(500000);
          showDialog(
            context: context,
            builder: (context){
              return Dialog(
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),          
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 50, color: Colors.blue),
                      SizedBox(height: 15),
                      Text(
                        title,
                        style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Menu berhasil dipilih"),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed:() {
                          Navigator.pop(context);
                        },
                        child: Text("OK"),
                      )
                    ],
                  ),
                ),
              );
            }
          );
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
