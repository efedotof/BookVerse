import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ScannerInput extends StatefulWidget {
  const ScannerInput({super.key});

  @override
  State<ScannerInput> createState() => _ScannerInputState();
}

class _ScannerInputState extends State<ScannerInput> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        child: PrettyQrView.data(
        
        data: 'lorem ipsum dolor sit amet',
        decoration: const PrettyQrDecoration(
          
        ),
          ),
      ),
    );
  }
}