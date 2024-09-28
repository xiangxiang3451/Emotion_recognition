// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'emotion_analysis_screen.dart';
import 'report_screen.dart';
import 'history_screen.dart';
import 'settings_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // 页面选项列表
  static final List<Widget> _widgetOptions = <Widget>[
    EmotionAnalysisScreen(), // 实时情感分析页面
    ReportScreen(), // 报告页面
    HistoryScreen(), // 历史数据页面
    SettingsScreen(), // 设置页面
  ];

  // 页面切换方法
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emotion Analysis App'),
        centerTitle: true,
        backgroundColor: Colors.white, // 导航栏背景为白色
        elevation: 0, // 去掉阴影
        titleTextStyle: const TextStyle(
          color: Colors.black, // 标题文字为黑色
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, // 图标为黑色
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex), // 根据选中的索引显示相应页面
      ),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: '情感分析',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: '报告',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '历史数据',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '设置',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent, // 选中的项目为蓝色
        unselectedItemColor: Colors.grey[700], // 未选中的项目为深灰色
        backgroundColor: Colors.white, // 底部导航栏背景色为白色
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // 固定模式，确保未选中的图标保持原样
      ),
    );
  }
}
