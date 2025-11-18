import 'package:flutter/material.dart';

/// 布局组件
///
/// 学习目标：
/// 1. 掌握Row、Column、Stack等布局组件的使用
/// 2. 理解主轴和交叉轴的概念
/// 3. 学会使用Expanded、Flexible等弹性组件
/// 4. 掌握Positioned、Align等定位组件
class Lesson02LayoutWidgets extends StatelessWidget {
  const Lesson02LayoutWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('布局组件')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== Row 水平布局 ==========
            _buildSectionTitle('1.Row 水平布局组件'),
            _buildRowExample(),
            SizedBox(height: 30),
            // ========== Column 垂直布局 ==========
            _buildSectionTitle('2. Column 垂直布局组件'),
            _buildColumnExample(),
            const SizedBox(height: 30),
            // ========== Expanded 弹性组件 ==========
            _buildSectionTitle('3. Expanded 弹性组件'),
            _buildExpandedExample(),
            const SizedBox(height: 30),
            // ========== Stack 层叠布局 ==========
            _buildSectionTitle('4. Stack 层叠布局组件'),
            _buildStackExample(),
            const SizedBox(height: 30),
            // ========== Wrap 流式布局 ==========
            _buildSectionTitle('5. Wrap 流式布局组件'),
            _buildWrapExample(),
            const SizedBox(height: 30),
            // ========== GridView 网格布局 ==========
            _buildSectionTitle('6. GridView 网格布局组件'),
            _buildGridViewExample(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  ///Row示例
  Widget _buildRowExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('mainAxisAlignment.star'),
        Row(
          // mainAxisAlignment：主轴对齐方式（Row的主轴是水平方向）
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildColoredBox(Colors.red, '1'),
            _buildColoredBox(Colors.amber, '2'),
            _buildColoredBox(Colors.blue, '3'),
          ],
        ),
        const SizedBox(height: 10),

        const Text('mainAxisAlignment.center'),
        Row(
          // mainAxisAlignment：主轴对齐方式（Row的主轴是水平方向）
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildColoredBox(Colors.red, '1'),
            _buildColoredBox(Colors.amber, '2'),
            _buildColoredBox(Colors.blue, '3'),
          ],
        ),
        const SizedBox(height: 10),

        const Text('mainAxisAlignment.end'),
        Row(
          // mainAxisAlignment：主轴对齐方式（Row的主轴是水平方向）
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildColoredBox(Colors.red, '1'),
            _buildColoredBox(Colors.amber, '2'),
            _buildColoredBox(Colors.blue, '3'),
          ],
        ),
        const SizedBox(height: 10),

        const Text('mainAxisAlignment.spaceBetween'),
        Row(
          // mainAxisAlignment：主轴对齐方式（Row的主轴是水平方向）
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildColoredBox(Colors.red, '1'),
            _buildColoredBox(Colors.amber, '2'),
            _buildColoredBox(Colors.blue, '3'),
          ],
        ),
        const SizedBox(height: 10),

        const Text('mainAxisAlignment.spaceAround'),
        Row(
          // mainAxisAlignment：主轴对齐方式（Row的主轴是水平方向）
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildColoredBox(Colors.red, '1'),
            _buildColoredBox(Colors.amber, '2'),
            _buildColoredBox(Colors.blue, '3'),
          ],
        ),
        const SizedBox(height: 10),

        const Text('mainAxisAlignment.spaceEvenly'),
        Row(
          // mainAxisAlignment：主轴对齐方式（Row的主轴是水平方向）
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildColoredBox(Colors.red, '1'),
            _buildColoredBox(Colors.amber, '2'),
            _buildColoredBox(Colors.blue, '3'),
          ],
        ),
        const SizedBox(height: 10),

        const Text('crossAxisAlignment.center'),
        Row(
          // crossAxisAlignment：交叉轴对齐方式（Row的交叉轴是垂直方向）
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildColoredBox(Colors.red, '1', height: 50),
            _buildColoredBox(Colors.amber, '2', height: 80),
            _buildColoredBox(Colors.blue, '3', height: 60),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  ///Column示例
  Widget _buildColumnExample() {
    return Container(
      height: 300,
      color: Colors.grey.shade100,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              // Column的主轴是垂直方向
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildColoredBox(Colors.red, '1'),
                _buildColoredBox(Colors.amber, '2'),
                _buildColoredBox(Colors.blue, '3'),
              ],
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              // Column的主轴是垂直方向
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildColoredBox(Colors.red, '1'),
                _buildColoredBox(Colors.amber, '2'),
                _buildColoredBox(Colors.blue, '3'),
              ],
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: Column(
              // Column的主轴是垂直方向
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildColoredBox(Colors.red, '1'),
                _buildColoredBox(Colors.amber, '2'),
                _buildColoredBox(Colors.blue, '3'),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  ///Expanded示例
  Widget _buildExpandedExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Expanded 可以让子组件占据剩余的空间'),
        const SizedBox(height: 10),
        Row(
          children: [
            // 固定宽度
            _buildColoredBox(Colors.red, '固定', width: 60),
            // Expanded：占据剩余空间
            Expanded(
              // flex：弹性系数，数值越大占据空间越多
              flex: 2,
              child: _buildColoredBox(Colors.amber, 'Expanded 2'),
            ),

            Expanded(
              // flex=1，占据的空间是上面的一半
              flex: 1,
              child: _buildColoredBox(Colors.blue, 'Expanded 1'),
            ),
          ],
        ),

        const SizedBox(height: 10),
        const Text('Flexible 也可以实现类似效果，但不会强制填充'),
        Row(
          children: [
            // 固定宽度
            _buildColoredBox(Colors.red, '固定', width: 60),
            // Expanded：占据剩余空间
            Flexible(
              // flex：弹性系数，数值越大占据空间越多
              flex: 2,
              child: _buildColoredBox(Colors.amber, 'Flexible 2'),
            ),

            Flexible(
              // flex=1，占据的空间是上面的一半
              flex: 1,
              child: _buildColoredBox(Colors.blue, 'Flexible 1'),
            ),
          ],
        ),
      ],
    );
  }

  ///Stack示例
  Widget _buildStackExample() {
    return Container(
      height: 200,
      color: Colors.grey.shade100,
      child: Stack(
        // Stack：层叠布局，子组件可以重叠
        // alignment：未定位子组件的对齐方式
        alignment: Alignment.center,
        children: [
          // 底层：大容器
          Container(height: 200, width: 200, color: Colors.blue.shade200),
          // 中层：中等容器
          Container(height: 150, width: 150, color: Colors.amber.shade200),
          // 顶层：小容器
          Container(height: 100, width: 100, color: Colors.red.shade200),

          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text('Positioned', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  /// Wrap 示例
  Widget _buildWrapExample() {
    // Wrap：流式布局，当一行放不下时自动换行
    return Wrap(
      // 水平间距
      spacing: 8.0,
      // 垂直间距
      runSpacing: 8.0,
      alignment: WrapAlignment.start,
      children: List.generate(
        10,
        (index) => Chip(
          label: Text('标签：${index + 1}'),
          avatar: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridViewExample() {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 构建带颜色的盒子（辅助方法）
  Widget _buildColoredBox(
    Color color,
    String text, {
    double? height,
    double? width,
  }) {
    return Container(
      width: width ?? 60,
      height: height ?? 60,
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// 构建章节标题
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}
