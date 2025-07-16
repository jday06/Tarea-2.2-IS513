import 'package:flutter/material.dart';
import 'register_page.dart';
import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 28, 151, 253),
              Color.fromARGB(255, 139, 227, 236),
              //Color.fromARGB(255, 255, 210, 61),
              Color.fromARGB(255, 253, 206, 97),
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                
                const Text(
                  'Bienvenido a nuestra app!',
                  style: TextStyle(
                    fontSize: 35,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 0, 14, 60),
                    //backgroundColor: Colors.blue,
                  ),
                ),
                Column(
                  children: [
                    Image.network(
                      "https://img.icons8.com/fluent/512/microsoft-people.png",
                      width: 250,
                      height: 250,
                    ),
        
                    Text(
                      "Inicia sesión o regístrate si no tienes una cuenta!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 0, 14, 60),
                      ),
                    ),
        
                    SizedBox(height: 100),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(200, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Bordes redondeados de 20
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterPage()),
                        );
                      },
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(color: Colors.white, fontSize: 20),
        
                      ),
                    ),
        
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(200, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Bordes redondeados de 20
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
