import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_flutter/components/custom_suffix_icon.dart';
import 'package:shop_app_flutter/components/default_button.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  bool rememberMe = false;
  final List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20),),
          buildPasswordFormField(),
          Row(
            children: [
              Checkbox(
                  value: rememberMe,
                  activeColor: kPrimaryColor,
                  onChanged: (value){
                    setState(() {
                      rememberMe = value;
                    });
                  }
              ),
              Text("Remember me"),
              Spacer(),
              Text(
                "Forgot password",
                style: TextStyle(
                    decoration: TextDecoration.underline
                ),
              )
            ],
          ),
          FormError(errors: errors,),
          SizedBox(height: getProportionateScreenHeight(20),),
          DefaultButton(
            text: "Continue",
            press: (){
              setState(() {
                errors.clear();
              });
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildEmailFormField(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value){
        if(value.isNotEmpty){
          setState(() {
            errors.remove(kEmailNullError);
          });
        }
        if(emailValidatorRegExp.hasMatch(value)){
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value){
        if(value.isEmpty){
          setState(() {
            errors.add(kEmailNullError);
          });
        }else if(!emailValidatorRegExp.hasMatch(value)){
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg",),
      ),
    );
  }

  TextFormField buildPasswordFormField(){
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value){
        if(value.isNotEmpty){
          setState(() {
            errors.remove(kPasswordNullError);
          });
        }
        if(value.length >= 8){
          setState(() {
            errors.remove(kShortPasswordError);
          });
        }
      },
      validator: (value){
        if(value.isEmpty){
          setState(() {
            errors.add(kPasswordNullError);
          });
        }else if(value.length < 8){
          setState(() {
            errors.add(kShortPasswordError);
          });
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg",),
      ),
    );
  }
}

class FormError extends StatelessWidget {
  final List<String> errors;
  FormError({this.errors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length,
              (index) => formErrorText(
              error: errors[index]
          )
      ),
    );
  }

  Row formErrorText({String error}){
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),
        ),
        SizedBox(width: getProportionateScreenWidth(10.0),),
        Text(error)
      ],
    );
  }
}