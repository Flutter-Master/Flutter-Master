import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:urfinancelite/core/animations/slide_animation.dart';
import 'package:urfinancelite/core/utils/utils.dart';
import 'package:urfinancelite/core/utils/validators.dart';
import 'package:urfinancelite/features/auth/ui/login_screen.dart';
import 'package:urfinancelite/features/auth/ui/register_screen_2.dart';

import '../../../core/utils/debouncer.dart';
import '../../../core/utils/navigator.dart';
import '../../../core/utils/state_handler.dart';
import '../../../core/widgets/button/flexible_button.dart';
import '../../../core/widgets/text_field/custom_text_form_field.dart';
import '../provider/auth_provider.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({Key? key}) : super(key: key);

  @override
  _RegisterScreen1State createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final debouncer = Debouncer(milliseconds: 450);

  _registerUser() {}

  @override
  void initState() {
    _usernameController.addListener(() {
      if (_usernameController.text.isEmpty) return;

      debouncer.run(() {
        //Check If username is available
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: -250, end: 0),
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 750),
              builder: (BuildContext context, double value, Widget? child) {
                return Positioned(
                  right: 0,
                  top: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SvgPicture.asset(
                      'assets/images/svg/lamp.svg',
                      height: 250.h,
                    ),
                  ),
                );
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: space2x),
                  child: TweenAnimationBuilder<int>(
                    tween: IntTween(begin: 0, end: 1),
                    duration: const Duration(milliseconds: 450),
                    builder: (BuildContext context, int value, Widget? child) {
                      return Text(
                        'Step $value/2',
                        style: Theme.of(context).textTheme.headline5,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Start your journey',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                SizedBox(height: space2x.h),
                SvgPicture.asset(
                  'assets/images/svg/register.svg',
                  width: double.infinity,
                  height: 350.h,
                  // fit: BoxFit.cover,
                ),
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
                              labelText: 'Name',
                              controller: _nameController,
                              textInputAction: TextInputAction.next,
                              validator: (e) => Validators.general(e, 'Name'),
                            ),
                            SizedBox(height: 30.h),

                            //Password Field
                            CustomTextFormField(
                              controller: _usernameController,
                              labelText: 'Username',
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (e) => _registerUser(),
                              suffix: code == '' &&
                                      errMessage.isEmpty &&
                                      _usernameController.text.isNotEmpty
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 18.sp,
                                    )
                                  : code == 'username' && errMessage.isNotEmpty
                                      ? Icon(
                                          Icons.close,
                                          color: Colors.red,
                                          size: (18).sp,
                                        )
                                      : null,
                              validator: (e) =>
                                  Validators.general(e, 'Username'),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30.h),

                      //Button
                      FlexibleButton(
                        text: 'Next',
                        width: double.infinity,
                        onPressed: _registerUser,
                      ),

                      SizedBox(height: 20.0.h),

                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Already have an account? Login Here",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
