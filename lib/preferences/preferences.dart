import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String _img = '';
  static String _nombre = '';
  static String _apellidos = '';
  static String _ciudad = '';
  static String _pais = '';
  static int _genero = 1;
  static bool _theme = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get img {
    return _prefs.getString('img') ?? _img;
  }

  static set img(String img) {
    _img = img;
    _prefs.setString('img', img);
  }

  static String get nombre {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombre(String nombre) {
    _nombre = nombre;
    _prefs.setString('nombre', nombre);
  }

  static String get apellidos {
    return _prefs.getString('apellidos') ?? _apellidos;
  }

  static set apellidos(String apellidos) {
    _apellidos = apellidos;
    _prefs.setString('apellidos', apellidos);
  }

  static String get ciudad {
    return _prefs.getString('ciudad') ?? _ciudad;
  }

  static set ciudad(String ciudad) {
    _ciudad = ciudad;
    _prefs.setString('ciudad', ciudad);
  }

  static String get pais {
    return _prefs.getString('pais') ?? _pais;
  }

  static set pais(String pais) {
    _pais = pais;
    _prefs.setString('pais', pais);
  }

  static int get genero {
    return _prefs.getInt('genero') ?? _genero;
  }

  static set genero(int genero) {
    _genero = genero;
    _prefs.setInt('genero', genero);
  }

  static bool get theme {
    return _prefs.getBool('theme') ?? _theme;
  }

  static set theme(bool theme) {
    _theme = theme;
    _prefs.setBool('theme', theme);
  }
}
