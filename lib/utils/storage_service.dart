import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _appointmentsKey = 'appointments_data';

  // Salvar dados de agendamentos
  static Future<bool> saveAppointments(
      List<Map<String, dynamic>> appointments) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final appointmentsJson =
          appointments.map((appointment) => appointment).toList();
      final appointmentsString = jsonEncode(appointmentsJson);
      return await prefs.setString(_appointmentsKey, appointmentsString);
    } catch (e) {
      print('Erro ao salvar agendamentos: $e');
      return false;
    }
  }

  // Carregar dados de agendamentos
  static Future<List<Map<String, dynamic>>> loadAppointments() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final appointmentsString = prefs.getString(_appointmentsKey);

      if (appointmentsString == null || appointmentsString.isEmpty) {
        return [];
      }

      final appointmentsJson = jsonDecode(appointmentsString) as List;
      return appointmentsJson
          .map((json) => json as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Erro ao carregar agendamentos: $e');
      return [];
    }
  }

  // Salvar preferência de "Lembrar-me"
  static Future<bool> saveRememberMe(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setBool('remember_me', value);
    } catch (e) {
      print('Erro ao salvar preferência: $e');
      return false;
    }
  }

  // Carregar preferência de "Lembrar-me"
  static Future<bool> getRememberMe() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool('remember_me') ?? false;
    } catch (e) {
      print('Erro ao carregar preferência: $e');
      return false;
    }
  }

  // Salvar credenciais do usuário
  static Future<bool> saveUserCredentials(String email, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', email);
      await prefs.setString('user_password',
          password); // Salvar a senha também (pode ser feito de maneira segura)
      return true;
    } catch (e) {
      print('Erro ao salvar credenciais: $e');
      return false;
    }
  }

  // Carregar email do usuário
  static Future<String?> getUserEmail() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_email');
    } catch (e) {
      print('Erro ao carregar email: $e');
      return null;
    }
  }

  // Carregar senha do usuário
  static Future<String?> getUserPassword() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('user_password');
    } catch (e) {
      print('Erro ao carregar senha: $e');
      return null;
    }
  }
}
