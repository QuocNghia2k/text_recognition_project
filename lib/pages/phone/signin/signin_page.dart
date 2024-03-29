import 'package:firebase_auth/firebase_auth.dart';

import '../../../gen/fonts.gen.dart';
import '../../../router/router.dart';
import '../../../widgets/unfocus_widget.dart';
import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';
import '../../../enums.dart';
import '../../../resources/colors.dart';
import '../../../widgets/inkWell_wrapper.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../../../gen/assets.gen.dart';
import '../../../widgets/common_text_field.dart';

class SigninPage extends StatefulWidget {
  final SignInBloc bloc;

  const SigninPage(this.bloc);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends BaseState<SigninPage, SignInBloc> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var asset = Assets.images;
  final _formKey = GlobalKey<FormState>();
  bool isvalidate = false;

  List<Widget> listIcon = [];

  @override
  void initState() {
    super.initState();
    listIcon = [asset.svg.icFacebook.svg(), asset.svg.icTwitter.svg(), asset.svg.icGoogle.svg(), asset.svg.icApple.svg()];

    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        Navigator.pushNamed(context, Routes.main);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
    return UnfocusWidget(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return SingleChildScrollView(
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
                      InkWellWrapper(
                        margin: EdgeInsets.only(top: 100),
                        color: AppColors.primaryBlack,
                        child: Text(
                          localization.sign_in,
                          style: theme.textTheme.titleSmall?.copyWith(color: AppColors.primaryWhite, fontWeight: FontWeight.w400),
                        ),
                        onTap: _signin,
                        paddingChild: EdgeInsets.symmetric(vertical: 17, horizontal: 60),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 63, bottom: 36),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              localization.top_description,
                              textAlign: TextAlign.end,
                              style: theme.textTheme.labelSmall?.copyWith(color: AppColors.darkCharcoal),
                            ),
                            InkWellWrapper(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.signup);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text(localization.sign_up,
                                    style: theme.textTheme.labelSmall?.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future _signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  }

  @override
  SignInBloc get bloc => widget.bloc;
}
