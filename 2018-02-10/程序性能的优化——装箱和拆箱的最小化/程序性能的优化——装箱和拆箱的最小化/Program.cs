using System;
using System.Collections;

namespace 程序性能的优化__装箱和拆箱的最小化
{
    class Program
    {
        static void Main(string[] args)
        {
            //将int装箱进ArrayList
            ArrayList arr = new ArrayList();
            arr.Add(3);
            arr.Add(5.66);
            arr.Add("Test");
            int result1 = (int)arr[0]; //从ArrayList中拆箱第一项 
            Console.WriteLine("数组第一个元素的值：{0}", result1);
            double result2 = (double)arr[1];//从ArrayList中拆箱第二项
            Console.WriteLine("数组第二个元素的值：{0}", result2);
        }
    }
}
