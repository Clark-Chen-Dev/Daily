using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace 按引用传递引用类型
{
    class MyInfo
    {
        public string MyName;//定义一个字符串类型变量存储用户姓名
        public int MyAge;//定义一个整数类型变量存储用户年龄
        public MyInfo(string name, int age)//创建一个带参数的构造函数
        {
            MyName = name;
            MyAge = age;
        }
        public MyInfo() { }//默认构造函数
        public void PrintInfo()//创建一个公有方法输出用户年龄信息
        {
            Console.WriteLine("{0}年龄是{1}岁", MyName, MyAge);
        }
    }

    class Program
    {
        public static void SendAPersonByValue(ref MyInfo info)
        {
            info.MyAge = 99;//改变'info'的值
            info = new MyInfo("顾丽丽", 25);//”info”现在指向了堆上的一个新对象
        }

        static void Main(string[] args)
        {
            Console.WriteLine("输出用户年龄信息：");
            MyInfo fred = new MyInfo("房大伟", 29);
            Console.WriteLine("未改变用户信息前");
            fred.PrintInfo();
            SendAPersonByValue(ref fred);
            Console.WriteLine("改变后的用户年龄信息：");
            fred.PrintInfo();
        }
    }
}
