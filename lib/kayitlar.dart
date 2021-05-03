import 'package:flutter/material.dart';
import 'package:son_kullanma_tarihi/main.dart';

class Kayitlar extends StatefulWidget {
  @override
  _KayitlarState createState() => _KayitlarState();
}

class _KayitlarState extends State<Kayitlar> {
  var kayitListe = [];

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).settings.arguments != null)
      this.kayitListe = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tüm Kayıtlar'),
      ),
      body: Column(children: [
        Expanded(
          flex: 9,
          child: ListView.builder(
            itemCount: kayitListe.length,
            itemBuilder: (context, index) {
              return KayitGoster(kayit: kayitListe[index]);
            },
          ),
        ),
        
        Expanded(
            flex: 1,
            
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child:ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/',
                    arguments: kayitListe);
              },
              child: Text('Ana Sayfa'),
            ),
            )
        )
      ]),
    );
  }
}
