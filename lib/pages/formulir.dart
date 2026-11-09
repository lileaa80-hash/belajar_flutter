import 'package:flutter/material.dart';

class Formulir extends StatefulWidget {
  const Formulir({super.key});

  @override
  State<Formulir> createState() => _FormulirState();
}

class _FormulirState extends State<Formulir> {
  // Global key formulir
  final _formKey = GlobalKey<FormState>();

  // Controller nama lengkap
  final TextEditingController _nameController =
      TextEditingController();

  // Controller username dan password
  final TextEditingController _usernameController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  // Controller email dan phone
  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _phoneController =
      TextEditingController();

  // Controller Clear Input
  final TextEditingController _inputController =
      TextEditingController();

  // Output nama
  String _OutputName = '';

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _inputController.dispose();

    super.dispose();
  }

  // Get Name
  void _getName() {
    print('Name: ${_nameController.text}');
  }

  // Submit nama lengkap
  void _submitForm() {
    print('Nama Lengkap: ${_nameController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Nama Lengkap: ${_nameController.text}',
        ),
      ),
    );

    setState(() {
      _OutputName = _nameController.text;
    });
  }

  // Submit Login
  void _submitLogin() {
    print('Username: ${_usernameController.text}');
    print('Password: ${_passwordController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Processing Login Data'),
      ),
    );
  }

  // Get Email dan Phone
  void _getData() {
    print('Email: ${_emailController.text}');
    print('Phone: ${_phoneController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Email: ${_emailController.text}, '
          'Phone: ${_phoneController.text}',
        ),
      ),
    );
  }

  // Clear Input
  // Clear Input
  void _clearInput() {
  setState(() {
    _inputController.clear();
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Form App'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // =========================
                    // FORM NAMA LENGKAP
                    // =========================

                    const Text(
                      'Form Nama Lengkap',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Enter your name',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: _getName,
                      child: const Text('Get Name'),
                    ),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Name: ${_OutputName.isEmpty ? "-" : _OutputName}',
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),

                    // =========================
                    // FORM LOGIN
                    // =========================

                    const Text(
                      'Login Form',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: _submitLogin,
                      child: const Text('Submit Login'),
                    ),

                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),

                    // =========================
                    // FORM EMAIL DAN PHONE
                    // =========================

                    const Text(
                      'Multi-Input Get',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 10),

                    TextFormField(
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: _getData,
                      child: const Text('Show Data'),
                    ),

                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),

                    // =========================
                    // CLEAR INPUT DEMO
                    // =========================

                    const Text(
                      'Clear Input Demo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextFormField(
                      controller: _inputController,
                      decoration: const InputDecoration(
                        labelText: 'Type here',
                        border: OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: _clearInput,
                      child: const Text('Clear Text'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}