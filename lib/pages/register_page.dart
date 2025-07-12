import 'package:flutter/material.dart';
import 'package:tarea_2_1/widgets/custom_textfield.dart';
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


      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Registro exitoso!')),
      );

      Navigator.pop(context); // Volver al inicio de sesión
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Campo obligatorio';
    if (!value.endsWith('@unah.hn')) return 'Debe usar un correo institucional (@unah.hn)';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Campo requerido';
    if (value.length < 6) return 'Debe tener al menos 6 caracteres';
    if (!RegExp(r'[!@#\$&*~_+-]').hasMatch(value)) {
      return 'Debe incluir al menos un carácter especial';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                label: 'Nombre completo',
                controller: nameController,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Campo requerido' : null,
              ),

              const SizedBox(height: 20),
              CustomTextField(
                label: 'Correo institucional',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
              ),

              const SizedBox(height: 20),
              CustomTextField(
                label: 'Contraseña',
                controller: passwordController,
                obscureText: obscurePassword,
                validator: _validatePassword,
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
              
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
