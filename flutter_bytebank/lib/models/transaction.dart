import './models.dart';

class Transaction {
  final String _id;
  final double? _value;
  final Contact _contact;

  Transaction({
    required String id,
    required double? value,
    required Contact contact,
  })  : _id = id,
        _value = value,
        _contact = contact;

  get value => _value;
  get contact => _contact;

  Transaction.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _value = json['value'],
        _contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'id': _id,
        'value': _value,
        'contact': _contact.toJson(),
      };

  @override
  String toString() {
    return 'Transaction{id: $_id, value: $_value, contact: $_contact}';
  }
}
