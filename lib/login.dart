import 'package:flutter/material.dart';
import 'package:flutter_app_1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ScreenLogin extends StatefulWidget {
   const ScreenLogin({super.key});



  @override
  State<ScreenLogin> createState() => _MyWidget3State();
}

class _MyWidget3State extends State<ScreenLogin> {
    final _formKey = GlobalKey<FormState>();
  TextEditingController user=TextEditingController();
  TextEditingController passwrd=TextEditingController();
  
 @override
  Widget build(BuildContext context) {
    return  Scaffold(
        
        
    body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
        child: Form(
          key: _formKey,
          child: Column(
             mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validateEmail,
                     maxLength: 20,
                     controller: user,
                     
                    decoration: InputDecoration(
                      
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      ),  labelText: "user name",
                      hintText:  "Enter Username",
                     prefixIcon: const Icon(Icons.person),
                      suffixIcon: const Icon(Icons.verified_user),
                       helperText: "Enter Username characters",
                  ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
          
                   TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validatepass,
                     maxLength: 10,
                     controller: passwrd,
                      obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      ),
                      labelText: "Password",
                      hintText:  "Enter password",
                     prefixIcon: const Icon(Icons.key),
                      suffixIcon: const Icon(Icons.verified_user),
                   
                        
                  ),
                  ),
                   const SizedBox(
                    height: 50,
                  ),
                
                  ElevatedButton(onPressed: (){
                    checkpassword(context);
                  },
                  
                  
                   child: Text('log in',style: TextStyle(fontSize:20 ),)),
                ]
              ),
        ),
          )
    ));
          
  }
  Future<void> checkpassword(BuildContext context) async {
     String userName=user.text;
    
     String Password=passwrd.text;
     if(userName=='anus'&& Password=='123'){
      final  prefs =await SharedPreferences.getInstance();
      prefs.setBool("123", true);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
     }
      if(userName==''&& Password=='123'){
      final _errorMessage='User name  cannot be empty';
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(_errorMessage),behavior:
      SnackBarBehavior.floating,margin:  const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),));
     }
     else if(userName==''&& Password==''){
      final _errorMessage='User name or password cannot be empty';
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(_errorMessage),behavior:
      SnackBarBehavior.floating,margin:  const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),));
     }
     else{
      
      final _errorMessage='username or password does not match';
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(_errorMessage),behavior:
      SnackBarBehavior.floating,margin:  const EdgeInsets.all(10),
      duration: const Duration(seconds: 2),));
     }

}
//validate email
  String? validateEmail(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'Enter username';
    }

    return null;
  }

  String? validatepass(String? value) {
    final trimmedValue = value?.trim();

    if (trimmedValue == null || trimmedValue.isEmpty) {
      return 'Enter pass';
    }

    return null;
  }

}

