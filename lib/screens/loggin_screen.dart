import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sesion9/providers/provider_login.dart';
import 'package:sesion9/routes/route.dart';
import 'package:sesion9/services/services_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: GestureDetector(
          /// para que se oculte el teclado luego de seleccionar otra parte de la pantalla
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_ktwnwv5m.json',
                    width: 300),
                ChangeNotifierProvider(
                  create: (context) => ProviderLogin(),
                  child: _LogginForm(),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.rRegistro);
                    },
                    child: const Text(
                      'Registrarme',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LogginForm extends StatefulWidget {
  @override
  State<_LogginForm> createState() => __LogginFormState();
}

class __LogginFormState extends State<_LogginForm> {
  bool ocultarPassword = true;
  void _viewPassword() {
    setState(() {
      ocultarPassword = !ocultarPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<ProviderLogin>(context);

    return SizedBox(
      child: Form(
          key: login.formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textFormdecorationLoggin(
                      hintText: 'dev@ucsm.edu.pe',
                      prefIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      )),
                  onChanged: (value) => login.email = value,
                  validator: (value) {
                    String caracteres =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(caracteres);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'Correo No valido';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  autocorrect: false,
                  obscureText: ocultarPassword,
                  keyboardType: TextInputType.text,
                  decoration: textFormdecorationLoggin(
                      hintText: '********',
                      prefIcon: const Icon(
                        Icons.key,
                        color: Colors.grey,
                      ),
                      sufixIcon: InkWell(
                        ////para manejar lo del ojito
                        onTap: _viewPassword,
                        child: Icon(ocultarPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                  onChanged: (value) => login.password = value,
                  validator: (value) {
                    return (value != null && value.length >= 8)
                        ? null
                        : 'Debe tener minimo 8 caracteres';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  height: 40,
                  width: 220,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    disabledColor: Colors.green,
                    elevation: 1,
                    color: Colors.green,
                    onPressed: login.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();
                            final authService = Provider.of<AuthService>(
                                context,
                                listen: false);
                            if (!login.isValidForm()) {
                              return;
                            }
                            login.isLoading = true;

                            final String? errorMessage = await authService
                                .login(login.email, login.password);
                            if (errorMessage == null) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, MyRoutes.rHome);
                            } else {
                              login.isLoading = false;
                            }
                            // await Future.delayed(const Duration(seconds: 2));

                            // ignore: use_build_context_synchronously
                          },
                    child: (login.isLoading)
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('INGRESAR'),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

InputDecoration textFormdecorationLoggin(
    {final String? hintText, final Widget? prefIcon, final Widget? sufixIcon}) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.green),
        borderRadius: BorderRadius.circular(15),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: '${hintText}',
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefIcon,
      suffixIcon: sufixIcon,
      contentPadding: const EdgeInsets.all(10));
}
