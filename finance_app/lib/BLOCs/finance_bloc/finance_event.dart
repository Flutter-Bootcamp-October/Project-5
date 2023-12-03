abstract class FinanceEvent {}

class SendRequestEvent extends FinanceEvent {
  String request;
  SendRequestEvent({required this.request});
}

class AddToFavtEvent extends FinanceEvent {
  String response;
  int id;
  AddToFavtEvent({required this.response, required this.id});
}

class DeleteFavEvent extends FinanceEvent {
  int i;

  DeleteFavEvent({required this.i});
}
