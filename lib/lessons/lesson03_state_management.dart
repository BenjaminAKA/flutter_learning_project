import 'package:flutter/material.dart';

/// 状态管理
///
/// 学习目标：
/// 1. 理解StatelessWidget和StatefulWidget的区别
/// 2. 掌握setState的使用方法
/// 3. 了解状态的生命周期
/// 4. 学会管理组件状态

class Lesson03StateManagement extends StatefulWidget {
  const Lesson03StateManagement({super.key});

  @override
  State<Lesson03StateManagement> createState() =>
      _Lesson03StateManagementState();
}

/// StatefulWidget的状态类
///
/// 当需要管理可变状态时，使用StatefulWidget
/// State对象在widget树重建时会被保留，因此可以保存状态
class _Lesson03StateManagementState extends State<Lesson03StateManagement> {
  //计数器状态变量
  int _counter = 0;

  //开关状态变量
  bool _isSwitched = false;

  //选中的颜色索引
  int _selectedColorIndex = 0;

  //颜色列表
  final List<Color> _colors = [
    Colors.redAccent,
    Colors.amber,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.deepOrangeAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('状态管理')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== setState 基础示例 ==========
            _buildSectionTitle('1. setState 基础用法'),
            _buildCounterExample(),
            const SizedBox(height: 30),

            // ========== Switch 开关示例 ==========
            _buildSectionTitle('2. Switch 开关状态'),
            _buildSwitchExample(),
            const SizedBox(height: 30),

            // ========== 颜色选择示例 ==========
            _buildSectionTitle('3. 动态改变颜色'),
            _buildColorSelectorExample(),
            const SizedBox(height: 30),

            // ========== 状态提升示例 ==========
            _buildSectionTitle('4. 状态提升（State Lifting）'),
            _buildStateLiftingExample(),
            const SizedBox(height: 30),
          ],
        ),
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

  /// 计数器示例
  Widget _buildCounterExample() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '计数器：$_counter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // setState：通知Flutter框架状态已改变，需要重新构建UI
                    // 只有在setState中修改状态，UI才会更新
                    setState(() {
                      // 减少计数
                      _counter--;
                    });
                  },
                  child: Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // 增加计数
                      _counter++;
                    });
                  },
                  child: Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // 重置计数
                      _counter = 0;
                    });
                  },
                  child: Text('重置'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              '说明：每次点击按钮都会调用setState，\n'
              'Flutter会重新构建这个Widget树\n'
              '从而更新显示的数据',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  ///Switch开关示例
  Widget _buildSwitchExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('开关状态', style: TextStyle(fontSize: 16.0)),
                Switch(
                  value: _isSwitched,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitched = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 100,
              color: _isSwitched ? Colors.green.shade200 : Colors.grey.shade200,
              child: Center(
                child: Text(
                  _isSwitched ? '开关已打开' : '开关已关闭',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSelectorExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: _colors[_selectedColorIndex],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  '当前颜色：${_colors[_selectedColorIndex].toString()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              children: List.generate(
                _colors.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColorIndex = index;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: _colors[index],
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: _selectedColorIndex == index
                            ? Colors.black
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 状态提升示例
  Widget _buildStateLiftingExample() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '状态提升：将状态从子组件提升到父组件管理',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const LiftedCounter(),
            const SizedBox(height: 16),
            const Text(
              '说明：_LiftedCounter是一个独立的StatefulWidget，\n'
              '它管理自己的状态，可以在任何地方复用。',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

/// 状态提升示例：独立的计数器组件
///
/// 这个组件管理自己的状态，可以在多个地方复用
class LiftedCounter extends StatefulWidget {
  const LiftedCounter({super.key});

  @override
  State<LiftedCounter> createState() => _LiftedCounterState();
}

class _LiftedCounterState extends State<LiftedCounter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('独立计数器：$_count', style: TextStyle(fontSize: 16)),
          ElevatedButton(
            onPressed: () => setState(() {
              _count++;
            }),
            child: const Text('+'),
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              _count--;
            }),
            child: const Text('-'),
          ),
        ],
      ),
    );
  }
}
