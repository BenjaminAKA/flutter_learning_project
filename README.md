# Flutter 学习之旅

这是一个由浅入深的 Flutter 学习项目，包含 9 个核心课程，每个课程都有详细的中文注释和实际示例。

## 📚 学习路径

### 推荐学习顺序

按照以下顺序学习，从基础到进阶，循序渐进：

1. **第1课：基础组件** → 了解 Flutter 最常用的基础组件
2. **第2课：布局组件** → 掌握页面布局的核心技能
3. **第3课：状态管理** → 理解 Flutter 的状态管理机制
4. **第4课：路由导航** → 学习页面跳转和传参
5. **第5课：表单输入** → 掌握用户输入处理
6. **第6课：网络请求** → 学习与后端 API 交互
7. **第7课：本地存储** → 掌握数据持久化
8. **第8课：动画效果** → 学习创建流畅的动画
9. **第9课：自定义组件** → 构建可复用的组件

## 📁 项目结构

```
flutter_learning_project/
├── lib/
│   ├── main.dart                    # 主入口文件，包含课程导航
│   └── lessons/                     # 所有课程文件
│       ├── lesson01_basic_widgets.dart      # 第1课：基础组件
│       ├── lesson02_layout_widgets.dart      # 第2课：布局组件
│       ├── lesson03_state_management.dart    # 第3课：状态管理
│       ├── lesson04_navigation.dart           # 第4课：路由导航
│       ├── lesson05_forms.dart                # 第5课：表单输入
│       ├── lesson06_http_request.dart         # 第6课：网络请求
│       ├── lesson07_local_storage.dart         # 第7课：本地存储
│       ├── lesson08_animations.dart           # 第8课：动画效果
│       └── lesson09_custom_widgets.dart       # 第9课：自定义组件
├── pubspec.yaml                     # 项目依赖配置
└── README.md                        # 本文件
```

## 🚀 快速开始

### 1. 安装依赖

```bash
cd flutter_learning_project
flutter pub get
```

### 2. 运行项目

```bash
flutter run
```

### 3. 开始学习

运行项目后，你会看到一个课程导航页面，点击任意课程即可开始学习。

## 📖 课程详情

### 第1课：基础组件 (`lesson01_basic_widgets.dart`)

**学习目标：**
- 了解 Flutter 中最常用的基础组件
- 掌握 Text、Container、Image 等组件的使用方法
- 理解组件的属性和样式设置

**主要内容：**
- Text 文本组件
- Container 容器组件
- Icon 图标组件
- Image 图片组件
- Button 按钮组件
- Card 卡片组件
- SizedBox 间距组件
- CircleAvatar 圆形头像

**关键概念：**
- Widget 树结构
- 组件的属性设置
- 样式和装饰

---

### 第2课：布局组件 (`lesson02_layout_widgets.dart`)

**学习目标：**
- 掌握 Row、Column、Stack 等布局组件的使用
- 理解主轴和交叉轴的概念
- 学会使用 Expanded、Flexible 等弹性组件

**主要内容：**
- Row 水平布局
- Column 垂直布局
- Expanded 和 Flexible 弹性组件
- Stack 层叠布局
- Wrap 流式布局
- GridView 网格布局

**关键概念：**
- 主轴（Main Axis）和交叉轴（Cross Axis）
- Flex 弹性布局
- 定位和层叠

---

### 第3课：状态管理 (`lesson03_state_management.dart`)

**学习目标：**
- 理解 StatelessWidget 和 StatefulWidget 的区别
- 掌握 setState 的使用方法
- 了解状态的生命周期
- 学会管理组件状态

**主要内容：**
- StatelessWidget vs StatefulWidget
- setState 基础用法
- Switch 开关状态
- 动态改变颜色
- 状态提升（State Lifting）

**关键概念：**
- 有状态 vs 无状态组件
- setState 机制
- 状态提升原则

---

### 第4课：路由导航 (`lesson04_navigation.dart`)

**学习目标：**
- 掌握页面之间的导航方法
- 学习路由传参和接收参数
- 了解命名路由的使用
- 掌握返回上一页的方法

**主要内容：**
- 基础页面跳转（Navigator.push）
- 带参数跳转
- 返回结果（async/await）
- 替换路由（pushReplacement）
- 返回根页面（pushAndRemoveUntil）

**关键概念：**
- Navigator 导航栈
- 路由传参
- 异步返回值

---

### 第5课：表单输入 (`lesson05_forms.dart`)

**学习目标：**
- 掌握 TextField 文本输入框的使用
- 学习 Form 表单的验证
- 了解各种输入控件的使用
- 学会处理表单提交

**主要内容：**
- TextField 和 TextFormField
- 表单验证（validator）
- 密码输入（obscureText）
- 单选按钮（Radio）
- 复选框（Checkbox）
- 滑块（Slider）
- 下拉选择（DropdownButton）

**关键概念：**
- TextEditingController
- Form 表单验证
- 输入类型和键盘

---

### 第6课：网络请求 (`lesson06_http_request.dart`)

**学习目标：**
- 学习使用 http 包进行网络请求
- 掌握 GET 和 POST 请求的使用
- 了解异步编程（async/await）
- 学会处理网络请求的错误

**主要内容：**
- GET 请求示例
- POST 请求示例
- JSON 数据解析
- 错误处理
- 请求状态管理

