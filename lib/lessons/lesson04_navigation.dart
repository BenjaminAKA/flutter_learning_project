import 'package:flutter/material.dart';

/// 路由导航
///
/// 学习目标：
/// 1. 掌握页面之间的导航方法
/// 2. 学习路由传参和接收参数
/// 3. 了解命名路由的使用
/// 4. 掌握返回上一页的方法
class Lesson04Navigation extends StatelessWidget {
  const Lesson04Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('路由导航')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // ========== 基础导航 ==========
          _buildSectionTitle('1. 基础页面跳转'),
          _buildNavigationCard(
            context,
            title: '跳转到详情页',
            description: '使用Navigation.push进行页面跳转',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const DetailPage(title: '详情页', content: '这是从首页跳转过来的详情页'),
              ),
            ),
          ),

          // ========== 带参数跳转 ==========
          _buildSectionTitle('2. 带参数跳转'),
          _buildNavigationCard(
            context,
            title: '跳转用户信息页',
            description: '传递用户ID和姓名',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const UserInfoPage(userId: '12345', userName: '张三'),
              ),
            ),
          ),

          // ========== 返回结果 ==========
          _buildSectionTitle('3. 返回结果'),
          _buildNavigationCard(
            context,
            title: '选择颜色',
            description: '跳转到颜色选择页，并接收返回结果',
            // async/await：异步等待返回结果
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ColorPickerPage(),
                ),
              );
              // 如果返回了结果，显示提示
              if (result != null && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('你选择的颜色是：$result'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
          // ========== 替换路由 ==========
          _buildSectionTitle('4. 替换路由'),
          _buildNavigationCard(
            context,
            title: '替换当前页面',
            description: '使用pushReplacement替换当前页面',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ReplacedPage()),
            ),
          ),

          // ========== 返回根页面 ==========
          _buildSectionTitle('5. 返回根页面'),
          _buildNavigationCard(
            context,
            title: '返回首页',
            description: '使用pushAndRemoveUntil清除所有页面',
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              // 移除所有之前的路由
              (route) => false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationCard(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  //构建章节标题
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrangeAccent,
        ),
      ),
    );
  }
}

///带传参的详情页
class DetailPage extends StatelessWidget {
  final String title;
  final String content;

  const DetailPage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('返回上一页'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///带传参的用户信息页
class UserInfoPage extends StatelessWidget {
  final String userId;
  final String userName;

  const UserInfoPage({super.key, required this.userId, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('用户信息')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '用户ID:',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      userId,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      '用户姓名:',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 颜色选择页（返回结果）
class ColorPickerPage extends StatelessWidget {
  const ColorPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      {'name': '红色', 'color': Colors.redAccent},
      {'name': '黄色', 'color': Colors.amber},
      {'name': '蓝色', 'color': Colors.blueAccent},
      {'name': '绿色', 'color': Colors.green},
      {'name': '紫色', 'color': Colors.purpleAccent},
    ];
    return Scaffold(
      appBar: AppBar(title: Text('选择颜色')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final item = colors[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              trailing: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: item['color'] as Color,
                  shape: BoxShape.circle,
                ),
              ),
              title: Text(item['name'] as String),
              onTap: () => Navigator.pop(context, item['name']),
            ),
          );
        },
      ),
    );
  }
}

/// 替换页面示例
class ReplacedPage extends StatelessWidget {
  const ReplacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('替换后的页面')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('这是替换后的页面', style: TextStyle(fontSize: 18.0)),
            const SizedBox(height: 20),
            const Text(
              '点击返回按钮会返回到首页，\n'
              '而不是被替换的页面',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 首页（用于返回根页面示例）
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: const Center(child: Text('这是首页', style: TextStyle(fontSize: 24))),
    );
  }
}
