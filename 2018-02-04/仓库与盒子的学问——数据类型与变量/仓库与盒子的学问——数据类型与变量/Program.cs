﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace 仓库与盒子的学问__数据类型与变量
{
    class Program
    {
        static void Main(string[] args)
        {
            //调用for语句循环输出数字
            for (int i = 0; i <= 20; i++)					//for循环内的局部变量i
            {
                Console.WriteLine(i.ToString());			//输出0~20的数字
            }
            Console.ReadLine();
        }
    }
}
