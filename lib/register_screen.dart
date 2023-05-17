import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailInput = TextEditingController();
  final _passwordInput = TextEditingController();
  final _passwordConfirmationInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.orangeAccent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              const Text(
                "NEW APPS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                      )
                    ]),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.email,
                      color: Colors.pink,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: TextFormField(
                        controller: _emailInput,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                      )
                    ]),
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.key,
                      color: Colors.pink,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: TextFormField(
                        controller: _passwordInput,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                      )
                    ]),
                margin: const EdgeInsets.only(top: 16, bottom: 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.key,
                      color: Colors.pink,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: TextFormField(
                        controller: _passwordConfirmationInput,
                        decoration: const InputDecoration(
                          hintText: "Confirmation Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _register(),
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.white),
                  foregroundColor: const MaterialStatePropertyAll(Colors.pink),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                child: const Text("REGISTER"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _register() async {
    if (_passwordInput.text == _passwordConfirmationInput.text) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailInput.text,
          password: _passwordInput.text,
        );
        print(credential.user!.email);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password tidak sama")),
      );
    }
  }
}
