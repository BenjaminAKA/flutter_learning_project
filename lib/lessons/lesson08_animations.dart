import 'package:flutter/material.dart';

/// 动画效果
///
/// 学习目标：
/// 1. 学习使用AnimationController控制动画
/// 2. 掌握Tween动画插值
/// 3. 了解不同类型的动画（淡入淡出、缩放、旋转、移动）
/// 4. 学会使用AnimatedBuilder和AnimatedWidget
class Lesson08Animations extends StatefulWidget {
  const Lesson08Animations({super.key});

  @override
  State<Lesson08Animations> createState() => _Lesson08AnimationsState();
}

class _Lesson08AnimationsState extends State<Lesson08Animations>
    with SingleTickerProviderStateMixin {
  // AnimationController：动画控制器，用于控制动画的播放、暂停、反转等
  late AnimationController _controller;

  // Animation：动画对象，包含动画的当前值
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // 初始化AnimationController
    // vsync：垂直同步，用于优化动画性能
    // duration：动画持续时间
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // 创建淡入淡出动画
    // Tween：定义动画的起始值和结束值
    _fadeAnimation = Tween<double>(
      begin: 0.0, // 起始值：完全透明
      end: 1.0,   // 结束值：完全不透明
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // 动画曲线：缓入缓出
    ));

    // 创建缩放动画
    _scaleAnimation = Tween<double>(
      begin: 0.5, // 起始值：缩小到50%
      end: 1.0,   // 结束值：正常大小
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut, // 弹性效果
    ));

    // 创建旋转动画
    _rotationAnimation = Tween<double>(
      begin: 0.0,   // 起始值：0度
      end: 2 * 3.14159, // 结束值：360度（2π弧度）
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear, // 线性动画
    ));

    // 创建滑动动画
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // 起始位置：左侧屏幕外
      end: Offset.zero,                 // 结束位置：正常位置
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    // 释放动画控制器资源
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第8课：动画效果'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 动画控制按钮 ==========
            _buildSectionTitle('1. 动画控制'),
            _buildAnimationControls(),
            const SizedBox(height: 30),

            // ========== 淡入淡出动画 ==========
            _buildSectionTitle('2. 淡入淡出动画（Fade）'),
            _buildFadeAnimation(),
            const SizedBox(height: 30),

            // ========== 缩放动画 ==========
            _buildSectionTitle('3. 缩放动画（Scale）'),
            _buildScaleAnimation(),
            const SizedBox(height: 30),

            // ========== 旋转动画 ==========
            _buildSectionTitle('4. 旋转动画（Rotation）'),
            _buildRotationAnimation(),
            const SizedBox(height: 30),

            // ========== 滑动动画 ==========
            _buildSectionTitle('5. 滑动动画（Slide）'),
            _buildSlideAnimation(),
            const SizedBox(height: 30),

            // ========== 组合动画 ==========
            _buildSectionTitle('6. 组合动画'),
            _buildCombinedAnimation(),
            const SizedBox(height: 30),

            // ========== AnimatedContainer ==========
            _buildSectionTitle('7. AnimatedContainer（隐式动画）'),
            _buildAnimatedContainerExample(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// 动画控制按钮
  Widget _buildAnimationControls() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // forward：正向播放动画
                _controller.forward();
              },
              child: const Text('播放'),
            ),
            ElevatedButton(
              onPressed: () {
                // reverse：反向播放动画
                _controller.reverse();
              },
              child: const Text('反向'),
            ),
            ElevatedButton(
              onPressed: () {
                // reset：重置动画
                _controller.reset();
              },
              child: const Text('重置'),
            ),
            ElevatedButton(
              onPressed: () {
                // repeat：重复播放动画
                _controller.repeat();
              },
              child: const Text('重复'),
            ),
          ],
        ),
      ),
    );
  }

  /// 淡入淡出动画
  Widget _buildFadeAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // FadeTransition：淡入淡出动画组件
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  '淡入淡出',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 缩放动画
  Widget _buildScaleAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // ScaleTransition：缩放动画组件
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  '缩放',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 旋转动画
  Widget _buildRotationAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // RotationTransition：旋转动画组件
          child: RotationTransition(
            turns: _rotationAnimation,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  '旋转',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 滑动动画
  Widget _buildSlideAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 150,
          child: Center(
            // SlideTransition：滑动动画组件
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    '滑动',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 组合动画
  Widget _buildCombinedAnimation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          // 使用AnimatedBuilder组合多个动画
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform(
                // 组合旋转和缩放
                transform: Matrix4.identity()
                  ..rotateZ(_rotationAnimation.value)
                  ..scale(_scaleAnimation.value, _scaleAnimation.value),
                alignment: FractionalOffset.center,
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        '组合动画',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// AnimatedContainer示例（隐式动画）
  Widget _buildAnimatedContainerExample() {
    return _AnimatedContainerExample();
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.pink,
        ),
      ),
    );
  }
}

/// AnimatedContainer示例：隐式动画
///
/// AnimatedContainer会自动在属性变化时产生动画效果
/// 不需要手动管理AnimationController
class _AnimatedContainerExample extends StatefulWidget {
  @override
  State<_AnimatedContainerExample> createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<_AnimatedContainerExample> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadius _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // AnimatedContainer：当属性变化时自动产生动画
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              child: const Center(
                child: Text(
                  'AnimatedContainer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _width = _width == 100 ? 200 : 100;
                      _height = _height == 100 ? 200 : 100;
                    });
                  },
                  child: const Text('改变大小'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _color = _color == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: const Text('改变颜色'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _borderRadius = _borderRadius == BorderRadius.circular(8)
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(8);
                    });
                  },
                  child: const Text('改变圆角'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
