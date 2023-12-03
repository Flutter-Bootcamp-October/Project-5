import 'package:finance_app/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseApi {
  supabaseConnection() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
      url: 'https://oiqcztfpqmgzhunyzmsn.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9pcWN6dGZwcW1nemh1bnl6bXNuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDAzMTg1NzgsImV4cCI6MjAxNTg5NDU3OH0.wTpGXynOYILmEQdBdaF7eUi2b1O-J_sIhINiWPNLVSg',
    );
  }

  SupabaseClient get supabaseObject {
    return Supabase.instance.client;
  }

  Future getFav() async {
    final data = await supabaseObject.from('favorite').select('*');
    print(data);

    for (var element in data) {
      fav.add(element['fav']);
    }
    return fav;
  }

  Future addToFav({
    required id,
    required String fav,
  }) async {
    await supabaseObject.from('favorite').insert(
      {
        'id': id,
        'fav': fav,
      },
    );
  }

  Future deleteFav({
    required int id,
  }) async {
    await supabaseObject.from('favorite').delete().match({
      'id': id,
    });
  }
}
