import 'package:flutter/material.dart';

class ConnexionScreen extends StatefulWidget {
  ConnexionScreen({Key? key}) : super(key: key);

  @override
  State<ConnexionScreen> createState() => _ConnexionScreenState();
}

class _ConnexionScreenState extends State<ConnexionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitLogin() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      print('Connexion avec : $email / $password');
      // Tu peux rediriger avec : Navigator.pushNamed(context, '/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Connexion')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Adresse email", style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'exemple@email.com',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains("@")) {
                    return 'Entre une adresse valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text("Mot de passe", style: TextStyle(fontSize: 16)),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: '********',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Mot de passe trop court';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: _submitLogin,
                  child: Text("Se connecter"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
