import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance.ref();
  String email = '', password = '', name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(onChanged: (v) => name = v, decoration: const InputDecoration(labelText: "Full Name")),
            TextField(onChanged: (v) => email = v, decoration: const InputDecoration(labelText: "Email")),
            TextField(obscureText: true, onChanged: (v) => password = v, decoration: const InputDecoration(labelText: "Password")),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () async {
                try {
                  final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  // Link to Realtime Database
                  await _db.child("users").child(user.user!.uid).set({
                    "name": name,
                    "email": email,
                    "created_at": ServerValue.timestamp,
                  });
                  Navigator.pushNamed(context, '/home');
                } catch (e) {
                  print(e);
                }
              },
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}