import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'karisikVeri/kisiler.dart';
import 'karisikVeri/kisilerCevap.dart';

class Guncellestirme extends StatefulWidget {
  const Guncellestirme({Key? key}) : super(key: key);

  @override
  State<Guncellestirme> createState() => _GuncellestirmeState();
}

class _GuncellestirmeState extends State<Guncellestirme> {
  List<Kisiler> parseKisilerCevap(String cevap) {
    /*
    var jsonVeri = json.decode(cevap);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;
    */

    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<void> kisiGuncelle(
      int kisi_id, String kisi_ad, String kisi_tel) async {
    var url = Uri.parse("json_link_guncelleme");
    var veri = {
      "kisi_id": kisi_id.toString(),
      "kisi_ad": kisi_ad,
      "kisi_tel": kisi_tel
    };
    var cevap = await http.post(url, body: veri);
    print("Guncelle Cevap : ${cevap.body}"); 
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisiGuncelle(1, "kisi_ad_yeni", "4545747587364835");
  }
  
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
