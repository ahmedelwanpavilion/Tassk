import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:task/core/utils/color_resources.dart';
import 'package:task/core/utils/form_validation.dart';
import 'package:task/core/utils/image_resources.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/features/login/widgets/social_item.dart';
import '../../core/components/components.dart';
import '../../core/components/constants.dart';
import '../../core/widgets/custom_feild.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool showPassword = true;

  void changeVisibility(){
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
  listener: (context, state) {
    if (isConnect != null) checkNet(context);
  },
  builder: (context, state) {
    return Scaffold(
      body: InkWell(
        onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
        overlayColor: ColorResources.transparent,
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    Image.asset(ImageResources.splash,width: 85,height:85,),
                    Gap(size.height*.1),
                    CustomField(
                      controller: emailController,
                      hint: 'البريد الالكتروني',
                      inputType: TextInputType.emailAddress,
                      validator: FormValidation.validateFormEmail,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(ImageResources.mailIcon,width: 5,),
                      ),
                    ),
                    const Gap(15),
                    CustomField(
                      controller: passwordController,
                      hint: 'كلمة المرور',
                      inputType: TextInputType.visiblePassword,
                      validator: FormValidation.passwordValidation,
                      isPassword: showPassword,
                      suffix: IconButton(
                        icon: Icon(
                            showPassword
                                ?Icons.visibility
                                :Icons.visibility_off,color: ColorResources.kDefaultColor),
                        onPressed: changeVisibility,
                      ),
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(ImageResources.lockIcon,width: 5,),
                      ),
                    ),
                    const Gap(30),
                    CustomButton(
                        text: 'تسجيل الدخول',
                        onTouch: (){
                          if(formKey.currentState!.validate()){
                            FocusManager.instance.primaryFocus?.unfocus();
                            context.read<LoginCubit>().login(
                                context: context,
                                email: emailController.text,
                                password: passwordController.text,
                            );
                          }
                        },
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        'سجل الان',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.greenAccent
                        ),
                      ),
                    ),
                    const Gap(50),
                    Text(
                      'Or Sign With',
                    ),
                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialItem(image:ImageResources.face),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: SocialItem(image:ImageResources.apple),
                        ),
                        SocialItem(image:ImageResources.google),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
