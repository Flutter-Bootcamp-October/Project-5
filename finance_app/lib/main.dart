import 'package:finance_app/BLOCs/finance_bloc/finance_bloc.dart';
import 'package:finance_app/screens/home_screen.dart';
import 'package:finance_app/services/supabase_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  SupabaseApi().supabaseConnection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinanceBloc(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300],
        ),
        home: HomeScreen(),
      ),
    );
  }
}
