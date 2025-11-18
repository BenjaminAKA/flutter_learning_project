import 'package:flutter/material.dart';

/// 基础组件
///
/// 学习目标：
/// 1. 了解Flutter中最常用的基础组件
/// 2. 掌握Text、Container、Image等组件的使用方法
/// 3. 理解组件的属性和样式设置
class Lesson01BasicWidgets extends StatelessWidget {
  const Lesson01BasicWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('基础组件')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== Text 组件 ==========
            _buildSectionTitle('1.Text 文本组件'),
            const Text('这是普通文本', style: TextStyle(fontSize: 16)),
            const Text(
              '这是带样式的文本',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
              '这是多行文本\n第二行\n第三行',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // ========== Container 容器组件 ==========
            _buildSectionTitle('2.Container 容器组件'),
            Container(
              // width：设置宽度，占满父组件宽度
              width: double.infinity,
              // height：设置高度
              height: 100,
              // color：设置背景颜色
              // padding：内边距
              padding: const EdgeInsets.all(16.0),
              // margin：外边距
              margin: const EdgeInsets.only(bottom: 16.0),
              // decoration：装饰器，可以设置更复杂的样式
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                // 设置圆角
                borderRadius: BorderRadius.circular(8),
                // 设置边框
                border: Border.all(color: Colors.blue, width: 2),
              ),
              // child：子组件
              child: const Center(child: Text('Container 容器示例')),
            ),
            _buildSectionTitle('3.Icon 图标组件'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.star, size: 40, color: Colors.orange),
                Icon(Icons.settings, size: 40, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://picsum.photos/200/100',
              width: 200,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Text('图片加载失败');
              },
            ),
            const SizedBox(height: 10),
            // 使用本地资源图片（需要先在pubspec.yaml中配置）
            // Image.asset('assets/images/example.png'),
            const SizedBox(height: 20),
            // ========== Button 按钮组件 ==========
            _buildSectionTitle('5.Button 按钮组件'),
            ElevatedButton(
              // onPressed：点击回调函数
              onPressed: () {
                // 显示提示信息
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('ElevatedButton 被点击了')));
              },
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('OutlinedButton 被点击了')));
              },
              child: const Text('OutlinedButton'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('TextButton 被点击了')),
                );
              },
              child: const Text('TextButton'),
            ),

            const SizedBox(height: 20),
            // ========== Card 卡片组件 ==========
            _buildSectionTitle('6.Card 卡片组件'),
            Card(
              // elevation：阴影高度
              elevation: 4,
              // shape：形状
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '卡片标题',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('这是卡片的内容区域，可以放置任何组件。'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ========== SizedBox 间距组件 ==========
            _buildSectionTitle('7.SizeBox 间距组件'),
            Row(
              children: [
                Container(height: 50, width: 50, color: Colors.red),
                SizedBox(width: 20),
                Container(height: 50, width: 50, color: Colors.blue),
                SizedBox(width: 20),
                Container(height: 50, width: 50, color: Colors.amber),
              ],
            ),
            // ========== CircleAvatar 圆形头像 ==========
            _buildSectionTitle('8.CircleAvatar 圆形头像'),
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  ///构建章节标题
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
