import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _register() {
    if (_formKey.currentState!.validate()) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Successful!")));

      // After successful registration,
      // go back to Login Screen.
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(title: const Text("Create Account"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // SHOP EASY LOGO
              // =========================

              Center(
                child: Column(
                  children: [
                    const Icon(
                      Icons.shopping_bag,
                      size: 75,
                      color: Colors.blue,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Join ShopEasy",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Create your account and start shopping",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // =========================
              // NAME
              // =========================
              const Text(
                "Full Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: nameController,

                decoration: InputDecoration(
                  hintText: "Enter your full name",
                  prefixIcon: const Icon(Icons.person),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter your name";
                  }

                  if (value.trim().length < 3) {
                    return "Name must contain at least 3 characters";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // =========================
              // EMAIL
              // =========================
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: emailController,

                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  hintText: "Enter your email",
                  prefixIcon: const Icon(Icons.email),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  if (!value.contains("@") || !value.contains(".")) {
                    return "Please enter a valid email";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // =========================
              // PHONE NUMBER
              // =========================
              const Text(
                "Phone Number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: phoneController,

                keyboardType: TextInputType.phone,

                maxLength: 10,

                decoration: InputDecoration(
                  hintText: "Enter 10-digit phone number",
                  prefixIcon: const Icon(Icons.phone),

                  counterText: "",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone number";
                  }

                  if (value.length != 10) {
                    return "Phone number must contain 10 digits";
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Please enter numbers only";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // =========================
              // PASSWORD
              // =========================
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: passwordController,

                obscureText: !_isPasswordVisible,

                decoration: InputDecoration(
                  hintText: "Create a password",

                  prefixIcon: const Icon(Icons.lock),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password";
                  }

                  if (value.length < 6) {
                    return "Password must contain at least 6 characters";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // =========================
              // CONFIRM PASSWORD
              // =========================
              const Text(
                "Confirm Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),

              const SizedBox(height: 8),

              TextFormField(
                controller: confirmPasswordController,

                obscureText: !_isConfirmPasswordVisible,

                decoration: InputDecoration(
                  hintText: "Re-enter your password",

                  prefixIcon: const Icon(Icons.lock_outline),

                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password";
                  }

                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),

              // =========================
              // REGISTER BUTTON
              // =========================
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: _register,

                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  child: const Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =========================
              // LOGIN LINK
              // =========================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  const Text("Already have an account?"),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
