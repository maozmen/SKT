import 'package:flutter/material.dart';
import 'package:son_kullanma_tarihi/hakkinda.dart';
import 'package:son_kullanma_tarihi/kayitekle.dart';
import 'package:son_kullanma_tarihi/kayitlar.dart';
import 'dart:core';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SKT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/kayitlar': (context) => Kayitlar(),
        '/kayitekle': (context) => KayitEkle(),
        '/hakkinda': (context) => Hakkinda(),
      },
      home: MyHomePage(title: 'SKT Ana Sayfa'),
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
            KayitGenelBakis(kayitListe: kayitListe),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Kayitlar(),
                        settings: RouteSettings(
                          arguments: kayitListe,
                        ),
                      ));
                },
                child: Text('Tüm Kayıtları Görüntüle'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
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
          Navigator.pushReplacement(
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

class KayitGenelBakis extends StatefulWidget {
  var kayitListe = [];

  KayitGenelBakis({Key key, @required this.kayitListe}) : super(key: key);

  @override
  _KayitGenelBakisState createState() => _KayitGenelBakisState();
}

class _KayitGenelBakisState extends State<KayitGenelBakis> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (widget.kayitListe.length < 1)
            ? Text('Kayıt bulunamadı', style: TextStyle(fontSize: 18))
            : KayitGoster(kayit: widget.kayitListe[0]),
        (widget.kayitListe.length < 2)
            ? Container()
            : KayitGoster(kayit: widget.kayitListe[1]),
        (widget.kayitListe.length < 3)
            ? Container()
            : KayitGoster(kayit: widget.kayitListe[2]),
      ],
    );
  }
}

class KayitGoster extends StatefulWidget {
  Kayit kayit;

  KayitGoster({Key key, @required this.kayit}) : super(key: key);

  @override
  _KayitGosterState createState() => _KayitGosterState();
}

class _KayitGosterState extends State<KayitGoster> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 6,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              widget.kayit.getIsim(),
              style: TextStyle(fontSize: 18),
            )),
      ),
      Expanded(
        flex: 4,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            TarihYazdir(widget.kayit.getSKTTarih()),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    ]);
  }
}

class Kayit {
  String _isim;
  DateTime _sKTTarih;
  DateTime _eklemeTarih;

  Kayit(String isim, DateTime tarih) {
    this._isim = isim;
    this._sKTTarih = tarih;
    this._eklemeTarih = DateTime.now();
  }

  void setIsim(String isim) {
    this._isim = isim;
  }

  String getIsim() {
    return this._isim;
  }

  void setTarih(DateTime tarih) {
    this._sKTTarih = tarih;
  }

  DateTime getSKTTarih() {
    return this._sKTTarih;
  }

  DateTime getEklemeTarih() {
    return _eklemeTarih;
  }

  KalanGun() {
    DateTime simdi = DateTime.now();
    Duration fark = simdi.difference(this._sKTTarih);
    return fark.inDays;
  }

  KalanSaat() {
    DateTime simdi = DateTime.now();
    Duration fark = simdi.difference(this._sKTTarih);
    return fark.inHours;
  }
}

String TarihYazdir(DateTime tarih) {
  return "${tarih.day.toString().padLeft(2, '0')}/${tarih.month.toString().padLeft(2, '0')}/${tarih.year.toString()}";
}
