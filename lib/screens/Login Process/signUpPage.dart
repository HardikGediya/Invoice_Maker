import 'package:flutter/material.dart';
import 'package:invoice_app/models/invoice_models.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? name;
  String? email;
  String? password;

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 30, right: 30),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.blueGrey.shade100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.blueGrey.shade200,
              ),
            ),
          ),

          //00416A
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(27),
                  topLeft: Radius.circular(27),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          child: const Icon(
                            Icons.close_rounded,
                            color: Colors.black,
                            size: 20,
                          ),
                          radius: 17,
                          backgroundColor: lColor,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Text(
                        'Sign up and\nmaking invoices',
                        style: TextStyle(
                          color: dColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Form(
                        key: _signInFormKey,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _nameController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your name first";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  name = val;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                controller: _emailController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your Email first";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  email = val;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Email address',
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  suffixIcon: Icon(Icons.email),
                                ),
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                obscureText: !isShow,
                                controller: _passwordController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter your Password first";
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  password = val;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                    color: Colors.blueGrey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: (isShow) ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                    onPressed: (){
                                      setState(() {
                                        isShow = !isShow;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 70),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign up',
                            style: TextStyle(
                              color: dColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Transform.scale(
                            scale: 1.1,
                            child: FloatingActionButton(
                              onPressed: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  _signInFormKey.currentState!.save();

                                  Navigator.of(context).pushNamed('readAndMovePage');

                                }
                              },
                              backgroundColor: dColor,
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 80),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed('signInPage');
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: dColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
