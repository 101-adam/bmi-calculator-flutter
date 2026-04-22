import 'package:flutter/material.dart';
import 'calculator_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  
  final FocusNode nameFocus = FocusNode();
  final FocusNode ageFocus = FocusNode();
  
  String? gender = 'Male'; // Default selection

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    nameFocus.dispose();
    ageFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFE8FF),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.calculate, color: Color(0xFF7B61FF), size: 40),
                ),
                const SizedBox(height: 20),
                const Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Enter your details to get started',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 40),
                
                // Full Name Field
                Align(alignment: Alignment.centerLeft, child: Text('Full Name', style: TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                TextFormField(
                  controller: nameController,
                  focusNode: nameFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) => ageFocus.requestFocus(),
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    prefixIcon: const Icon(Icons.person_outline),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 20),
                
                // Age Field
                Align(alignment: Alignment.centerLeft, child: Text('Age', style: TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                TextFormField(
                  controller: ageController,
                  focusNode: ageFocus,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter your age',
                    prefixIcon: const Icon(Icons.cake_outlined),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  ),
                  validator: (value) => value!.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 20),
                
                // Gender Selection Layout
                Align(alignment: Alignment.centerLeft, child: Text('Gender', style: TextStyle(fontWeight: FontWeight.bold))),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => gender = 'Male'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: gender == 'Male' ? const Color(0xFF7B61FF) : Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: gender == 'Male' ? Colors.transparent : Colors.grey.shade300)
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.male, color: gender == 'Male' ? Colors.white : Colors.grey, size: 32),
                              Text('Male', style: TextStyle(color: gender == 'Male' ? Colors.white : Colors.grey, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => gender = 'Female'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: gender == 'Female' ? const Color.fromARGB(255, 255, 97, 231) : Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: gender == 'Female' ? Colors.transparent : Colors.grey.shade300)
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.female, color: gender == 'Female' ? Colors.white : Colors.grey, size: 32),
                              Text('Female', style: TextStyle(color: gender == 'Female' ? Colors.white : Colors.grey, fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                
                
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7B61FF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => CalculatorScreen(
                            name: nameController.text,
                            age: ageController.text,
                            gender: gender!,
                          ),
                        ));
                      }
                    },
                    child: const Text('Get Started', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}