import 'package:flutter/material.dart';
import '../../../blocs/blocs.dart';
import '../../../core/base/base.dart';
import '../../../enums.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../resources/colors.dart';
import '../../../widgets/common_widget.dart';

class RegisterPage extends StatefulWidget {
  final RegisterBloc bloc;
  RegisterPage({required this.bloc, Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterBloc> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var asset = Assets.images;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 36, bottom: 103),
              child: Text(
                'Register',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontFamily: FontFamily.montserrat,
                  color: AppColors.darkCharcoal,
                ),
              ),
            ),
            CommonTextField(
              textEditingController: _emailController,
              hintText: localization.email_phone,
              prefixIcon: asset.svg.icUser.svg(),
              contentPadding: EdgeInsets.all(8),
              prefixIconPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
              textInputType: TextInputType.text,
              inputStyle: InputStyleFontField.username,
              onChanged: (p0) {},
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
              onChanged: (p0) {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  RegisterBloc get bloc => widget.bloc;
}
