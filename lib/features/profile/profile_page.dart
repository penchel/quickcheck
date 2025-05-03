import 'package:flutter/material.dart';

import 'package:quickcheck/app/profile/theme_profile.dart';   // decoration
import 'package:quickcheck/features/profile/login_page.dart'; // redirecting

import 'package:quickcheck/data/isar_service.dart';   // control bank
import 'package:quickcheck/data/profile/user.dart';   // table
import 'package:isar/isar.dart';    // complete package

class ProfilePage extends StatefulWidget {
  final String userCpf;   // CPF that was passed
  const ProfilePage({super.key, required this.userCpf});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() async {
    final isar = await IsarService.getIsarInstance();
    final user = await isar.users
        .filter()
        .cpfEqualTo(widget.userCpf)   // looking for someone with the same CPF as in the past
        .findFirst();

    setState(() {
      _user = user;
    });
  }

  Future<void> _updateField(String field, String value) async {
    final isar = await IsarService.getIsarInstance();
    await isar.writeTxn(() async {
      switch (field) {
        case 'username':
          _user!.username = value;
          break;
        case 'email':
          _user!.email = value;
          break;
        case 'institution':
          _user!.institution = value;   // 6 - If that's the case, change it
          break;
      }
      await isar.users.put(_user!);   //
    });
    setState(() {});    //  7 - refresh the screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: _user == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: ProfileTheme.contentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditableField(
              label: 'Nome',
              initialValue: _user!.username,
              onChanged: (value) => _updateField('username', value),    // 5 - call _updateField
            ),
            EditableField(
              label: 'Email',
              initialValue: _user!.email,
              onChanged: (value) => _updateField('email', value),   // 5 - call _updateField
            ),
            EditableField(
              label: 'Instituição',
              initialValue: _user!.institution,
              onChanged: (value) => _updateField('institution', value),   // 5 - call _updateField
            ),
            const SizedBox(height: 8),
            Text('CPF: ${_user!.cpf}', style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 32),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}



class EditableField extends StatefulWidget {
  final String label;
  final String initialValue;    // initial value not changed
  final ValueChanged<String> onChanged;

  const EditableField({   // you have to pass these fields
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<EditableField> createState() => _EditableFieldState();
}

class _EditableFieldState extends State<EditableField> {
  late bool isEditing;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    isEditing = false;    // no edition
    _controller = TextEditingController(text: widget.initialValue);   // initial value
  }

  void _toggleEdit() {
    setState(() => isEditing = !isEditing);   // 2 - enable editing
  }

  void _save() {
    widget.onChanged(_controller.text);   // 4- send the new value
    _toggleEdit();    //  9 - enable editing
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          isEditing
              ? Row(
            children: [
              Expanded(child: TextField(controller: _controller)),
              IconButton(onPressed: _save, icon: const Icon(Icons.check)),    // 3 - after typing press and call save
            ],
          )
              : GestureDetector(
            onTap: _toggleEdit,   //  1 - call the function
            child: Row(
              children: [
                Expanded(child: Text(_controller.text, style: const TextStyle(fontSize: 16))),
                const Icon(Icons.edit, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}