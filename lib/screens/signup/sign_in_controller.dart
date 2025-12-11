import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signin_blocs.dart';

class SignInController{

  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn(String type) async{
    try{
      if(type=="email"){
        final state = context.read<SignInBloc>().state;
        print(state.email);
        print(state.password);
        final email=state.email;
        final password=state.password;

        if(email.isEmpty){
          print("email is empty");
        }
        if(password.isEmpty){
          print("password is empty");
        }

        if(email.isNotEmpty && password.isNotEmpty){
          print("email and password is not empty");
        }





      }
    }catch(e){

    }
  }

}