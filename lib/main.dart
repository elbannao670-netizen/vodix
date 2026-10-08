import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VodixApp());
}

class VodixApp extends StatelessWidget {
  const VodixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'vodix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // هنا يمكن إضافة منطق تسجيل الدخول
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RestaurantListScreen()),
                );
              },
              child: const Text('تسجيل الدخول'),
            ),
          ],
        ),
      ),
    );
  }
}

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('قائمة المطاعم')), 
      body: ListView(
        children: [
          ListTile(
            title: const Text('مطعم 1'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RestaurantDetailScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('مطعم 2'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RestaurantDetailScreen()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddRestaurantScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تفاصيل المطعم')), 
      body: Center(
        child: Text('تفاصيل المطعم هنا'),
      ),
    );
  }
}

class AddRestaurantScreen extends StatelessWidget {
  const AddRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إضافة مطعم')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'اسم المطعم'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'وصف المطعم'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // هنا يمكن إضافة منطق إضافة المطعم
                Navigator.pop(context);
              },
              child: const Text('إضافة'),
            ),
          ],
        ),
      ),
    );
  }
}