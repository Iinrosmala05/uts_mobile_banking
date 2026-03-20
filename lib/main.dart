import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Color(0XFFF5F7FA),

      //APPBAR
      appBar: AppBar(
        backgroundColor: Color(0xFF0D47A1),
        title: Text(
            "Mobile Banking",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              ),
            ),
           actions: [
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {},
            )
           ],
      ),

      //BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0XFF0D47A1),
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

          //CARD SALDO
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0,3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo, Iin Rosmala",
                  style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Saldo Anda", style: TextStyle(color: Colors.white)),
                    IconButton(
                      icon: Icon(
                        isSaldoVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 18,
                        color: Colors.white,
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),

          //QUICK ACTION TITLE
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Kirim uang cepat",
                style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          
          //GRAFIK
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3,
                )
              ],
            ),
            child: Center(
              child: Text("📊Grafik saldo", style: TextStyle(fontSize: 12)),
            ),
          ),
          SizedBox(height: 8),

          //TRANSAKSI
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("🧾Transaksi Terakhir",
              style:GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
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

          //GRID MENU
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 2.1,
              padding: EdgeInsets.all(8),
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              children:[
                menuItem(Icons.send, "Transfer"),
                menuItem(Icons.phone_android, "Pulsa"),
                menuItem(Icons.receipt, "Tagihan"),
                menuItem(Icons.account_balance_wallet, "Top Up"),
                menuItem(Icons.credit_card, "E-Wallet"),
                menuItem(Icons.wifi, "Internet"),
             ],
            ),
          ),
        ],
      ),
    );
  }         
  //QUICK MENU
  Widget quickMenu(IconData icon, String title){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Icon(icon, color: Color(0XFF0D47A1), size: 22),
        ),
        SizedBox(height: 4),
        Text(title, style: TextStyle(fontSize: 10)),
      ],
    );
}

  //MENU GRID
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
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 28, color: Colors.blue),
                    SizedBox(height: 6),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Berhasil", style: TextStyle(fontSize: 12)),
                    SizedBox(height: 8),
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
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)
        ),
        child: Container(
          height: 55,
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 26, color: Color(0XFF0D47A1)),
              SizedBox(height: 2),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}