import 'package:flutter/material.dart';

class registerex extends StatefulWidget {
  const registerex({super.key});

  @override
  State<registerex> createState() => _registerexState();
}

class _registerexState extends State<registerex> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String _gender = 'Male/Female'; //
  final List<String> _qualifications = [];
  String _city = 'Rajkot';
  double _height = 60; // in inches (range 48-84)
  DateTime? _dob;

  final List<String> _cityList = ['Rajkot', 'Ahmedabad', 'Surat', 'Vadodara', 'Gandhinagar'];
  final List<String> _qualificationOptions = ['10th', '12th', 'Graduate'];
 
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
   String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'User name is required';
    }
    if (value.trim().length < 3) {
      return 'User name must be at least 3 characters';
    }
    return null;
  }
   String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 10) {
      return 'Password must be at least 10 characters';
    }
 
    int upper = 0, lower = 0, digits = 0, special = 0;
    final specialChars = RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-\[\]/\\+=~`;]');
 
    for (final ch in value.split('')) {
      if (RegExp(r'[A-Z]').hasMatch(ch)) {
        upper++;
      } else if (RegExp(r'[a-z]').hasMatch(ch)) {
        lower++;
      } else if (RegExp(r'[0-9]').hasMatch(ch)) {
        digits++;
      } else if (specialChars.hasMatch(ch)) {
        special++;
      }
    }
 
    if (upper < 3) return 'Password needs at least 3 uppercase letters';
    if (lower < 3) return 'Password needs at least 3 lowercase letters';
    if (digits < 2) return 'Password needs at least 2 numbers';
    if (special < 2) return 'Password needs at least 2 special characters';
 
    return null;
  }
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
  Future<void> _pickDateOfBirth() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );
 
    if (picked != null) {
      final TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
 
      setState(() {
        _dob = DateTime(
          picked.year,
          picked.month,
          picked.day,
          time?.hour ?? 0,
          time?.minute ?? 0,
        );
      });
    }
  }
 
  String _formatDob() {
    if (_dob == null) return 'Not selected';
    return '${_dob!.day.toString().padLeft(2, '0')}/'
        '${_dob!.month.toString().padLeft(2, '0')}/'
        '${_dob!.year} '
        '${_dob!.hour.toString().padLeft(2, '0')}:'
        '${_dob!.minute.toString().padLeft(2, '0')}';
  }
  void _submitForm() {
    final isFormValid = _formKey.currentState!.validate();
 
    if (_qualifications.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one qualification')),
      );
      return;
    }
 
    if (_dob == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your Date of Birth')),
      );
      return;
    }
 
    if (!isFormValid) {
      return;
    }
 
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DisplayInfoPage(
          userName: _nameController.text.trim(),
          email: _emailController.text.trim(),
          gender: _gender,
          qualifications: List.from(_qualifications),
          city: _city,
          height: _height,
          dob: _formatDob(),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Form')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. User Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                  border: OutlineInputBorder(),
                ),
                validator: _validateName,
              ),
              const SizedBox(height: 16),
 
              // 2. Email
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),
 
              // 3. Password
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  helperText:
                      'Min 10 chars: 3 upper, 3 lower, 2 numbers, 2 special',
                  helperMaxLines: 2,
                  border: OutlineInputBorder(),
                ),
                validator: _validatePassword,
              ),
              const SizedBox(height: 16),
 
              // 4. Re-enter Password
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Re-enter Password',
                  border: OutlineInputBorder(),
                ),
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 20),
 
              // 5. Gender
              const Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Male'),
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) => setState(() => _gender = value!),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Female'),
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (value) => setState(() => _gender = value!),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
 
              // 6. Qualification
              const Text('Qualification',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              ..._qualificationOptions.map((qual) {
                return CheckboxListTile(
                  title: Text(qual),
                  value: _qualifications.contains(qual),
                  contentPadding: EdgeInsets.zero,
                  onChanged: (checked) {
                    setState(() {
                      if (checked == true) {
                        _qualifications.add(qual);
                      } else {
                        _qualifications.remove(qual);
                      }
                    });
                  },
                );
              }),
              const SizedBox(height: 10),
 
              // 7. City
              const Text('City', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                value: _city,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: _cityList
                    .map((city) => DropdownMenuItem(
                          value: city,
                          child: Text(city),
                        ))
                    .toList(),
                onChanged: (value) => setState(() => _city = value!),
              ),
              const SizedBox(height: 20),
 
              // 8. Height
              Text('Height: ${_height.round()} inch',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Slider(
                value: _height,
                min: 48,
                max: 84,
                divisions: 36,
                label: '${_height.round()} inch',
                onChanged: (value) => setState(() => _height = value),
              ),
              const SizedBox(height: 10),
 
              // 9. Date of Birth
              const Text('Date of Birth',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Expanded(child: Text(_formatDob())),
                  ElevatedButton(
                    onPressed: _pickDateOfBirth,
                    child: const Text('Pick Date & Time'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
 
              // 10. Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('Submit', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
class DisplayInfoPage extends StatelessWidget {
  final String userName;
  final String email;
  final String gender;
  final List<String> qualifications;
  final String city;
  final double height;
  final String dob;
 
  const DisplayInfoPage({
    super.key,
    required this.userName,
    required this.email,
    required this.gender,
    required this.qualifications,
    required this.city,
    required this.height,
    required this.dob,
  });
 
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submitted Information')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoRow('User Name', userName),
                _infoRow('Email', email),
                _infoRow('Gender', gender),
                _infoRow('Qualification', qualifications.join(', ')),
                _infoRow('City', city),
                _infoRow('Height', '${height.round()} inch'),
                _infoRow('Date of Birth', dob),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back to Form'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}