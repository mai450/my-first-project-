import 'package:flutter/material.dart';
import 'package:fristproject/animated_list.dart';
import 'package:fristproject/register_screen.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fristproject/share/comp.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool pass=true;
  Icon ic = const Icon(Icons.visibility_off, color: Colors.deepPurple);
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final keyform = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: keyform,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: CustomPath(),
                      child: Container(
                        color: Colors.deepPurple,
                        height: height * 0.3,
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.13,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(children: [
                    MyTextFormField(
                      controller: emailcontroller,
                      text: 'Email',
                      prefixicon: Icons.email, 
                      keyboardType: TextInputType.emailAddress,
                      validator: (p0) {
                        if(p0!.isEmpty)
                        {
                          return '* required';
                        } else if (emailcontroller.text.contains('@')==false || emailcontroller.text.contains('.')==false)
                        {
                              return 'The email must contain "@" and "." ';
                        }
                        return null;
                      },
                    ),
                    
                    SizedBox(
                    height: height * 0.02,
                  ),
                   TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: pass,
                        controller: passcontroller,
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.deepPurple),
                          fillColor: const Color.fromARGB(255, 247, 241, 255),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock_outline,
                              color: Colors.deepPurple),
                          //suffixIcon: Padding(padding:EdgeInsets.only(right: 10), child: Icon(Icons.visibility_off, color: Colors.deepPurple),),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    pass = !pass;
                                    if (pass == false) {
                                      ic = const Icon(Icons.visibility,
                                          color: Colors.deepPurple);
                                    } else {
                                      ic = const Icon(Icons.visibility_off,
                                          color: Colors.deepPurple);
                                    }
                                  });
                                },
                                icon: ic),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 247, 241, 255),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                        {
                          return '* required';
                        }
                        else if (value.length < 8)
                        {
                          return 'The password is weak';
                        }
                        return null;
                        },
                      ),
                    SizedBox(
                  height: height * 0.11,
                ),
                
                ElevatedButton(
                  onPressed: () {
                    if(keyform.currentState!.validate())
                    {
                       debugPrint(emailcontroller.text);
                       debugPrint(passcontroller.text);
                       Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Animatedlist() ,));
                    }   
                },
                style:ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.deepPurple,),
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    horizontal: width*0.41,
                    vertical: height*0.02,
                  ))
                ),
                
                 child: const Text('Login' , 
                 style: TextStyle(
                  color:Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                 ),
                ),
                  SizedBox(
                  height: height * 0.019,
                ),
                OutlinedButton(onPressed: () {  
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Registerscreen() ,));
                },
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                    horizontal: width*0.38,
                    vertical: height*0.02,
                  ),),
                  side: const MaterialStatePropertyAll(BorderSide(
                    color: Colors.deepPurple,
                  )),
                ),
                 child: const Text('Register',
                 style: TextStyle(
                  color:Colors.deepPurple,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                 ),
                ),
                ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
