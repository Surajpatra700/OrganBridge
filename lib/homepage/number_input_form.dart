import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputForm extends StatefulWidget {
  const NumberInputForm({super.key});

  @override
  State<NumberInputForm> createState() => _NumberInputFormState();
}

class _NumberInputFormState extends State<NumberInputForm> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: "",
        filled: true,
        fillColor: Colors.indigo.shade50,
        icon: const Icon(Icons.currency_rupee_sharp),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 0, color: Colors.transparent), //<-- SEE HERE
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ], // Only numbers can be entered
    );
  }
}