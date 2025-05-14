import 'package:flutter/material.dart';

import 'package:quickcheck/app/profile/theme_profile.dart';   // decoration
import 'package:quickcheck/features/profile/login_page.dart'; // redirecting

import 'package:quickcheck/data/isar_service.dart';   // control bank
import 'package:quickcheck/data/profile/user.dart';   // table
import 'package:isar/isar.dart';    // complete package

class ProfilePage extends StatefulWidget {
  final String userCpf;
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
        .cpfEqualTo(widget.userCpf)
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
          _user!.institution = value;
          break;
      }
      await isar.users.put(_user!);
    });
    setState(() {});
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
                    onChanged: (value) => _updateField('username', value),
                    enabled: true,
                  ),
                  EditableField(
                    label: 'Email',
                    initialValue: _user!.email,
                    onChanged: (value) => _updateField('email', value),
                    enabled: true,
                  ),
                  EditableField(
                    label: 'Instituição',
                    initialValue: _user!.institution,
                    onChanged: (value) => _updateField('institution', value),
                    enabled: true,
                  ),
                  EditableField(
                    label: 'CPF',
                    initialValue: _user!.cpf,
                    enabled: false,
                  ),
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
  final String initialValue;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  const EditableField({
    super.key,
    required this.label,
    required this.initialValue,
    this.onChanged,
    this.enabled = true,
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
    isEditing = false;
    _controller = TextEditingController(text: widget.initialValue);
  }

  void _toggleEdit() {
    if (!widget.enabled) return;
    setState(() => isEditing = !isEditing);
  }

  void _save() {
    if (widget.onChanged != null) {
      widget.onChanged!(_controller.text);
    }
    _toggleEdit();
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
          if (isEditing && widget.enabled)
            Row(
              children: [
                Expanded(child: TextField(controller: _controller)),
                IconButton(onPressed: _save, icon: const Icon(Icons.check)),
              ],
            )
          else
            Row(
              children: [
                Expanded(child: Text(_controller.text, style: const TextStyle(fontSize: 16))),
                if (widget.enabled)
                  IconButton(
                    onPressed: _toggleEdit,
                    icon: const Icon(Icons.edit, size: 18),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
