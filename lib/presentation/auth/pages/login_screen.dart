import 'package:cbt_tpa_app/core/assets/assets.gen.dart';
import 'package:cbt_tpa_app/core/constants/theme.dart';
import 'package:cbt_tpa_app/core/extensions/build_context_ext.dart';
import 'package:cbt_tpa_app/data/datasources/auth/auth_local_datasources.dart';
import 'package:cbt_tpa_app/data/models/models.dart';
import 'package:cbt_tpa_app/presentation/auth/blocs/login/login_bloc.dart';
import 'package:cbt_tpa_app/presentation/auth/pages/register_screen.dart';
import 'package:cbt_tpa_app/presentation/home/pages/dashboard_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
    return BlocBuilder<LoginBloc, LoginState>(
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
                    Image.asset(
                      Assets.images.logo.path,
                      height: 100,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Text(
                      'Selamat Datang',
                      style: ralewayFont32Bold,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Silahkan masuk untuk melanjutkan',
                      style: poppinsFont16w400,
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                      ? Icons.visibility_off
                                      : Icons.visibility,
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Lupa password?',
                                style: poppinsFont14w500Link,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          orElse: () {},
                          success: (data) {
                            AuthLocalDatasource().saveAuthData(data);
                            context.pushReplacement(const DashboardPage());
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login berhasil"),
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
                                  final data = LoginRequestModel(
                                      email: _emailController.text,
                                      password: _passwordController.text);
                                  context
                                      .read<LoginBloc>()
                                      .add(LoginEvent.login(data));
                                }
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  const Size(double.infinity, 48),
                                ),
                              ),
                              child: Text(
                                'Masuk',
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
                        text: 'Belum punya akun? ',
                        style: poppinsFont14w500Dark,
                        children: [
                          TextSpan(
                            text: 'Daftar',
                            style: poppinsFont14w500Link,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
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
