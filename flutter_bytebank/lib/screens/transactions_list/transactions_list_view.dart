import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'transactions_list.dart';
import '../../components/components.dart';
import '../../http/web_clients/transaction_web_cliente.dart';
import '../../models/models.dart';

class TransactionsListView extends StatelessWidget {
  final TransactionWebClient webClient;
  const TransactionsListView({Key? key, required this.webClient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: BlocBuilder<TransactionsListCubit, TransactionsListState>(
        builder: (context, state) {
          if (state is InitTransactionsListState ||
              state is LoadingTransactionsListState) {
            return const Progress();
          }
          if (state is LoadedTransactionsListState) {
            final List<Transaction> transactions = state.transactions;

            if (transactions.isNotEmpty) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Transaction transaction = transactions[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.monetization_on),
                      title: Text(
                        transaction.value.toString(),
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        transaction.contact.accountNumber.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              );
            }
            return const CenteredMessage(
              message: 'No transactions found',
              icon: Icons.warning,
            );
          }
          // FatalErrorTransactionsListState
          return const CenteredMessage(message: 'Unknow Error');
        },
      ),
    );
  }
}
