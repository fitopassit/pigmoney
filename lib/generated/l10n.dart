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

  /// `Continue`
  String get Add_Widget_Button {
    return Intl.message(
      'Continue',
      name: 'Add_Widget_Button',
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
