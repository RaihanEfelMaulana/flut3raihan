import 'package:flutter/material.dart';

class getFormPage extends StatefulWidget {
  const getFormPage({super.key});

  @override
  State<getFormPage> createState() => _getFormPageState();
}

class _getFormPageState extends State<getFormPage> {
  final _globalKeyForm = GlobalKey<FormState>(); 

  String username = '';
  String email='';
  String password='';
  String confirmPassword='';

  void _signUpForm(){
    final bool? isValid=_globalKeyForm.currentState?.validate();
    if(isValid==true){
    debugPrint(email);
    debugPrint(username);
    debugPrint(password);
    debugPrint(confirmPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        alignment: Alignment.center,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _globalKeyForm,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(fontSize: 15,color: Colors.red),
                       prefixIcon: Align(widthFactor: 1.0,heightFactor: 1.0,
                        child: Icon(Icons.email),),
                      border: OutlineInputBorder(
                      borderSide: BorderSide(
                      width: 3,
                      style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(25),)
                      )
                      ),
                      validator:(value){
                        if(value==null||value.trim().isEmpty){
                          return 'Please enter your email address';
                        }
                        if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onChanged: (value) => email = value,
                    ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(fontSize: 15,color: Colors.red),
                      prefixIcon: Align(widthFactor: 1.0,heightFactor: 1.0,
                        child: Icon(Icons.people),),
                      border: OutlineInputBorder(
                      borderSide: BorderSide(
                      width: 3,
                      style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(25),)

                  )
                        ),
                      validator:(value){
                        if(value==null||value.trim().isEmpty){
                          return 'Username is required';
                        }
                        if(value.trim().length < 6){
                          return 'Username at least 6 character';
                        }
                        return null;
                      },
                      onChanged: (value) => username = value,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 15,color: Colors.red),
                      prefixIcon: Align(widthFactor: 1.0,heightFactor: 1.0,
                        child: Icon(Icons.password),),
                      border: OutlineInputBorder(
                      borderSide: BorderSide(
                      width: 3,
                      style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(25),)

                      )
                        ),obscureText: true,
                      validator:(value){
                        if(value==null||value.trim().isEmpty){
                          return 'Password is required';
                        }
                        if(value.trim().length < 8){
                          return 'Password at least 8 character';
                        }
                        return null;
                      },
                      onChanged: (value) => password = value,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: 15,color: Colors.red),
                      prefixIcon: Align(widthFactor: 1.0,heightFactor: 1.0,
                        child: Icon(Icons.password),),
                      border: OutlineInputBorder(
                      borderSide: BorderSide(
                      width: 3,
                      style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(25),)

                  )
                        ),obscureText: true,
                      validator:(value){
                        if(value==null||value.trim().isEmpty){
                          return 'Confirm Password is required';
                        }
                        if(value!=password){
                          return 'Confirm Password does not match entered Password';
                        }
                        return null;
                      },
                      onChanged: (value) => confirmPassword = value,
                  ),
                  const SizedBox(height: 30),
                  Container(alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: _signUpForm, 
                    child: const Text('Sign Up'),
                  ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}