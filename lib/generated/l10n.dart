// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Hello World`
  String get hello_world {
    return Intl.message(
      'Hello World',
      name: 'hello_world',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get change_language {
    return Intl.message(
      'Change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `off`
  String get off {
    return Intl.message(
      'off',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Size`
  String get size {
    return Intl.message(
      'Size',
      name: 'size',
      desc: '',
      args: [],
    );
  }

  /// `BUY NOW`
  String get buy_now {
    return Intl.message(
      'BUY NOW',
      name: 'buy_now',
      desc: '',
      args: [],
    );
  }

  /// `Added to Cart`
  String get added_to_cart {
    return Intl.message(
      'Added to Cart',
      name: 'added_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `View bag`
  String get view_bag {
    return Intl.message(
      'View bag',
      name: 'view_bag',
      desc: '',
      args: [],
    );
  }

  /// `CHECKOUT`
  String get check_out {
    return Intl.message(
      'CHECKOUT',
      name: 'check_out',
      desc: '',
      args: [],
    );
  }

  /// `AED`
  String get aed {
    return Intl.message(
      'AED',
      name: 'aed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Email format is incorrect`
  String get email_format_is_incorrect {
    return Intl.message(
      'Email format is incorrect',
      name: 'email_format_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get invalid_password {
    return Intl.message(
      'Invalid password',
      name: 'invalid_password',
      desc: '',
      args: [],
    );
  }

  /// `A password is minimum 8 characters, at least one uppercase letter, one lowercase letter and one number`
  String get fill_password {
    return Intl.message(
      'A password is minimum 8 characters, at least one uppercase letter, one lowercase letter and one number',
      name: 'fill_password',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get invalid_name {
    return Intl.message(
      '',
      name: 'invalid_name',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone munber`
  String get invalid_phoneNumber {
    return Intl.message(
      'Invalid phone munber',
      name: 'invalid_phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number format is incorrect`
  String get phoneNumber_format_is_incorrect {
    return Intl.message(
      'Phone number format is incorrect',
      name: 'phoneNumber_format_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Username is incorrect`
  String get username_is_incorrect {
    return Intl.message(
      'Username is incorrect',
      name: 'username_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Email or Phone Number`
  String get email_phone {
    return Intl.message(
      'Email or Phone Number',
      name: 'email_phone',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Email or Phone Number`
  String get please_enter_username {
    return Intl.message(
      'Please Enter Email or Phone Number',
      name: 'please_enter_username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `FORGOT PASSWORD?`
  String get forgot_password {
    return Intl.message(
      'FORGOT PASSWORD?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get sign_in {
    return Intl.message(
      'SIGN IN',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get top_description {
    return Intl.message(
      'Don’t have an account?',
      name: 'top_description',
      desc: '',
      args: [],
    );
  }

  /// `SIGN UP`
  String get sign_up {
    return Intl.message(
      'SIGN UP',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `using your email address or social media below`
  String get bottom_description {
    return Intl.message(
      'using your email address or social media below',
      name: 'bottom_description',
      desc: '',
      args: [],
    );
  }

  /// `Username format is incorrect`
  String get username_format_is_incorrect {
    return Intl.message(
      'Username format is incorrect',
      name: 'username_format_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Shop for`
  String get shop_for {
    return Intl.message(
      'Shop for',
      name: 'shop_for',
      desc: '',
      args: [],
    );
  }

  /// `more for free shipping`
  String get more_free_ship {
    return Intl.message(
      'more for free shipping',
      name: 'more_free_ship',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message(
      'My Cart',
      name: 'my_cart',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code`
  String get coupon_code {
    return Intl.message(
      'Coupon Code',
      name: 'coupon_code',
      desc: '',
      args: [],
    );
  }

  /// `PROCESS TO PAYMENT`
  String get process_to_payment {
    return Intl.message(
      'PROCESS TO PAYMENT',
      name: 'process_to_payment',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Vat`
  String get vat {
    return Intl.message(
      'Vat',
      name: 'vat',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `All Products`
  String get all_products {
    return Intl.message(
      'All Products',
      name: 'all_products',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Sort By`
  String get sort_by {
    return Intl.message(
      'Sort By',
      name: 'sort_by',
      desc: '',
      args: [],
    );
  }

  /// `Popularity`
  String get popularity {
    return Intl.message(
      'Popularity',
      name: 'popularity',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get high {
    return Intl.message(
      'High',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get low {
    return Intl.message(
      'Low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Clear All`
  String get clear_all {
    return Intl.message(
      'Clear All',
      name: 'clear_all',
      desc: '',
      args: [],
    );
  }

  /// `Convert Text`
  String get convert_text {
    return Intl.message(
      'Convert Text',
      name: 'convert_text',
      desc: '',
      args: [],
    );
  }

  /// `Text Recognition`
  String get text_recognition {
    return Intl.message(
      'Text Recognition',
      name: 'text_recognition',
      desc: '',
      args: [],
    );
  }

  /// `Save file world`
  String get save_file_world {
    return Intl.message(
      'Save file world',
      name: 'save_file_world',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}