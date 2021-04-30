import 'package:flutter/material.dart';

class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}

class _HakkindaState extends State<Hakkinda> {
  var kayitListe = [];
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).settings.arguments != null)
      this.kayitListe = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkında'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(60),
                child: Text(
                    'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından'
                    ' yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında'
                    ' 193301001 numaralı Atıf ÖZMEN tarafından 30 Nisan 2021 günü '
                    'yapılmıştır." '),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/',
                      arguments: kayitListe,
                    );
                  },
                  child: Text('Anasayfaya Dön'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
