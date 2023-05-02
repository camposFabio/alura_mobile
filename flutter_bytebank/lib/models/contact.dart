class Contact {
  final int? _id;
  final String _name;
  final int _accountNumber;

  Contact({required int id, required String name, required int accountNumber})
      : _id = id,
        _name = name,
        _accountNumber = accountNumber;

  get id => _id;
  get name => _name;
  get accountNumber => _accountNumber;

  @override
  String toString() {
    return 'Contact{id: $_id, name: $_name, accountNumber: $_accountNumber}';
  }

  Contact.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() => {
        'id': _id,
        'name': _name,
        'accountNumber': _accountNumber,
      };
}
