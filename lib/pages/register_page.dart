import 'package:flutter/material.dart';
//import 'package:tarea_2_1/widgets/custom_textfield.dart';
import 'package:tarea_2_1/data/user_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;

  void _register() {
    if (_formKey.currentState!.validate()) {
      UserData.registerUser(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('¡Registro exitoso!')));

      Navigator.pop(context); // Volver al inicio de sesión
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Campo obligatorio';
    if (!value.endsWith('@unah.hn') || value == "@unah.hn")
      return 'Ingresa un correo institucional valido';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Campo requerido';
    if (value.length < 6) return 'Debe tener al menos 6 caracteres';
    if (!RegExp(r'[!@#$&*~_+-]').hasMatch(value)) {
      return 'Debe incluir al menos un carácter especial';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(22),
                  label: Text("Ingrese su nombre completo"),
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Ingrese su nombre",
                  suffixIcon: Icon(Icons.person_2_outlined),
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                validator: _validateEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(22),
                  label: Text("Ingresa tu correo constitucional"),
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15),
                  hintText: "Ingresa tu correo",
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
                  labelStyle: TextStyle(color: Colors.black, fontSize: 15),
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

              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: _register,
                child: const Text(
                  'Registrar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 100),
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
