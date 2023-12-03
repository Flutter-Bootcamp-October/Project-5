abstract class FinanceState {}

final class FinanceInitialState extends FinanceState {}

class LoadingState extends FinanceState {}

class EmptyState extends FinanceState {}

class ResponseState extends FinanceState {
  String response;
  ResponseState({required this.response});
}

class AddedToFavState extends FinanceState {}

class DeleteFavState extends FinanceState {}
