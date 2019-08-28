//
//  SwiftNotes.h
//  MonthSwift
//
//  Created by MaYiKe on 2019/8/26.
//  Copyright © 2019 GG. All rights reserved.
//

/*
  -
 (_) 表示忽略不使用的参数标签
 
 ? !
 (? !)语法糖
 ？不确定有值的时候
 ！确定有值的时候
 
 
 @objc
 (@objc)可供oc调用 在协议有@optional修饰时  必须用@objc
 
 
 问号？
 a.声明时添加？，告诉编译器这个是Optional的，如果声明时没有手动初始化，就自动初始化为nil
 b.在对变量值操作前添加？，判断如果变量时nil，则不响应后面的方法。
 叹号！
 a.声明时添加！，告诉编译器这个是Optional的，并且之后对该变量操作的时候，都隐式的在操作前添加！
 b.在对变量操作前添加！，表示默认为非nil，直接解包进行处理
 */
