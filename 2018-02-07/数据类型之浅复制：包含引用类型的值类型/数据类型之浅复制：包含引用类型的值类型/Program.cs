using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace 数据类型之浅复制_包含引用类型的值类型
{
    class ShapeInfo                 //创建一个引用（类）类型
    {
        public string infoString;
        public ShapeInfo(string info)//带参数的构造函数
        {
            infoString = info;
        }
    }

    struct MyRectangle                     //创建一个值类型（结构类型）
    {
        public ShapeInfo rectInfo;
        public int top, left, right, bottom;

        public MyRectangle(string info)
        {
            rectInfo = new ShapeInfo(info);
            top = left = 11;
            bottom = right = 110;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("创建第一个MyRectangle变量 r1");
            MyRectangle r1 = new MyRectangle("这是我创建的第一个MyRectangle对象");
            Console.WriteLine("现在将一个新的MyRectangle赋值给r1");
            MyRectangle r2 = r1;
            Console.WriteLine("改变r2的值");
            r2.rectInfo.infoString = "这是一个新的字符串信息";//改变类对象中的信息字符串值
            r2.bottom = 120;//改变结构类型中的bottom值
            Console.WriteLine("改变后的新值：");
            Console.WriteLine("->r1.rectInfo.infoString:{0}", r1.rectInfo.infoString);
            Console.WriteLine("->r2.rectInfo.infoString:{0}", r2.rectInfo.infoString);
            Console.WriteLine("->r1.botton:{0}", r1.bottom);
            Console.WriteLine("->r2.botton:{0}", r2.bottom);
        }
    }
}
