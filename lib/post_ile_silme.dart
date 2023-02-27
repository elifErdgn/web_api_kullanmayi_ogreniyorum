import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'karisikVeri/kisiler.dart';
import 'karisikVeri/kisilerCevap.dart';

class SilmeIslemi extends StatefulWidget {
  const SilmeIslemi({Key? key}) : super(key: key);

  @override
  State<SilmeIslemi> createState() => _SilmeIslemiState();
}

class _SilmeIslemiState extends State<SilmeIslemi> {
  List<Kisiler> parseKisilerCevap(String cevap) {
    /*
    var jsonVeri = json.decode(cevap);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    List<Kisiler> kisilerListesi = kisilerCevap.kisilerListesi;
    */

    return KisilerCevap.fromJson(json.decode(cevap)).kisilerListesi;
  }

  Future<void> kisiSil (int kisiId) async {
    var url = Uri.parse("json_link_sil");
    var veri = {"kisi_id": kisiId.toString()};
    var cevap = await http.post(url, body: veri);
    print("Silme işlemi Cevabı: ${cevap.body}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kisiSil(554); 
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
