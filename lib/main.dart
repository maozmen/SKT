import 'package:flutter/material.dart';
import 'package:son_kullanma_tarihi/hakkinda.dart';
import 'package:son_kullanma_tarihi/kayitekle.dart';
import 'dart:core';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        //'/sorular': (context) => Sorular(),
        '/kayitekle': (context) => KayitEkle(),
        '/hakkinda': (context) => Hakkinda(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var kayitListe = [];



  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).settings.arguments != null)
      this.kayitListe = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Padding(
              padding:const EdgeInsets.symmetric(vertical: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Hakkinda(),
                        settings: RouteSettings(
                          arguments: kayitListe,
                        ),
                      ));
                },
                child: Text('Tüm Kayıtlar'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Hakkinda(),
                        settings: RouteSettings(
                          arguments: kayitListe,
                        ),
                      ));
                },
                child: Text('Hakkında'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => KayitEkle(),
                settings: RouteSettings(
                  arguments: kayitListe,
                ),
              ));
        },

        tooltip: 'Kayıt Ekle',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Kayit {
  String _isim;
  DateTime _sktTarih;
  DateTime _eklemeTarih;

  Kayit(String isim, DateTime tarih) {
    this._isim = isim;
    this._sktTarih = tarih;
    this._eklemeTarih = DateTime.now();
  }

  KalanGun() {
    DateTime simdi = DateTime.now();
    Duration fark = simdi.difference(this._sktTarih);
    return fark.inDays;
  }

  KalanSaat() {
    DateTime simdi = DateTime.now();
    Duration fark = simdi.difference(this._sktTarih);
    return fark.inHours;
  }
}
