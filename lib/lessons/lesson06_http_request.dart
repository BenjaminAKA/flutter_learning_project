import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// 网络请求
///
/// 学习目标：
/// 1. 学习使用http包进行网络请求
/// 2. 掌握GET和POST请求的使用
/// 3. 了解异步编程（async/await）
/// 4. 学会处理网络请求的错误
///
/// 注意：使用前需要在pubspec.yaml中添加http依赖：
/// dependencies:
///   http: ^1.1.0
class Lesson06HttpRequest extends StatefulWidget {
  const Lesson06HttpRequest({super.key});

  @override
  State<Lesson06HttpRequest> createState() => _Lesson06HttpRequestState();
}

class _Lesson06HttpRequestState extends State<Lesson06HttpRequest> {
  // 请求状态：idle（空闲）、loading（加载中）、success（成功）、error（错误）
  String _status = 'idle';
  String _responseData = '';
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('网络请求')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== GET 请求示例 ==========
            _buildSectionTitle('1. GET 请求示例'),
            _buildGetRequestExample(),
            const SizedBox(height: 30),

            // ========== POST 请求示例 ==========
            _buildSectionTitle('2. POST 请求示例'),
            _buildPostRequestExample(),
            const SizedBox(height: 30),

            // ========== 请求结果显示 ==========
            _buildSectionTitle('3. 请求结果'),
            _buildResponseDisplay(),
          ],
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
          color: Colors.red,
        ),
      ),
    );
  }

  Widget _buildGetRequestExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GET请求：从服务器获取数据',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _status == 'loading' ? null : _fetchUserData,
              child: const Text('获取用户数据（GET）'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _status == 'loading' ? null : _fetchPosts,
              child: const Text('获取文章列表(GET)'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostRequestExample() {
    return SizedBox(height: 20);
  }

  Widget _buildResponseDisplay() {
    return SizedBox(height: 20);
  }

  /// GET请求：获取用户数据
  ///
  /// async：标记函数为异步函数
  /// await：等待异步操作完成
  Future<void> _fetchUserData() async {
    setState(() {
      _status = 'loading';
      _responseData = '';
      _errorMessage = '';
    });

    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _status = 'success';
          _responseData = const JsonEncoder.withIndent('   ').convert(data);
        });
      } else {
        throw Exception('请求失败：${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _status = 'error';
        _errorMessage = '错误: $e';
      });
    }
  }

  /// GET请求：获取文章列表
  Future<void> _fetchPosts() async {}
}
