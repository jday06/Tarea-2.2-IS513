import 'package:flutter/material.dart';
//import 'package:tarea_2_1/widgets/custom_textfield.dart';
import 'package:tarea_2_1/data/user_data.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Campo obligatorio';
    if (!value.endsWith('@unah.hn') || value == '@unah.hn') {
      return 'Ingrese un correo institucional valido';
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Campo obligatorio';
    return null;
  }

  void _login(BuildContext context) {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    bool isValidEmail = email.endsWith('@unah.hn');
    bool isValidPassword =
        password.length >= 6 && RegExp(r'[!@#\$&*~]').hasMatch(password);

    if (!isValidEmail || !isValidPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Correo o contraseña incorrectos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('¡Inicio de sesión exitoso!'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HomePage(userName: UserData.registeredName ?? "Usuario"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Iniciar Sesión',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(22),
                  label: Text("Correo Institucional"),
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  hintText: "Ingresa un correo",
                  suffixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const SizedBox(height: 50),
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                validator: _validatePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(22),
                  label: Text("Ingresa una contraseña"),
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                  hintText: "Ingresa tu contraseña",
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),

              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login(context);
                  }
                },
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 200),
              Text(
                "Lenguajes de Programacion",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
