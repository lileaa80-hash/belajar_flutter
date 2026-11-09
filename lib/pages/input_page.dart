import 'package:flutter/material.dart';

class BelajarForm extends StatefulWidget {
  const BelajarForm({super.key});

  @override
  State<BelajarForm> createState() => _BelajarFormState();
}

class _BelajarFormState extends State<BelajarForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController tglLahirController = TextEditingController();

  String? _jk;
  String? _jkError;
  String? _pilihAgama;

  final List<String> agama = [
    'Islam',
    'Protestan',
    'Katolik',
    'Budha',
    'Atheis',
  ];

  @override
  void initState() {
    tglLahirController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Formulir Biodata',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input Nama';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),

                      // Jenis Kelamin
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jenis Kelamin',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          RadioListTile<String>(
                            title: const Text('Laki-laki'),
                            value: 'Laki-laki',
                            groupValue: _jk,
                            onChanged: (value) {
                              setState(() {
                                _jk = value;
                                _jkError = null;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                          ),
                          RadioListTile<String>(
                            title: const Text('Perempuan'),
                            value: 'Perempuan',
                            groupValue: _jk,
                            onChanged: (value) {
                              setState(() {
                                _jk = value;
                                _jkError = null;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                      if (_jkError != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            _jkError!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: tglLahirController,
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input Tanggal Lahir';
                          }
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            final formattedDate =
                                '${pickedDate.year.toString().padLeft(4, '0')}-'
                                '${pickedDate.month.toString().padLeft(2, '0')}-'
                                '${pickedDate.day.toString().padLeft(2, '0')}';
                            setState(() {
                              tglLahirController.text = formattedDate;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 18),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Pilih Agama',
                          border: OutlineInputBorder(),
                        ),
                        items: agama
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihAgama = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih Agama';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: const BorderSide(color: Colors.black),
                            ),
                          ),
                          child: const Text(
                            'Simpan',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isFormValid = _formKey.currentState!.validate();
    if (!isFormValid || _jk == null) {
      setState(() {
        _jkError = _jk == null ? 'Pilih Jenis Kelamin' : _jkError;
      });
      return;
    }

    Navigator.pushNamed(
      context,
      '/output',
      arguments: {
        'nama': namaController.text,
        'jk': _jk!,
        'tglLahir': tglLahirController.text,
        'agama': _pilihAgama ?? '',
      },
    );
  }
}