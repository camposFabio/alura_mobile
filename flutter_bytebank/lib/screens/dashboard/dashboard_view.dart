import 'package:bytebank/components/localization/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../models/models.dart';
import '../contacts_list/contacts_list_container.dart';
import '../screens.dart';
import 'dashboard_feature_item.dart';

class DashboardView extends StatelessWidget {
  final I18nMessages _i18n;

  const DashboardView(this._i18n, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // misturando um blockbuilder (que é um observador de eventos) com UI
        title: BlocBuilder<NameCubit, String>(
          builder: (context, state) => Text('${_i18n.get("welcome")} $state'),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600,
                            offset: const Offset(4, 8),
                            blurRadius: 5),
                      ],
                    ),
                    child: Image.asset('images/bytebank_logo.png')),
              ),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FeatureItem(
                      name: _i18n.get('transfer'),
                      icon: Icons.monetization_on,
                      onClick: () => _showContactsList(context),
                    ),
                    FeatureItem(
                      name: _i18n.get('transactionFeed'),
                      icon: Icons.description,
                      onClick: () => _showTransactionsList(context),
                    ),
                    FeatureItem(
                      name: _i18n.get('changeName'),
                      icon: Icons.person_outline,
                      onClick: () => _showChangeName(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showContactsList(BuildContext blocContext) {
    push(blocContext, const ContactsListContainer());
  }

  void _showChangeName(BuildContext blocContext) {
    Navigator.of(blocContext).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: BlocProvider.of<NameCubit>(blocContext),
          child: const NameContainer(),
        ),
      ),
    );
  }

  void _showTransactionsList(BuildContext blocContext) {
    Navigator.of(blocContext).push(
      MaterialPageRoute(
        builder: (context) => const TransactionsListContainer(),
      ),
    );
  }
}
