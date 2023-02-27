import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'karisikVeri/kisiler.dart';
import 'karisikVeri/kisilerCevap.dart';

class VeriEkleme extends StatefulWidget {
  const VeriEkleme({Key? key}) : super(key: key);

  @override
  State<VeriEkleme> createState() => _VeriEklemeState();
}

class _VeriEklemeState extends State<VeriEkleme> {
  List<Kisiler> parseKisilerCevap(String cevap) {
    /*
    var jsonVeri = json.decode(cevap);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;
    */

    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<void> kisiEkle(String kisi_ad, String kisi_tel) async {
    var url = Uri.parse("json_link_ekleme");
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await http.post(url, body: veri);
    print("Ekle Cevap : ${cevap.body}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisiEkle("ELİF", "0554484938493"); 
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
