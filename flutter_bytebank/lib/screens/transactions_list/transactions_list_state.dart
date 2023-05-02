import 'package:flutter/material.dart';
import '../../models/models.dart';

@immutable
class TransactionsListState {
  const TransactionsListState();
}

@immutable
class InitTransactionsListState extends TransactionsListState {
  const InitTransactionsListState();
}

@immutable
class LoadingTransactionsListState extends TransactionsListState {
  const LoadingTransactionsListState();
}

@immutable
class LoadedTransactionsListState extends TransactionsListState {
  final List<Transaction> transactions;
  const LoadedTransactionsListState(this.transactions);
}

@immutable
class FatalErrorTransactionsListState extends TransactionsListState {
  const FatalErrorTransactionsListState();
}
