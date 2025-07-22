import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
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
    return Scaffold(
      appBar: AppBar(title: Text("Tell Us About You")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Your Name"),
              TextFormField(
                onSaved: (val) => name = val,
                validator: (val) => val!.isEmpty ? "Enter name" : null,
              ),
              SizedBox(height: 15),
              Text("Your Age"),
              TextFormField(
                keyboardType: TextInputType.number,
                onSaved: (val) => age = val,
                validator: (val) => val!.isEmpty ? "Enter age" : null,
              ),
              SizedBox(height: 15),
              Text("Gender"),
              DropdownButtonFormField(
                items: ["Male", "Female", "Other"].map((String gender) {
                  return DropdownMenuItem(value: gender, child: Text(gender));
                }).toList(),
                onChanged: (val) => gender = val as String?,
                validator: (val) => val == null ? "Select gender" : null,
              ),
              SizedBox(height: 15),
              Text("What would you like to focus on?"),
              DropdownButtonFormField(
                items: [
                  "Stress",
                  "Anxiety",
                  "Depression",
                  "Confidence",
                  "Sleep"
                ].map((String focus) {
                  return DropdownMenuItem(value: focus, child: Text(focus));
                }).toList(),
                onChanged: (val) => focus = val as String?,
                validator: (val) => val == null ? "Select focus area" : null,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveDetails,
                child: Text("Continue"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
