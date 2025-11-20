import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

/// 本地存储
///
/// 学习目标：
/// 1. 学习使用SharedPreferences存储简单数据
/// 2. 掌握文件读写操作
/// 3. 了解数据持久化的方法
///
/// 注意：使用前需要在pubspec.yaml中添加依赖：
/// dependencies:
///   shared_preferences: ^2.2.2
class Lesson07LocalStorage extends StatefulWidget {
  const Lesson07LocalStorage({super.key});

  @override
  State<Lesson07LocalStorage> createState() => _Lesson07LocalStorageState();
}

class _Lesson07LocalStorageState extends State<Lesson07LocalStorage> {
  // SharedPreferences实例
  SharedPreferences? _prefs;

  // 存储的值
  String _storedString = '';
  int _storedInt = 0;
  bool _storedBool = false;
  List<String> _storedList = [];

  // 文件内容
  String _fileContent = '';

  @override
  void initState() {
    super.initState();
    // 初始化SharedPreferences
    _initPrefs();
    // 加载已保存的数据
    _loadData();
  }

  /// 初始化SharedPreferences
  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {});
  }

  /// 加载已保存的数据
  Future<void> _loadData() async {
    if (_prefs == null) return;

    setState(() {
      _storedString = _prefs!.getString('my_string') ?? '';
      _storedInt = _prefs!.getInt('my_int') ?? 0;
      _storedBool = _prefs!.getBool('my_bool') ?? false;
      _storedList = _prefs!.getStringList('my_list') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('第7课：本地存储')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== SharedPreferences 存储字符串 ==========
            _buildSectionTitle('1. SharedPreferences - 存储字符串'),
            _buildStringStorageExample(),
            const SizedBox(height: 30),

            // ========== SharedPreferences 存储数字 ==========
            _buildSectionTitle('2. SharedPreferences - 存储数字'),
            _buildIntStorageExample(),
            const SizedBox(height: 30),

            // ========== SharedPreferences 存储布尔值 ==========
            _buildSectionTitle('3. SharedPreferences - 存储布尔值'),
            _buildBoolStorageExample(),
            const SizedBox(height: 30),

            // ========== SharedPreferences 存储列表 ==========
            _buildSectionTitle('4. SharedPreferences - 存储列表'),
            _buildListStorageExample(),
            const SizedBox(height: 30),

            // ========== 文件存储 ==========
            _buildSectionTitle('5. 文件存储'),
            _buildFileStorageExample(),
            const SizedBox(height: 30),

            // ========== 清除所有数据 ==========
            _buildSectionTitle('6. 清除数据'),
            _buildClearDataExample(),
          ],
        ),
      ),
    );
  }

  /// 字符串存储示例
  Widget _buildStringStorageExample() {
    final controller = TextEditingController(text: _storedString);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: '输入要保存的字符串',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_prefs == null) return;
                    await _prefs!.setString('my_string', controller.text);
                    _loadData();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('保存成功')));
                  },
                  child: const Text('保存'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    if (_prefs == null) return;
                    await _prefs!.remove('my_string');
                    controller.clear();
                    _loadData();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('已删除')));
                  },
                  child: const Text('删除'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('已保存的值: $_storedString'),
          ],
        ),
      ),
    );
  }

  /// 数字存储示例
  Widget _buildIntStorageExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('当前值: $_storedInt'),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (_prefs == null) return;
                    final newValue = _storedInt + 1;
                    await _prefs!.setInt('my_int', newValue);
                    _loadData();
                  },
                  child: const Text('+1'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    if (_prefs == null) return;
                    final newValue = _storedInt - 1;
                    await _prefs!.setInt('my_int', newValue);
                    _loadData();
                  },
                  child: const Text('-1'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    if (_prefs == null) return;
                    await _prefs!.remove('my_int');
                    _loadData();
                  },
                  child: const Text('重置'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 布尔值存储示例
  Widget _buildBoolStorageExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('开关状态'),
              value: _storedBool,
              onChanged: (value) async {
                if (_prefs == null) return;
                await _prefs!.setBool('my_bool', value);
                _loadData();
              },
            ),
            Text('当前值: $_storedBool'),
          ],
        ),
      ),
    );
  }

  /// 列表存储示例
  Widget _buildListStorageExample() {
    final controller = TextEditingController();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: '输入列表项',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    if (_prefs == null || controller.text.isEmpty) return;
                    final newList = List<String>.from(_storedList);
                    newList.add(controller.text);
                    await _prefs!.setStringList('my_list', newList);
                    controller.clear();
                    _loadData();
                  },
                  child: const Text('添加'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_storedList.isEmpty)
              const Text('列表为空')
            else
              ..._storedList.asMap().entries.map((entry) {
                return ListTile(
                  title: Text('${entry.key + 1}. ${entry.value}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      if (_prefs == null) return;
                      final newList = List<String>.from(_storedList);
                      newList.removeAt(entry.key);
                      await _prefs!.setStringList('my_list', newList);
                      _loadData();
                    },
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  /// 文件存储示例
  Widget _buildFileStorageExample() {
    final controller = TextEditingController(text: _fileContent);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: '文件内容',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // 获取应用文档目录
                      final directory = await _getDocumentsDirectory();
                      final file = File('${directory.path}/my_file.txt');

                      // 写入文件
                      await file.writeAsString(controller.text);

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('文件保存成功')));
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('保存失败: $e')));
                    }
                  },
                  child: const Text('保存到文件'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      final directory = await _getDocumentsDirectory();
                      final file = File('${directory.path}/my_file.txt');

                      if (await file.exists()) {
                        // 读取文件
                        final content = await file.readAsString();
                        controller.text = content;
                        setState(() {
                          _fileContent = content;
                        });
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('文件读取成功')));
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('文件不存在')));
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('读取失败: $e')));
                    }
                  },
                  child: const Text('从文件读取'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '注意：文件存储需要path_provider包，\n'
                  '实际项目中需要先添加依赖。',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  /// 清除数据示例
  Widget _buildClearDataExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '清除所有SharedPreferences数据',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                if (_prefs == null) return;
                await _prefs!.clear();
                _loadData();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('所有数据已清除')));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('清除所有数据'),
            ),
          ],
        ),
      ),
    );
  }

  /// 获取文档目录（示例方法，实际需要path_provider包）
  Future<Directory> _getDocumentsDirectory() async {
    // 这是一个示例方法
    // 实际使用时需要导入path_provider包：
    // import 'package:path_provider/path_provider.dart';
    // final directory = await getApplicationDocumentsDirectory();

    // 这里返回临时目录作为示例
    return Directory.systemTemp;
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }
}
