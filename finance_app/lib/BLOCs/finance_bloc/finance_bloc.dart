import 'package:finance_app/BLOCs/finance_bloc/finance_event.dart';
import 'package:finance_app/BLOCs/finance_bloc/finance_state.dart';
import 'package:finance_app/globals/globals.dart';
import 'package:finance_app/services/open_ai_api.dart';
import 'package:finance_app/services/supabase_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  FinanceBloc() : super(FinanceInitialState()) {
    on<SendRequestEvent>(
      (event, emit) async {
        if (event.request.isEmpty) {
          emit(EmptyState());
        } else {
          emit(LoadingState());
          final result = await OpenAi().chatGPT(event.request);
          emit(ResponseState(response: result));
        }
      },
    );

    on<AddToFavtEvent>((event, emit) {
      fav.add(event.response);
      SupabaseApi().addToFav(fav: event.response, id: event.id);
      emit(AddedToFavState());
    });

    on<DeleteFavEvent>((event, emit) {
      SupabaseApi().deleteFav(id: event.i);
      fav.removeAt(event.i);
      emit(DeleteFavState());
    });
  }
}
