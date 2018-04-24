using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace 数据类型之值类型的使用
{
    struct MyInfo
    {
        public string myName;
        public string myAge;
        public string myQQ;
        public string myAdd;
        public string myPostID;
    }
    class Program
    {
        static void Main(string[] args)
        {
            MyInfo myinfo;//声明结构类型变量myinfo
            myinfo.myName = "房大伟";
            myinfo.myAge = "29";
            myinfo.myQQ = "44673626";
            myinfo.myAdd = "吉林省长春市";
            myinfo.myPostID = "130031";
            Console.WriteLine("姓名={0}\n年龄={1}岁\n\0Q\0Q={2}\n地址={3}\n邮编={4}\n", myinfo.myName, myinfo.myAge, myinfo.myQQ, myinfo.myAdd, myinfo.myPostID);
            Console.ReadLine();
        }
    }
}
