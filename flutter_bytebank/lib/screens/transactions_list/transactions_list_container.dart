import 'package:flutter/material.dart';

import 'package:bytebank/components/components.dart';
import 'package:bytebank/http/web_clients/transaction_web_cliente.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transactions_list_cubit.dart';
import 'transactions_list_view.dart';

class TransactionsListContainer extends BlocContainer {
  const TransactionsListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionWebClient _webClient = TransactionWebClient();

    return BlocProvider<TransactionsListCubit>(
        create: (context) {
          final TransactionsListCubit cubit = TransactionsListCubit();
          cubit.reload(_webClient);
          return cubit;
        },
        child: TransactionsListView(webClient: _webClient));
  }
}
