import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class ScannerOutput extends StatefulWidget {
  const ScannerOutput({super.key});

  @override
  State<ScannerOutput> createState() => _ScannerOutputState();
}

class _ScannerOutputState extends State<ScannerOutput> {
  Result? currentResult;
  @override
  Widget build(BuildContext context) {
    return QRCodeDartScanView(
        scanInvertedQRCode: true,
        onCapture: (Result result) {
          setState(() {
            currentResult = result;
            print(currentResult);
          });
        },
        
      );
  
  }
}