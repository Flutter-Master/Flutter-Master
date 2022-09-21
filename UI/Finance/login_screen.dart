import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:urfinancelite/core/utils/navigator.dart';
import 'package:urfinancelite/core/utils/state_handler.dart';
import 'package:urfinancelite/core/utils/utils.dart';
import 'package:urfinancelite/core/widgets/custom_widgets.dart';
import 'package:urfinancelite/features/auth/provider/auth_provider.dart';
import 'package:urfinancelite/features/auth/ui/register_screen_1.dart';

import '../../../core/screens/tabs_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _signInUser() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),

            //Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: space2x),
              child: Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),

            SizedBox(height: space3x.h),

            SvgPicture.asset(
              'assets/images/svg/login.svg',
              width: double.infinity,
              height: 350.h,
            ),

            SizedBox(height: space2x.h),

            //Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: space2x),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //Email Field
                        CustomTextFormField(
                          labelText: 'Email',
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                          validator: (String? input) {
                            return input!.isEmpty ? 'Please enter Email' : null;
                          },
                        ),

                        SizedBox(height: 30.h),

                        //Password Field
                        CustomTextFormField(
                          controller: _passwordController,
                          labelText: 'Password',
                          textInputAction: TextInputAction.done,
                          onFieldSubmitted: (e) {},
                          validator: (String? input) {
                            return input!.isEmpty
                                ? 'Please enter Password'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  //Button
                  FlexibleButton(
                    text: 'Login',
                    width: double.infinity,
                    onPressed: _signInUser,
                  ),

                  SizedBox(height: 20.0.h),

                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Don't have an account? Register here",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ),

                  SizedBox(height: (20.0).h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
