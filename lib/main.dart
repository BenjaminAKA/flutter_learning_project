import 'package:flutter/material.dart';

import 'lessons/lesson01_basic_widgets.dart';
import 'lessons/lesson02_layout_widgets.dart';
import 'lessons/lesson03_state_management.dart';
import 'lessons/lesson04_navigation.dart';
import 'lessons/lesson05_forms.dart';
import 'lessons/lesson06_http_request.dart';
import 'lessons/lesson07_local_storage.dart';
import 'lessons/lesson08_animations.dart';
import 'lessons/lesson09_custom_widgets.dart';

void main() {
  runApp(const FlutterLearningApp());
}

class FlutterLearningApp extends StatelessWidget {
  const FlutterLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tour',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //定义所有课程列表
    final lessons = [
      LessonItem(
        title: '第一课：基础组件',
        description: '学习Text、Container、Image等基础组件使用',
        icon: Icons.text_fields,
        color: Colors.amber,
        route: const Lesson01BasicWidgets(),
      ),
      LessonItem(
        title: '第2课：布局组件',
        description: '学习Row，Column，Stack等布局组件使用',
        icon: Icons.view_column,
        color: Colors.blueAccent,
        route: const Lesson02LayoutWidgets(),
      ),
      LessonItem(
        title: '第3课：状态管理',
        description: '学习StatefulWidget、setState的使用',
        icon: Icons.toggle_on,
        color: Colors.orange,
        route: const Lesson03StateManagement(),
      ),
      LessonItem(
        title: '第4课：路由导航',
        description: '学习页面跳转和路由传',
        icon: Icons.navigation,
        color: Colors.pink,
        route: const Lesson04Navigation(),
      ),
      LessonItem(
        title: '第5课：表单输入',
        description: '学习TextField、Form等表单组件的使用',
        icon: Icons.edit,
        color: Colors.teal,
        route: const Lesson05Forms(),
      ),
      LessonItem(
        title: '第6课：网络请求',
        description: '学习使用http包进行网络请求',
        icon: Icons.cloud_download,
        color: Colors.redAccent,
        route: const Lesson06HttpRequest(),
      ),
      LessonItem(
        title: '第7课：本地存储',
        description: '学习SharedPreferences和文件存储',
        icon: Icons.storage,
        color: Colors.indigo,
        route: const Lesson07LocalStorage(),
      ),
      LessonItem(
        title: '第8课：动画效果',
        description: '学习Animation和Tween的使用',
        icon: Icons.animation,
        color: Colors.cyan,
        route: const Lesson08Animations(),
      ),
      LessonItem(
        title: '第9课：自定义组件',
        description: '学习创建可复用的自定义组件',
        icon: Icons.widgets,
        color: Colors.deepOrangeAccent,
        route: const Lesson09CustomWidgets(),
      ),
    ];

    return Scaffold(
      // AppBar：应用栏，通常显示在屏幕顶部
      appBar: AppBar(
        title: const Text('Flutter Tour'),
        // 设置背景色
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // 设置标题样式
        centerTitle: true,
      ),
      // body：页面主体内容
      body: ListView.builder(
        // 添加内边距
        padding: const EdgeInsets.all(16.0),
        // 设置列表项数量
        itemCount: lessons.length,
        // 构建每个列表项
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return Card(
            // 设置卡片边距
            margin: const EdgeInsets.only(bottom: 12.0),
            // 设置阴影高度
            elevation: 2,
            // 设置圆角
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              // 左侧图标
              leading: CircleAvatar(
                backgroundColor: lesson.color,
                child: Icon(lesson.icon, color: Colors.white),
              ),
              // 标题
              title: Text(
                lesson.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              // 副标题/描述
              subtitle: Text(lesson.description),
              // 右侧箭头图标
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              // 点击事件：导航到对应课程页面
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => lesson.route),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

///列表Item项
class LessonItem {
  //标题
  final String title;

  //描述
  final String description;

  //图标
  final IconData icon;

  //颜色
  final Color color;

  //路由
  final Widget route;

  LessonItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.route,
  });
}
