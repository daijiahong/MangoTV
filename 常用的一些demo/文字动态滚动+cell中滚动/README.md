# LMJScrollTextView2

**2018.1.3更新（2.1.0）：**               
本次更新在数据源textDataArr中支持了NSAttributedString类型数据，使能够显示的文字类型更加丰富。


**2017.12.28更新（2.0.0）：**                                    
本次更新在原有的基础上增加更多滚动方式、属性设置以及回调方法：
（1）由原来的有间隙滚动，增加到有间隙和无间隙两种滚动方式。方法分别是startScrollBottomToTopWithSpace、startScrollTopToBottomWithSpace、startScrollBottomToTopWithNoSpace、startScrollTopToBottomWithNoSpace
（2）增加了文字的对齐方式和是否可以响应点击设置
（3）增加了点击回调代理函数


**2017.8.18更新（1.3.5）：**                                 
修复了反复调用startScrollBottomToTop / startScrollTopToBottom方法会产生异常效果的问题。                  
                     
**2017.8.16更新（1.3.2）：**                                          
在demo中添加了把控件添加到cell上的测试。           
                
**2017.7.29更新（1.3.1）：**                                                       
修复app进入后台后，循环速度剧增、消耗大量cpu的的问题。             
            
**2017.2.14更新（1.3.0）：**                         
修复进入其他页面后，循环速度剧增、消耗大量cpu的的问题。            
                
**2017.2.13更新（1.2.0）：**                             
添加了一个简单的代理回调，用于返回当前信息的序号。            
   
**2017.2.13更新（1.1.0）：**                        
有朋友说第一条数据走了两次，后来查找一下原因发现是定时器的问题。                   
修改后取消使用定时器，改用循环调用实现。              


      

                    
               
