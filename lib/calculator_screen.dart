import 'package:flutter/material.dart';
import 'dart:math';
import './result_screen.dart';


class CalculatorScreen extends StatefulWidget {
  final String name;
  final String age;
  final String gender;

  const CalculatorScreen({
    super.key,
    required this.name,
    required this.age,
    required this.gender,
  });

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _heightController = TextEditingController(text: '195');
  final _weightController = TextEditingController(text: '100');

  void _calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);
    double bmi = weight / pow(height, 2);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(bmiResult: bmi)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('BMI Calculator', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Welcome Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF1EEFF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFE2D9FF),
                    child: Icon(widget.gender == 'Male' ? Icons.male : Icons.female, color: const Color(0xFF7B61FF)),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome, ${widget.name}!', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text('${widget.gender} • ${widget.age} years old', style: const TextStyle(color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Height Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(children: [Icon(Icons.height, color: Color(0xFF7B61FF)), SizedBox(width: 8), Text('Height', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]),
                      Text('120 - 220 cm', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[50],
                      suffixText: 'cm',
                      suffixStyle: const TextStyle(color: Color(0xFF7B61FF), fontWeight: FontWeight.bold, fontSize: 18),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Weight Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(children: [Icon(Icons.fitness_center, color: Color(0xFF7B61FF)), SizedBox(width: 8), Text('Weight', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))]),
                      Text('40 - 300 kg', style: TextStyle(color: Colors.grey.shade400, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[50],
                      suffixText: 'kg',
                      suffixStyle: const TextStyle(color: Color(0xFF7B61FF), fontWeight: FontWeight.bold, fontSize: 18),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            
            // Info banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xFFFFF9E6), borderRadius: BorderRadius.circular(12)),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: Color(0xFFD4A300)),
                  SizedBox(width: 8),
                  Text('BMI = weight (kg) ÷ height² (m²)', style: TextStyle(color: Color(0xFFB38900))),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Calculate Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7B61FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                onPressed: _calculateBMI,
                icon: const Icon(Icons.calculate_outlined, color: Colors.white),
                label: const Text('Calculate BMI', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}