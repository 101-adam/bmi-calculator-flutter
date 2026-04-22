import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;

  const ResultScreen({super.key, required this.bmiResult});

  String category() {
    if (bmiResult < 18.5) return 'Underweight';
    if (bmiResult >= 18.5 && bmiResult <= 24.9) return 'Normal';
    if (bmiResult >= 25.0 && bmiResult <= 29.9) return 'Overweight';
    return 'Obese';
  }

  Color categoryColor() {
    if (bmiResult < 18.5) return Colors.blue;
    if (bmiResult >= 18.5 && bmiResult <= 24.9) return const Color(0xFF66BB6A);
    if (bmiResult >= 25.0 && bmiResult <= 29.9) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Your Result', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            
            // Score Display
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: categoryColor(), width: 8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(bmiResult.toStringAsFixed(1), style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: categoryColor())),
                    const Text('BMI', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(color: categoryColor(), borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(category(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Advice Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: const Color(0xFFF1F8F1), borderRadius: BorderRadius.circular(15)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, color: Color(0xFF66BB6A)),
                      SizedBox(width: 8),
                      Text('Advice', style: TextStyle(color: Color(0xFF66BB6A), fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text('Great job! You have a healthy body weight. Keep up the good lifestyle!', style: TextStyle(color: Colors.black54, fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Scale Legend
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('BMI Scale', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  _buildScaleRow(Colors.blue, 'Underweight', '< 18.5', false),
                  const SizedBox(height: 12),
                  _buildScaleRow(const Color(0xFF66BB6A), 'Normal', '18.5 - 24.9', true),
                  const SizedBox(height: 12),
                  _buildScaleRow(Colors.orange, 'Overweight', '25.0 - 29.9', false),
                  const SizedBox(height: 12),
                  _buildScaleRow(Colors.red, 'Obese', '≥ 30.0', false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildScaleRow(Color color, String label, String range, bool isActive) {
    return Container(
      padding: isActive ? const EdgeInsets.all(8) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: isActive ? color.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isActive ? Border.all(color: color.withOpacity(0.3)) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 5, backgroundColor: color),
              const SizedBox(width: 12),
              Text(label, style: TextStyle(fontWeight: isActive ? FontWeight.bold : FontWeight.normal, color: isActive ? color : Colors.grey.shade700)),
            ],
          ),
          Row(
            children: [
              Text(range, style: TextStyle(color: isActive ? color : Colors.grey.shade400, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
              if (isActive) ...[
                const SizedBox(width: 8),
                Icon(Icons.arrow_back, color: color, size: 16)
              ]
            ],
          )
        ],
      ),
    );
  }
}