/*class AuthService {
  static Future<bool> login({required String email, required String password}) async {
    // TODO: Implement actual authentication logic
    // This is a mock implementation
    await Future.delayed(const Duration(seconds: 2));

    // Mock validation
    if (email == 'test@example.com' && password == 'password123') {
      return true;
    }
    return false;
  }

  static Future<bool> signup(String name, String email, String password) async {
    // TODO: Implement actual signup logic
    // This is a mock implementation
    await Future.delayed(const Duration(seconds: 2));

    // Mock validation
    if (email.isNotEmpty && password.length >= 6) {
      return true;
    }
    return false;
  }

  static Future<void> resetPassword(String email) async {
    // TODO: Implement actual password reset logic
    await Future.delayed(const Duration(seconds: 2));
  }

  static Future<void> logout() async {
    // TODO: Implement actual logout logic
    await Future.delayed(const Duration(seconds: 1));
  }
}*/
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async';
import '../models/user_model.dart' as custom_user;
class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<custom_user.User> login({
  required String email,
  required String password,
}) async {
  try {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception('Authentication failed: No user returned');
    }

    final profileResponse = await _supabase
        .from('profiles')
        .select()
        .eq('id', response.user!.id)
        .single();
    
    return custom_user.User(
      id: profileResponse['id'],
      name: profileResponse['name'], 
      email: profileResponse['email'],
      createdAt: DateTime.parse(profileResponse['created_at']),
    );
  } on AuthException catch (e) {
    throw Exception('Authentication error: ${e.message}');
  } on PostgrestException catch (e) {
    throw Exception('Database error: ${e.message}');
  } catch (e) {
    throw Exception('Login failed: ${e.toString()}');
  }
}

  Future<custom_user.User> signup({
  required String username,
  required String email,
  required String password,
}) async {
  try {
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': username,
      },
    );

    if (response.user == null) {
      throw Exception('Failed to create user: No user returned');
    }
    await Future.delayed(const Duration(seconds: 2));
    
    final profileResponse = await _supabase
    .from('profiles')
    .insert({
      'id': response.user!.id,
      'username': username,
      'email': email,
    });

    if (profileResponse.error != null) {
      throw Exception('Failed to create profile: ${profileResponse.error!.message}');
    }

    return custom_user.User(
      id: profileResponse['id'],
      name: profileResponse['name'],
      email: profileResponse['email'],
      createdAt: DateTime.parse(profileResponse['created_at']),
    );

  } catch (e) {
    throw Exception('Signup failed: ${e.toString()}');
  }
} 
  static Future<void> resetPassword(String email) async {
    // TODO: Implement actual password reset logic
    await Future.delayed(const Duration(seconds: 2));
  }

  static Future<void> logout() async {
    // TODO: Implement actual logout logic
    await Future.delayed(const Duration(seconds: 1));
  }
}
