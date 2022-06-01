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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Expense`
  String get Expense {
    return Intl.message(
      'Expense',
      name: 'Expense',
      desc: '',
      args: [],
    );
  }

  /// `How much you Expense?`
  String get How_Much_Expense {
    return Intl.message(
      'How much you Expense?',
      name: 'How_Much_Expense',
      desc: '',
      args: [],
    );
  }

  /// `How much you Income?`
  String get How_Much_Income {
    return Intl.message(
      'How much you Income?',
      name: 'How_Much_Income',
      desc: '',
      args: [],
    );
  }

  /// `Income`
  String get Income {
    return Intl.message(
      'Income',
      name: 'Income',
      desc: '',
      args: [],
    );
  }

  /// `Financial Report`
  String get Financial_Report {
    return Intl.message(
      'Financial Report',
      name: 'Financial_Report',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Demo`
  String get Flutter_Demo {
    return Intl.message(
      'Flutter Demo',
      name: 'Flutter_Demo',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get Category_Education {
    return Intl.message(
      'Education',
      name: 'Category_Education',
      desc: '',
      args: [],
    );
  }

  /// `Workout`
  String get Category_Workout {
    return Intl.message(
      'Workout',
      name: 'Category_Workout',
      desc: '',
      args: [],
    );
  }

  /// `Family`
  String get Category_Family {
    return Intl.message(
      'Family',
      name: 'Category_Family',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get Category_Transportation {
    return Intl.message(
      'Transport',
      name: 'Category_Transportation',
      desc: '',
      args: [],
    );
  }

  /// `Groceries`
  String get Category_Groceries {
    return Intl.message(
      'Groceries',
      name: 'Category_Groceries',
      desc: '',
      args: [],
    );
  }

  /// `Gifts`
  String get Category_Gifts {
    return Intl.message(
      'Gifts',
      name: 'Category_Gifts',
      desc: '',
      args: [],
    );
  }

  /// `Cafe`
  String get Category_Cafe {
    return Intl.message(
      'Cafe',
      name: 'Category_Cafe',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get Category_More {
    return Intl.message(
      'More',
      name: 'Category_More',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get Add_Widget_Description {
    return Intl.message(
      'Description',
      name: 'Add_Widget_Description',
      desc: '',
      args: [],
    );
  }

  /// `Paycheck`
  String get Category_Paycheck {
    return Intl.message(
      'Paycheck',
      name: 'Category_Paycheck',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Add_Widget_Button {
    return Intl.message(
      'Continue',
      name: 'Add_Widget_Button',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get Category_Stock {
    return Intl.message(
      'Stock',
      name: 'Category_Stock',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get Category_Other {
    return Intl.message(
      'Other',
      name: 'Category_Other',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the app!`
  String get Intr_title1 {
    return Intl.message(
      'Welcome to the app!',
      name: 'Intr_title1',
      desc: '',
      args: [],
    );
  }

  /// `We are happy to tell you about us!`
  String get Intr_title2 {
    return Intl.message(
      'We are happy to tell you about us!',
      name: 'Intr_title2',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for choosing us!`
  String get Intr_title3 {
    return Intl.message(
      'Thank you for choosing us!',
      name: 'Intr_title3',
      desc: '',
      args: [],
    );
  }

  /// `We are happy to see you in our app!`
  String get Intr1 {
    return Intl.message(
      'We are happy to see you in our app!',
      name: 'Intr1',
      desc: '',
      args: [],
    );
  }

  /// `Our product is a simple expense calculator with an intuitive interface!`
  String get Intr2 {
    return Intl.message(
      'Our product is a simple expense calculator with an intuitive interface!',
      name: 'Intr2',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy your use!`
  String get Intr3 {
    return Intl.message(
      'Enjoy your use!',
      name: 'Intr3',
      desc: '',
      args: [],
    );
  }

  /// `New money`
  String get New_money {
    return Intl.message(
      'New money',
      name: 'New_money',
      desc: '',
      args: [],
    );
  }

  /// `Enter the name of the piggy bank`
  String get Enter_name_money {
    return Intl.message(
      'Enter the name of the piggy bank',
      name: 'Enter_name_money',
      desc: '',
      args: [],
    );
  }

  /// `The goal and the desired date of its achievement.`
  String get Goal_data {
    return Intl.message(
      'The goal and the desired date of its achievement.',
      name: 'Goal_data',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get History {
    return Intl.message(
      'History',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History`
  String get History_trans {
    return Intl.message(
      'Transaction History',
      name: 'History_trans',
      desc: '',
      args: [],
    );
  }

  /// `Adding to the piggy bank`
  String get Adding_in_Pig {
    return Intl.message(
      'Adding to the piggy bank',
      name: 'Adding_in_Pig',
      desc: '',
      args: [],
    );
  }

  /// `How much do you want to take from the piggy bank?`
  String get Taking_from_the_piggy {
    return Intl.message(
      'How much do you want to take from the piggy bank?',
      name: 'Taking_from_the_piggy',
      desc: '',
      args: [],
    );
  }

  /// `Retrieved from`
  String get Taken {
    return Intl.message(
      'Retrieved from',
      name: 'Taken',
      desc: '',
      args: [],
    );
  }

  /// `Added`
  String get Added {
    return Intl.message(
      'Added',
      name: 'Added',
      desc: '',
      args: [],
    );
  }

  /// `Piggy banks`
  String get Piggy_banks {
    return Intl.message(
      'Piggy banks',
      name: 'Piggy_banks',
      desc: '',
      args: [],
    );
  }

  /// `Main`
  String get Main {
    return Intl.message(
      'Main',
      name: 'Main',
      desc: '',
      args: [],
    );
  }

  /// `Piggy bank`
  String get Piggy_bank {
    return Intl.message(
      'Piggy bank',
      name: 'Piggy_bank',
      desc: '',
      args: [],
    );
  }

  /// `Total in piggy banks:`
  String get Total_in_piggy {
    return Intl.message(
      'Total in piggy banks:',
      name: 'Total_in_piggy',
      desc: '',
      args: [],
    );
  }

  /// `Goal:`
  String get Goal {
    return Intl.message(
      'Goal:',
      name: 'Goal',
      desc: '',
      args: [],
    );
  }

  /// `Collected`
  String get Collected {
    return Intl.message(
      'Collected',
      name: 'Collected',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `How much do you want to put in the piggy bank?`
  String get Piggy_add {
    return Intl.message(
      'How much do you want to put in the piggy bank?',
      name: 'Piggy_add',
      desc: '',
      args: [],
    );
  }

  /// `Date of creation`
  String get Date_create_pig {
    return Intl.message(
      'Date of creation',
      name: 'Date_create_pig',
      desc: '',
      args: [],
    );
  }

  /// `Nothing there😞`
  String get Nothing_there {
    return Intl.message(
      'Nothing there😞',
      name: 'Nothing_there',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to delete the piggy bank?`
  String get Piggy_delete {
    return Intl.message(
      'Do you really want to delete the piggy bank?',
      name: 'Piggy_delete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get Ok {
    return Intl.message(
      'Ok',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get Delete {
    return Intl.message(
      'Delete',
      name: 'Delete',
      desc: '',
      args: [],
    );
  }

  /// `Info about transaction`
  String get Info_Transaction {
    return Intl.message(
      'Info about transaction',
      name: 'Info_Transaction',
      desc: '',
      args: [],
    );
  }

  /// `Category: `
  String get Category_one {
    return Intl.message(
      'Category: ',
      name: 'Category_one',
      desc: '',
      args: [],
    );
  }

  /// `Cost:`
  String get Cost {
    return Intl.message(
      'Cost:',
      name: 'Cost',
      desc: '',
      args: [],
    );
  }

  /// `Date:`
  String get Date {
    return Intl.message(
      'Date:',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get Description {
    return Intl.message(
      'Description:',
      name: 'Description',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get More {
    return Intl.message(
      'More',
      name: 'More',
      desc: '',
      args: [],
    );
  }

  /// `Less`
  String get Less {
    return Intl.message(
      'Less',
      name: 'Less',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get Get_Started {
    return Intl.message(
      'Get Started',
      name: 'Get_Started',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Balance: `
  String get Balance {
    return Intl.message(
      'Balance: ',
      name: 'Balance',
      desc: '',
      args: [],
    );
  }

  /// `Info`
  String get Info {
    return Intl.message(
      'Info',
      name: 'Info',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
