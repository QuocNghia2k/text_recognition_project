import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../enums.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../../resources/resources.dart';
import '../../../utils/dialog_utils.dart';
import '../../../widgets/common_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  var asset = Assets.images;
  final _formKey = GlobalKey<FormState>();
  bool isvalidate = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  _checkValidate() {
    if (isvalidate != _formKey.currentState?.validate()) {
      setState(() {
        isvalidate = !isvalidate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    S localization = S.of(context);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: asset.svg.icArrowBack.svg(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 36, bottom: 103),
                  child: asset.png.logo.image(),
                ),
                CommonTextField(
                  textEditingController: _emailController,
                  hintText: localization.email_phone,
                  prefixIcon: asset.svg.icUser.svg(),
                  contentPadding: EdgeInsets.all(8),
                  prefixIconPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
                  textInputType: TextInputType.text,
                  inputStyle: InputStyleFontField.username,
                  onChanged: (p0) {
                    _checkValidate();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  textEditingController: _passwordController,
                  hintText: localization.password,
                  prefixIcon: asset.svg.icLock.svg(),
                  contentPadding: EdgeInsets.all(8),
                  prefixIconPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
                  textInputType: TextInputType.text,
                  isPassword: true,
                  inputStyle: InputStyleFontField.password,
                  onChanged: (p0) {
                    _checkValidate();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CommonTextField(
                  textEditingController: _confirmPasswordController,
                  hintText: "Confirm Password",
                  prefixIcon: asset.svg.icLock.svg(),
                  contentPadding: EdgeInsets.all(8),
                  prefixIconPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
                  textInputType: TextInputType.text,
                  isPassword: true,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWellWrapper(
                  color: AppColors.primaryBlack,
                  child: Text(
                    "Signup",
                    style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                  ),
                  onTap: _signup,
                  paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }

  Future _signup() async {
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      showAppDialog(
        context: context,
        errMsg: "Confirm password and password is not true",
        onConfirm: () {
          Navigator.pop(context);
        },
      );
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } on FirebaseAuthException catch (e) {
        print(e);
      }
    }
  }
}
