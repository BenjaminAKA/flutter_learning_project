import 'package:flutter/material.dart';

/// 表单输入
///
/// 学习目标：
/// 1. 掌握TextField文本输入框的使用
/// 2. 学习Form表单的验证
/// 3. 了解各种输入控件的使用
/// 4. 学会处理表单提交
class Lesson05Forms extends StatefulWidget {
  const Lesson05Forms({super.key});

  @override
  State<Lesson05Forms> createState() => _Lesson05FormsState();
}

class _Lesson05FormsState extends State<Lesson05Forms> {
  // 表单的全局Key，用于访问FormState
  final _formKey = GlobalKey<FormState>();

  // 文本控制器：用于获取和设置TextField的值
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  // 密码是否隐藏
  bool _obscurePassword = true;

  // 选中的性别
  String _selectedGender = '男';

  // 滑块值
  double _sliderValue = 50.0;

  // 是否同意条款
  bool _agreeTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('表单输入')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ========== TextField 基础用法 ==========
              _buildSectionTitle('1. TextField 文本输入'),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '姓名',
                  hintText: '请输入姓名',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                // validator：验证函数，返回null表示验证通过，返回字符串表示错误信息
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入姓名';
                  }
                  if (value.length < 2) {
                    return '姓名至少两个字符';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // ========== 邮箱输入 ==========
              _buildSectionTitle('2. 邮箱输入（带验证）'),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: '邮箱',
                  hintText: 'example@email.com',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入邮箱';
                  }
                  // 简单的邮箱格式验证
                  if (!value.contains('@') || !value.contains('.')) {
                    return '请输入有效的邮箱地址';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // ========== 密码输入 ==========
              _buildSectionTitle('3. 密码输入（可切换显示）'),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () => setState(() {
                      _obscurePassword = !_obscurePassword;
                    }),
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入密码';
                  }
                  if (value.length < 6) {
                    return '密码至少6个字符';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // ========== 电话号码输入 ==========
              _buildSectionTitle('4. 电话号码输入'),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: '电话号码',
                  hintText: '请输入11位手机号',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入电话号码';
                  }
                  if (value.length != 11) {
                    return '请输入11位手机号';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // ========== 单选按钮 ==========
              _buildSectionTitle('5. 单选按钮（Radio）'),
              Row(
                children: [
                  const Text('性别：'),
                  RadioGroup<String>(
                    groupValue: _selectedGender,
                    onChanged: (value) => setState(() {
                      _selectedGender = value!;
                    }),
                    child: Row(
                      children: [
                        Radio<String>(value: '男'),
                        const Text('男'),
                        Radio<String>(value: '女'),
                        const Text('女'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // ========== 滑块 ==========
              _buildSectionTitle('6. 滑块（Slider）'),
              Text('当前值: ${_sliderValue.toInt()}'),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                //分成10段
                divisions: 10,
                label: _sliderValue.toInt().toString(),
                onChanged: (value) => setState(() {
                  _sliderValue = value;
                }),
              ),
              const SizedBox(height: 20),
              // ========== 复选框 ==========
              _buildSectionTitle('7. 复选框（Checkbox）'),
              CheckboxListTile(
                title: const Text('我同意用户协议和隐私政策'),
                value: _agreeTerms,
                onChanged: (value) {
                  setState(() {
                    _agreeTerms = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 20),
              // ========== 下拉选择 ==========
              _buildSectionTitle('8. 下拉选择（DropdownButton）'),
              _buildDropdownExample(),
              const SizedBox(height: 30),

              // ========== 提交按钮 ==========
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('提交表单', style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 20),
              // ========== 显示输入的值 ==========
              _buildSectionTitle('9. 当前输入的值'),
              _buildCurrentValues(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

  String _selectedCity = 'Beijing';

  /// 下拉选择示例
  Widget _buildDropdownExample() {
    final List<String> cities = [
      'Beijing',
      'Shanghai',
      'Guangzhou',
      'Shenzhen',
      'Hangzhou',
    ];
    return DropdownButtonFormField(
      initialValue: _selectedCity,
      decoration: InputDecoration(
        labelText: '选择城市',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      items: cities.map((city) {
        return DropdownMenuItem(value: city, child: Text(city));
      }).toList(),
      onChanged: (value) => setState(() {
        _selectedCity = value!;
      }),
    );
  }

  /// 显示当前输入的值
  Widget _buildCurrentValues() {
    return Card(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "姓名：${_nameController.text.isEmpty ? "未输入" : _nameController.text}",
            ),
            Text(
              "邮箱：${_emailController.text.isEmpty ? "未输入" : _emailController.text}",
            ),
            Text("密码：${_passwordController.text.isEmpty ? "未输入" : "******"}"),
            Text(
              "手机号：${_phoneController.text.isEmpty ? "未输入" : _phoneController.text}",
            ),
            Text("性别：$_selectedGender"),
            Text("城市：$_selectedCity"),
            Text("滑块值：${_sliderValue.toInt()}"),
            Text("同意条款：${_agreeTerms ? "是" : "否"}"),
          ],
        ),
      ),
    );
  }

  /// 提交表单
  void _submitForm() {
    //验证表单
    if (_formKey.currentState!.validate()) {
      //检查是否同意条款
      if (!_agreeTerms) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('请先同意用户协议')));
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '提交成功\n'
            '姓名：${_nameController.text}\n'
            '邮箱：${_emailController.text}\n'
            '性别：$_selectedGender\n'
            '性别：$_selectedCity\n',
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
