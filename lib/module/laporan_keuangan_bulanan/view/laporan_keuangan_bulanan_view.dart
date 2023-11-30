
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/laporan_keuangan_bulanan_controller.dart';

class LaporanKeuanganBulananView extends StatefulWidget {
  const LaporanKeuanganBulananView({Key? key}) : super(key: key);

  Widget build(context, LaporanKeuanganBulananController controller) {
  controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("LaporanKeuanganBulanan"),
        actions: const [],
        ),
        body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: const [],
            ),
        ),
      ),
    );
  }

  @override
  State<LaporanKeuanganBulananView> createState() => LaporanKeuanganBulananController();
}
    