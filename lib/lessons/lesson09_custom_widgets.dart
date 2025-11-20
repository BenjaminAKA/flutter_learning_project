import 'package:flutter/material.dart';

/// 自定义组件
///
/// 学习目标：
/// 1. 学习创建可复用的自定义组件
/// 2. 掌握组件的封装和参数传递
/// 3. 了解组件的组合使用
/// 4. 学会构建复杂的自定义UI
class Lesson09CustomWidgets extends StatelessWidget {
  const Lesson09CustomWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('第9课：自定义组件'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ========== 简单的自定义组件 ==========
            _buildSectionTitle('1. 简单的自定义组件'),
            const CustomCard(
              title: '自定义卡片',
              content: '这是一个简单的自定义卡片组件',
              icon: Icons.star,
            ),
            const SizedBox(height: 20),

            // ========== 带参数的自定义组件 ==========
            _buildSectionTitle('2. 带参数的自定义组件'),
            const CustomButton(
              text: '主要按钮',
              type: ButtonType.primary,
            ),
            const SizedBox(height: 10),
            const CustomButton(
              text: '次要按钮',
              type: ButtonType.secondary,
            ),
            const SizedBox(height: 10),
            const CustomButton(
              text: '危险按钮',
              type: ButtonType.danger,
            ),
            const SizedBox(height: 30),

            // ========== 自定义头像组件 ==========
            _buildSectionTitle('3. 自定义头像组件'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CustomAvatar(
                  name: '张三',
                  size: 60,
                ),
                CustomAvatar(
                  name: '李四',
                  size: 80,
                  backgroundColor: Colors.green,
                ),
                CustomAvatar(
                  name: '王五',
                  size: 100,
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 30),

            // ========== 自定义列表项组件 ==========
            _buildSectionTitle('4. 自定义列表项组件'),
            const CustomListItem(
              title: '标题一',
              subtitle: '这是副标题',
              leadingIcon: Icons.home,
              trailingText: '详情',
            ),
            const CustomListItem(
              title: '标题二',
              subtitle: '这是副标题',
              leadingIcon: Icons.favorite,
              trailingText: '详情',
            ),
            const CustomListItem(
              title: '标题三',
              subtitle: '这是副标题',
              leadingIcon: Icons.settings,
              trailingText: '详情',
            ),
            const SizedBox(height: 30),

            // ========== 自定义进度条组件 ==========
            _buildSectionTitle('5. 自定义进度条组件'),
            const CustomProgressBar(
              label: '进度',
              progress: 0.6,
              color: Colors.blue,
            ),
            const SizedBox(height: 10),
            const CustomProgressBar(
              label: '完成度',
              progress: 0.8,
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            const CustomProgressBar(
              label: '加载中',
              progress: 0.3,
              color: Colors.orange,
            ),
            const SizedBox(height: 30),

            // ========== 自定义标签组件 ==========
            _buildSectionTitle('6. 自定义标签组件'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: const [
                CustomTag(text: '标签一', color: Colors.blue),
                CustomTag(text: '标签二', color: Colors.green),
                CustomTag(text: '标签三', color: Colors.orange),
                CustomTag(text: '标签四', color: Colors.purple),
                CustomTag(text: '标签五', color: Colors.red),
              ],
            ),
            const SizedBox(height: 30),

            // ========== 复合自定义组件 ==========
            _buildSectionTitle('7. 复合自定义组件'),
            const CustomProductCard(
              productName: 'Flutter开发指南',
              price: 99.0,
              originalPrice: 129.0,
              imageUrl: 'https://picsum.photos/200/150',
              rating: 4.5,
            ),
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
          color: Colors.cyan,
        ),
      ),
    );
  }
}

/// 自定义卡片组件
///
/// 这是一个简单的自定义组件示例
/// 展示了如何封装常用的UI结构
class CustomCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const CustomCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 按钮类型枚举
enum ButtonType { primary, secondary, danger }

/// 自定义按钮组件
///
/// 展示了如何根据参数改变组件的外观
class CustomButton extends StatelessWidget {
  final String text;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.text,
    required this.type,
  });

  Color get _backgroundColor {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.grey;
      case ButtonType.danger:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$text 被点击了')),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _backgroundColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(text),
      ),
    );
  }
}

/// 自定义头像组件
///
/// 根据姓名生成头像，显示首字母
class CustomAvatar extends StatelessWidget {
  final String name;
  final double size;
  final Color backgroundColor;

  const CustomAvatar({
    super.key,
    required this.name,
    this.size = 50,
    this.backgroundColor = Colors.blue,
  });

  String get _initial {
    if (name.isEmpty) return '?';
    return name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: backgroundColor,
      child: Text(
        _initial,
        style: TextStyle(
          color: Colors.white,
          fontSize: size * 0.4,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// 自定义列表项组件
class CustomListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final String trailingText;

  const CustomListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
    required this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Icon(leadingIcon, color: Colors.blue),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          trailingText,
          style: const TextStyle(color: Colors.blue),
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title 被点击了')),
          );
        },
      ),
    );
  }
}

/// 自定义进度条组件
class CustomProgressBar extends StatelessWidget {
  final String label;
  final double progress; // 0.0 到 1.0
  final Color color;

  const CustomProgressBar({
    super.key,
    required this.label,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text('${(progress * 100).toInt()}%'),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}

/// 自定义标签组件
class CustomTag extends StatelessWidget {
  final String text;
  final Color color;

  const CustomTag({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// 自定义商品卡片组件（复合组件）
///
/// 这个组件组合了多个子组件，展示了如何构建复杂的自定义UI
class CustomProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final double rating;

  const CustomProductCard({
    super.key,
    required this.productName,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 商品图片
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.image, size: 50),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 商品名称
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // 评分
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Icon(
                        index < rating.floor()
                            ? Icons.star
                            : index < rating
                            ? Icons.star_half
                            : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      );
                    }),
                    const SizedBox(width: 8),
                    Text(
                      rating.toString(),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // 价格
                Row(
                  children: [
                    Text(
                      '¥${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '¥${originalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

