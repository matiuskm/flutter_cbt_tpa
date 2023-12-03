import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:cbt_tpa_app/data/models/models.dart';
import 'package:cbt_tpa_app/presentation/auth/blocs/register/register_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan email Anda';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Masukkan email yang valid';
    }
    return null;
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan nama Anda';
    }
    if (value.length < 3) {
      return 'Nama minimal 3 karakter';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan password Anda';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Text(
                      'Buat Akun',
                      style: ralewayFont32Bold,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Masukkan data diri Anda untuk mendaftar',
                      style: poppinsFont16w400,
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama',
                            style: poppinsFont16w400,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            validator: _nameValidator,
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan nama Anda',
                            ),
                            style: poppinsFont14w500Dark,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Email',
                            style: poppinsFont16w400,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: _emailValidator,
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Masukkan email Anda',
                            ),
                            style: poppinsFont14w500Dark,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Password',
                            style: poppinsFont16w400,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            obscureText: _obscureText,
                            validator: _passwordValidator,
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Masukkan password Anda',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            style: poppinsFont14w500Dark,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Konfirmasi Password',
                            style: poppinsFont16w400,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            obscureText: _obscureText,
                            validator: _passwordValidator,
                            controller: _passwordConfirmationController,
                            decoration: InputDecoration(
                              hintText: 'Masukkan password Anda',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            style: poppinsFont14w500Dark,
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                    BlocConsumer<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          success: (data) {
                            context.pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Pendaftaran berhasil"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          error: (message) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final data = RegisterRequestModel(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    passwordConfirmation:
                                        _passwordConfirmationController.text,
                                  );
                                  context
                                      .read<RegisterBloc>()
                                      .add(RegisterEvent.register(data));
                                }
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 48),
                                ),
                              ),
                              child: Text(
                                'Daftar',
                                style: poppinsFont14w600,
                              ),
                            );
                          },
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        text: 'Sudah punya akun? ',
                        style: poppinsFont14w500Dark,
                        children: [
                          TextSpan(
                            text: 'Masuk',
                            style: poppinsFont14w500Link,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
