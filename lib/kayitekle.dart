import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:son_kullanma_tarihi/main.dart';

class KayitEkle extends StatefulWidget {
  @override
  _KayitEkleState createState() => _KayitEkleState();
}

class _KayitEkleState extends State<KayitEkle> {
  TextEditingController isimController = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  var kayitListe = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _KaydiEkle(BuildContext context) {
    Kayit yeniKayit = new Kayit(isimController.text, selectedDate);
    kayitListe.add(yeniKayit);
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).settings.arguments != null)
      this.kayitListe = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Ekle'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Kaydın ismi:',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: isimController,
                decoration: const InputDecoration(
                  hintText: 'Kayda isim verin',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
            Text("Son Kullanma Tarihi:"),
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Son Kullanma Tarihi Seç'),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
            ),
            ElevatedButton(
                onPressed: () => _KaydiEkle(context),
                child: Text("Kaydı Ekle")),
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
    );
  }
}