**关键概念：**
- async/await 异步编程
- HTTP 请求方法
- JSON 序列化和反序列化

**依赖：**
```yaml
dependencies:
  http: ^1.1.0
```

---

### 第7课：本地存储 (`lesson07_local_storage.dart`)

**学习目标：**
- 学习使用 SharedPreferences 存储简单数据
- 掌握文件读写操作
- 了解数据持久化的方法

**主要内容：**
- SharedPreferences 存储字符串
- SharedPreferences 存储数字
- SharedPreferences 存储布尔值
- SharedPreferences 存储列表
- 文件存储（File I/O）

**关键概念：**
- SharedPreferences 键值对存储
- 文件系统操作
- 数据持久化

**依赖：**
```yaml
dependencies:
  shared_preferences: ^2.2.2
  path_provider: ^2.1.1  # 文件存储需要
```

---

### 第8课：动画效果 (`lesson08_animations.dart`)

**学习目标：**
- 学习使用 AnimationController 控制动画
- 掌握 Tween 动画插值
- 了解不同类型的动画（淡入淡出、缩放、旋转、移动）
- 学会使用 AnimatedBuilder 和 AnimatedWidget

**主要内容：**
- AnimationController 动画控制器
- Tween 动画插值
- FadeTransition 淡入淡出
- ScaleTransition 缩放动画
- RotationTransition 旋转动画
- SlideTransition 滑动动画
- AnimatedContainer 隐式动画

**关键概念：**
- AnimationController 生命周期
- Tween 插值器
- Curves 动画曲线
- 显式动画 vs 隐式动画

---

### 第9课：自定义组件 (`lesson09_custom_widgets.dart`)

**学习目标：**
- 学习创建可复用的自定义组件
- 掌握组件的封装和参数传递
- 了解组件的组合使用
- 学会构建复杂的自定义 UI

**主要内容：**
- 简单的自定义组件
- 带参数的自定义组件
- 自定义头像组件
- 自定义列表项组件
- 自定义进度条组件
- 自定义标签组件
- 复合自定义组件

**关键概念：**
- 组件封装
- 参数传递
- 组件组合
- 可复用性设计

---

## 💡 学习建议

1. **循序渐进**：按照课程顺序学习，不要跳课
2. **动手实践**：每学一个知识点，都要自己动手写代码
3. **修改代码**：尝试修改示例代码，看看会发生什么变化
4. **阅读注释**：所有代码都有详细的中文注释，仔细阅读
5. **查阅文档**：遇到不懂的地方，查阅 Flutter 官方文档
6. **多做练习**：学完每课后，尝试自己实现一个小功能

## 🔍 源码阅读顺序

### 入门阶段（第1-3课）

1. **main.dart** - 了解应用入口和导航结构
2. **lesson01_basic_widgets.dart** - 熟悉基础组件
3. **lesson02_layout_widgets.dart** - 理解布局原理
4. **lesson03_state_management.dart** - 掌握状态管理

### 进阶阶段（第4-6课）

5. **lesson04_navigation.dart** - 学习页面导航
6. **lesson05_forms.dart** - 掌握表单处理
7. **lesson06_http_request.dart** - 学习网络编程

### 高级阶段（第7-9课）

8. **lesson07_local_storage.dart** - 了解数据持久化
9. **lesson08_animations.dart** - 学习动画实现
10. **lesson09_custom_widgets.dart** - 掌握组件封装

## 📝 代码注释说明

所有代码文件都包含详细的中文注释：

- **类注释**：说明类的用途和主要功能
- **方法注释**：解释方法的作用和参数
- **行内注释**：解释关键代码的含义
- **概念说明**：解释重要的 Flutter 概念

## 🛠️ 开发工具推荐

- **IDE**：VS Code 或 Android Studio
- **插件**：Flutter、Dart
- **调试工具**：Flutter DevTools
- **文档**：https://docs.flutter.dev/

## 📚 扩展学习资源

- [Flutter 官方文档](https://docs.flutter.dev/)
- [Dart 语言教程](https://dart.dev/guides)
- [Flutter 中文网](https://flutter.cn/)
- [Flutter 实战](https://book.flutterchina.club/)

## ❓ 常见问题

### Q: 如何运行项目？
A: 在项目目录下运行 `flutter run` 命令。

### Q: 依赖安装失败怎么办？
A: 检查网络连接，或使用国内镜像源。

### Q: 代码报错怎么办？
A: 检查是否安装了所有依赖（`flutter pub get`），查看错误信息定位问题。

### Q: 如何修改代码？
A: 直接编辑对应的课程文件，使用热重载（Hot Reload）查看效果。

## 🎯 学习目标

完成所有课程后，你将能够：

- ✅ 熟练使用 Flutter 基础组件
- ✅ 掌握 Flutter 布局技巧
- ✅ 理解 Flutter 状态管理
- ✅ 实现页面导航和传参
- ✅ 处理用户输入和表单
- ✅ 进行网络请求和数据交互
- ✅ 实现数据持久化
- ✅ 创建流畅的动画效果
- ✅ 构建可复用的自定义组件

本项目仅供学习使用。

---

**祝你学习愉快！🎉**

如有问题，欢迎查阅 Flutter 官方文档或相关社区。
