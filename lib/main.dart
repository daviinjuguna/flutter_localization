import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:locale_clean_code/di/injection.dart';
import 'package:locale_clean_code/entities/Local.dart';
import 'package:locale_clean_code/utils/bloc_observer.dart';

import 'app_localization.dart';
import 'bloc/language_bloc.dart';

void main() async {
  await configureInjection();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguageBloc>()..add(GetLanguage()),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          Locale? _locale;
          if (state is LanguageSuccess) {
            _locale = state.locale;
          }
          if (state is LanguageError) {
            _locale = Locale("en", "EN");
          }
          return MaterialApp(
            // scaffoldMessengerKey: ,
            locale: _locale,
            title: "App",
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            supportedLocales: [
              Locale("en", "EN"), //english
              Locale("sw", "KE"), //swahili
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: MyHomePage(
              locale: _locale,
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.locale}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final Locale? locale;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          (AppLocalizations.of(context)!.translate("home_page"))!,
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (AppLocalizations.of(context)!.translate("hello"))!,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              (AppLocalizations.of(context)!.translate("pressed_button"))!,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () => context.read<LanguageBloc>().add(
                        SetLanguage(
                          locale: LocaleEntity(countryCode: "EN", locale: "en"),
                        ),
                      ),
                  child: Text(
                    "ENGLISH",
                    style: TextStyle(
                      color: widget.locale == Locale("en", "EN")
                          ? Colors.yellow
                          : Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  onPressed: () => context.read<LanguageBloc>().add(
                        SetLanguage(
                          locale: LocaleEntity(countryCode: "KE", locale: "sw"),
                        ),
                      ),
                  child: Text(
                    "SWAHILI",
                    style: TextStyle(
                      color: widget.locale == Locale("sw", "KE")
                          ? Colors.yellow
                          : Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: (AppLocalizations.of(context)!.translate("increment"))!,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 5),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: (AppLocalizations.of(context)!.translate("decrement"))!,
            child: Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
