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
  bool isSaldoVisible = true;

  void updateSaldo(double nilai) {
    setState(() {
      saldo += nilai;
    });
  }

  String formatRupiah(double angka) {
    return "Rp ${angka.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
            "Mobile Banking",
            style: TextStyle(
              fontWeight: FontWeight.bold),
            ),
           actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {},
            )
           ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Riwayat"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: "Scan"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifikasi"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
      body: Column (
        children: [
          //Card Saldo
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo, Iin Rosmala",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Saldo Anda"),
                    IconButton(
                      icon: Icon(
                        isSaldoVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 18,
                      ),
                      onPressed: () {
                        setState(() {
                          isSaldoVisible = !isSaldoVisible;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  isSaldoVisible ? formatRupiah(saldo) : "Rp ******",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "💸Kirim uang cepat",
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 12),
              ),
            ),
          ),
          SizedBox(height: 5),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text("📊Grafik saldo", style: TextStyle(fontSize: 12)),
            ),
          ),
          SizedBox(height: 8),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("🧾Transaksi Terakhir", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12),
              ),
            ),
          ),

          ListTile(
            dense: true,
            leading: Icon(Icons.arrow_upward,
            color: Colors.red, size: 18),
            title: Text("Transfer", style: TextStyle(fontSize: 12)),
            subtitle: Text("Hari Ini", style: TextStyle(fontSize: 10)),
            trailing: Text("-Rp500.000",
            style: TextStyle(fontSize: 12)),
          ),

          ListTile(
            dense: true,
            leading: Icon(Icons.arrow_downward,
            color: Colors.green, size: 18),
            title: Text("Top Up", style: TextStyle(fontSize: 12)),
            subtitle: Text("Kemarin", style: TextStyle(fontSize: 10)),
            trailing: Text("+Rp500.000",
            style: TextStyle(fontSize: 12)),
          ),

          // Grid Menu
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.6,
              padding: EdgeInsets.all(10),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children:[
                menuItem(Icons.send, "Transfer"),
                menuItem(Icons.phone_android, "Pulsa"),
                menuItem(Icons.receipt, "Tagihan"),
                menuItem(Icons.account_balance, "Top Up"),
                menuItem(Icons.credit_card, "E-Wallet"),
                menuItem(Icons.wifi, "Internet"),
             ],
            ),
          ),
        ],
      ),
    );
  }         

  Widget menuItem(IconData icon, String title) {
    return InkWell(
      onTap: () {
        //contoh interaksi: Update saldo jika Transfer/Top Up di klik
        if (title == "Transfer") updateSaldo(-500000);
        if (title == "Top Up") updateSaldo(500000);

        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 30, color: Colors.blue),
                    SizedBox(height: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Berhasil", style: TextStyle(fontSize: 12)),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)
        ),
        child: Container(
          height: 55,
          padding: EdgeInsets.all(4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24, color: Colors.blue),
              SizedBox(height: 3),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
        ),
      ),
    );
  }
}