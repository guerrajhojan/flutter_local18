import 'package:flutter/material.dart';
import '../../../../core/core_exports.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Column(
        children: [
          const Text(
            'Create Your Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.backgroundGreen,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Create your account to start your journey',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 32),
          const CustomTextField(
            label: 'Full Name',
            hintText: 'Enter your full name',
          ),
          const CustomTextField(
            label: 'Email',
            hintText: 'Enter your email address',
          ),
          const CustomTextField(
            label: 'Password',
            hintText: 'Enter your password',
            isPassword: true,
          ),
          Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (v) {},
                activeColor: AppColors.primaryGreen,
              ),
              const Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'I agree to the ',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'Term & Conditions',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomButton(
            label: 'Sign Up',
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have account? ", style: TextStyle(color: Colors.grey)),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: AppColors.primaryGreen,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
