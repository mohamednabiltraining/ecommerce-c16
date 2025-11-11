import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/main_text_field.dart';
import 'package:ecommerce_app/core/widget/validators.dart';
import 'package:ecommerce_app/features/auth/data/auth_repo_impl/auth_repo_impl.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/auth_remote_data_source/auth_remote_data_source_impl.dart';
import 'package:ecommerce_app/features/auth/domain/auth_repository/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/usecasae/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../view_model/login_view_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'abdalla90@gmail.com');
  final _passwordController = TextEditingController(text: 'Abdalla1@gmail.com');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final viewModel = context.read<LoginViewModel>();
      viewModel.login(_emailController.text.trim(), _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(
        LoginUseCase(AuthRepoImpl(AuthRemoteDataSourceImpl())),
      ),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Consumer<LoginViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.state == LoginState.success) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.mainRoute,
                      (route) => false,
                    );
                  });
                }

                if (viewModel.state == LoginState.error &&
                    viewModel.errorMessage != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(viewModel.errorMessage!),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
                }

                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSize.s40.h),
                        Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                        SizedBox(height: AppSize.s40.h),
                        Text(
                          'Welcome Back To Route',
                          style: getBoldStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s24.sp),
                        ),
                        Text(
                          'Please sign in with your mail',
                          style: getLightStyle(
                            color: ColorManager.white,
                          ).copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(height: AppSize.s50.h),
                        BuildTextField(
                          controller: _emailController,
                          backgroundColor: ColorManager.white,
                          hint: 'enter your name',
                          label: 'User name',
                          textInputType: TextInputType.emailAddress,
                          validation: AppValidators.validateEmail,
                        ),
                        SizedBox(height: AppSize.s28.h),
                        BuildTextField(
                          controller: _passwordController,
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'Password',
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: AppSize.s8.h),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forget password?',
                                style: getMediumStyle(
                                  color: ColorManager.white,
                                ).copyWith(fontSize: FontSize.s18.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSize.s60.h),
                        Center(
                          child: SizedBox(
                            child: CustomElevatedButton(
                              isStadiumBorder: false,
                              label: viewModel.isLoading
                                  ? 'Loading...'
                                  : 'Login',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s18,
                              ),
                              onTap: viewModel.isLoading
                                  ? () {}
                                  : () => _handleLogin(context),
                            ),
                          ),
                        ),

                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: getSemiBoldStyle(
                                color: ColorManager.white,
                              ).copyWith(fontSize: FontSize.s16.sp),
                            ),
                            SizedBox(width: AppSize.s8.w),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.signUpRoute,
                              ),
                              child: Text(
                                'Create Account',
                                style: getSemiBoldStyle(
                                  color: ColorManager.white,
                                ).copyWith(fontSize: FontSize.s16.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
