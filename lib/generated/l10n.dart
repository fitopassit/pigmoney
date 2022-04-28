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

  /// `Расход`
  String get Expense {
    return Intl.message(
      'Расход',
      name: 'Expense',
      desc: '',
      args: [],
    );
  }

  /// `Сколько вы потратили?`
  String get How_Much_Expense {
    return Intl.message(
      'Сколько вы потратили?',
      name: 'How_Much_Expense',
      desc: '',
      args: [],
    );
  }

  /// `Сколько вы заработали?`
  String get How_Much_Income {
    return Intl.message(
      'Сколько вы заработали?',
      name: 'How_Much_Income',
      desc: '',
      args: [],
    );
  }

  /// `Доход`
  String get Income {
    return Intl.message(
      'Доход',
      name: 'Income',
      desc: '',
      args: [],
    );
  }

  /// `Финансовый отчет`
  String get Financial_Report {
    return Intl.message(
      'Финансовый отчет',
      name: 'Financial_Report',
      desc: '',
      args: [],
    );
  }

  /// `Категории`
  String get Category {
    return Intl.message(
      'Категории',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Образование`
  String get Category_Education {
    return Intl.message(
      'Образование',
      name: 'Category_Education',
      desc: '',
      args: [],
    );
  }

  /// `Тренировка`
  String get Category_Workout {
    return Intl.message(
      'Тренировка',
      name: 'Category_Workout',
      desc: '',
      args: [],
    );
  }

  /// `Транспорт`
  String get Category_Transportation {
    return Intl.message(
      'Транспорт',
      name: 'Category_Transportation',
      desc: '',
      args: [],
    );
  }

  /// `Семья`
  String get Category_Family {
    return Intl.message(
      'Семья',
      name: 'Category_Family',
      desc: '',
      args: [],
    );
  }

  /// `Продукты`
  String get Category_Groceries {
    return Intl.message(
      'Продукты',
      name: 'Category_Groceries',
      desc: '',
      args: [],
    );
  }

  /// `Подарки`
  String get Category_Gifts {
    return Intl.message(
      'Подарки',
      name: 'Category_Gifts',
      desc: '',
      args: [],
    );
  }

  /// `Кафе`
  String get Category_Cafe {
    return Intl.message(
      'Кафе',
      name: 'Category_Cafe',
      desc: '',
      args: [],
    );
  }

  /// `Ещё`
  String get Category_More {
    return Intl.message(
      'Ещё',
      name: 'Category_More',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get Add_Widget_Description {
    return Intl.message(
      'Описание',
      name: 'Add_Widget_Description',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get Add_Widget_Button {
    return Intl.message(
      'Продолжить',
      name: 'Add_Widget_Button',
      desc: '',
      args: [],
    );
  }

  /// `Зарплата`
  String get Category_Paycheck {
    return Intl.message(
      'Зарплата',
      name: 'Category_Paycheck',
      desc: '',
      args: [],
    );
  }

  /// `Interest`
  String get Category_Interest {
    return Intl.message(
      'Interest',
      name: 'Category_Interest',
      desc: '',
      args: [],
    );
  }

  /// `Акции`
  String get Category_Stock {
    return Intl.message(
      'Акции',
      name: 'Category_Stock',
      desc: '',
      args: [],
    );
  }

  /// `Другое`
  String get Category_Other {
    return Intl.message(
      'Другое',
      name: 'Category_Other',
      desc: '',
      args: [],
    );
  }

  /// `Добро пожаловать!`
  String get Intr_title1 {
    return Intl.message(
      'Добро пожаловать!',
      name: 'Intr_title1',
      desc: '',
      args: [],
    );
  }

  /// `Мы рады рассказать вам о нас!`
  String get Intr_title2 {
    return Intl.message(
      'Мы рады рассказать вам о нас!',
      name: 'Intr_title2',
      desc: '',
      args: [],
    );
  }

  /// `Спасибо, что выбрали нас!`
  String get Intr_title3 {
    return Intl.message(
      'Спасибо, что выбрали нас!',
      name: 'Intr_title3',
      desc: '',
      args: [],
    );
  }

  /// `Мы рады видеть вас в нашем приложении!`
  String get Intr1 {
    return Intl.message(
      'Мы рады видеть вас в нашем приложении!',
      name: 'Intr1',
      desc: '',
      args: [],
    );
  }

  /// `Наш продукт это простой калькулятор расходов, с интуитивно понятным интерфейсом!`
  String get Intr2 {
    return Intl.message(
      'Наш продукт это простой калькулятор расходов, с интуитивно понятным интерфейсом!',
      name: 'Intr2',
      desc: '',
      args: [],
    );
  }

  /// `Приятного пользования!`
  String get Intr3 {
    return Intl.message(
      'Приятного пользования!',
      name: 'Intr3',
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
