import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name, age, gender, focus;

  void _saveDetails() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("Name: $name, Age: $age, Gender: $gender, Focus: $focus");

      Navigator.pushReplacementNamed(context, "/home");
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: color.surface,
      appBar: AppBar(
        title: const Text("Let's Get to Know You"),
        centerTitle: true,
        backgroundColor: color.tertiary,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: color.onTertiary,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        foregroundColor: color.onSurface, // title + back arrow
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel("Your Name"),
              TextFormField(
                onSaved: (val) => name = val,
                validator: (val) => val!.isEmpty ? "Enter name" : null,
                decoration: _inputDecoration("Enter your full name", color),
              ),
              const SizedBox(height: 24),

              _buildLabel("Your Age"),
              TextFormField(
                keyboardType: TextInputType.number,
                onSaved: (val) => age = val,
                validator: (val) => val!.isEmpty ? "Enter age" : null,
                decoration: _inputDecoration("e.g. 25", color),
              ),
              const SizedBox(height: 24),

              _buildLabel("Gender"),
              DropdownButtonFormField(
                items: ["Male", "Female", "Other"].map((String g) {
                  return DropdownMenuItem(value: g, child: Text(g));
                }).toList(),
                onChanged: (val) => gender = val,
                validator: (val) => val == null ? "Select gender" : null,
                decoration: _inputDecoration("Choose your gender", color),
              ),
              const SizedBox(height: 24),

              _buildLabel("Focus Area"),
              DropdownButtonFormField(
                items: [
                  "Stress",
                  "Anxiety",
                  "Depression",
                  "Confidence",
                  "Sleep",
                ].map((String f) {
                  return DropdownMenuItem(value: f, child: Text(f));
                }).toList(),
                onChanged: (val) => focus = val,
                validator: (val) => val == null ? "Select focus area" : null,
                decoration: _inputDecoration("What do you want to improve?", color),
              ),
              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveDetails,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color.tertiary,
                    foregroundColor: color.onTertiary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Label Text Styling
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    );
  }

  /// Unified Input Decoration with Theme Colors
  InputDecoration _inputDecoration(String hint, ColorScheme color) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: color.outlineVariant,
        fontSize: 13,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: color.tertiary, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
