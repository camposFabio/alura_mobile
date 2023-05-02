import 'package:flutter_bloc/flutter_bloc.dart';

import '../../http/web_clients/transaction_web_cliente.dart';
import '../../models/models.dart';
import 'transactions_list_state.dart';

class TransactionsListCubit extends Cubit<TransactionsListState> {
  TransactionsListCubit() : super(const InitTransactionsListState());

  void reload(TransactionWebClient webClient) async {
    emit(const LoadingTransactionsListState());

    try {
      List<Transaction> transactions = await webClient.findAll();
      emit(LoadedTransactionsListState(transactions));
    } catch (e) {
      emit(const FatalErrorTransactionsListState());
    }
  }
}
