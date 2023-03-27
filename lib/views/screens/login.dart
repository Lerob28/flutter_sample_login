import 'package:flutter/material.dart';
import 'package:untitled/views/screens/register.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/logincontroller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color(0xff154C70),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 50),
                  child: Image.asset(
                    'assets/images/parking.jpg',
                    fit: BoxFit.cover,
                    height: 230,
                    width: 180,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.cyanAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Enter the login',
                          ),
                          controller: controller.loginfield,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please provide the login';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.cyanAccent,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Enter a Password',
                          ),
                          controller: controller.passwordfield,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please provide the correct password';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () => {
                              if (_formKey.currentState!.validate())
                                {controller.loginAPI()}
                              else
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Please feel all the fields')),
                                  )
                                }
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.limeAccent,
                              ),
                              height: 45,
                              width: 90,
                              child: const Center(
                                child: Text(
                                  'login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'don\'t have an account ?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(const RegisterScreen()),
                      child: const Text(
                        '  Register now !',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.cyanAccent,
                          decoration: TextDecoration.underline,
                        ),
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
}
