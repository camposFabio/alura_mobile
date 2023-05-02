import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../components/progress/progress_view.dart';
import '../components/components.dart';
import '../http/web_clients/transaction_web_cliente.dart';
import '../models/models.dart';

@immutable
class TransactionFormState {
  const TransactionFormState();
}

@immutable
class ShowFormState extends TransactionFormState {
  const ShowFormState();
}

@immutable
class SendingState extends TransactionFormState {
  const SendingState();
}

@immutable
class SentState extends TransactionFormState {
  const SentState();
}

@immutable
class FatalErrorFormState extends TransactionFormState {
  final String message;

  const FatalErrorFormState({this.message = 'Unknow Error'});
}

class TransactionFormCubit extends Cubit<TransactionFormState> {
  TransactionFormCubit() : super(const ShowFormState());

  save(
    Transaction transactionCreated,
    String password,
    BuildContext context,
  ) async {
    emit(const SendingState());
    await _send(
        transactionCreated: transactionCreated,
        password: password,
        context: context);
  }

  Future<void> _send(
      {required Transaction transactionCreated,
      required String password,
      required BuildContext context}) async {
    try {
      await TransactionWebClient()
          .save(transaction: transactionCreated, password: password);
      emit(const SentState());
    } on HttpException catch (e) {
      emit(FatalErrorFormState(message: e.message ?? ''));
      //_showFailureMessage(context, message: e.message ?? '');
    } on TimeoutException {
      emit(const FatalErrorFormState(
          message: 'timeout submitting the transaction'));
    } catch (e) {
      emit(const FatalErrorFormState());
    }
  }
}

class TransactionFormContainer extends BlocContainer {
  final Contact _contact;

  const TransactionFormContainer(this._contact, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionFormCubit>(
        create: (context) {
          return TransactionFormCubit();
        },
        child: BlocListener<TransactionFormCubit, TransactionFormState>(
          listener: (context, state) {
            if (state is SentState) {
              Navigator.pop(context);
            }
          },
          child: TransactionFormView(_contact),
        ));
  }
}

class TransactionFormView extends StatelessWidget {
  const TransactionFormView(this._contact, {Key? key}) : super(key: key);

  final Contact _contact;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionFormCubit, TransactionFormState>(
        builder: (context, state) {
      if (state is ShowFormState) {
        return _BasicForm(_contact);
      }
      if (state is SendingState || state is SentState) {
        return const ProgressView();
      }
      if (state is FatalErrorFormState) {
        return ErrorView(message: state.message);
      }
      return const ErrorView();
    });
  }
}

class _BasicForm extends StatelessWidget {
  final Contact _contact;

  const _BasicForm(
    this._contact, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _valueController = TextEditingController();
    final String transactionId = const Uuid().v4();

    return Scaffold(
      appBar: AppBar(
        title: const Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  _contact.accountNumber.toString(),
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: const TextStyle(fontSize: 24.0),
                  decoration: const InputDecoration(labelText: 'Value'),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text('Transfer'),
                    onPressed: () {
                      final double? value =
                          double.tryParse(_valueController.text);
                      final transactionCreated = Transaction(
                          id: transactionId, value: value, contact: _contact);
                      showDialog(
                          context: context,
                          builder: (contextDialog) {
                            return TransactionAuthDialog(
                              onConfirm: (String password) {
                                BlocProvider.of<TransactionFormCubit>(context)
                                    .save(
                                        transactionCreated, password, context);
                              },
                            );
                          });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
