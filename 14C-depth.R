#1.加载包
library(rbacon)#加载rbacon包，用于贝叶斯年龄深度建模
library(ggplot2)#加载ggplot2包，用于绘图
library(dplyr)#加载dplyr包，用于数据处理

#2.运行年龄-深度模型

#基本运行（使用默认参数，会交互式提问）
#Bacon("test")#方法一可以使用包自带的处理，这里就注释掉了，运行过程中需要在命令行确认

#方法二常用参数设置示例（可跳过提问，直接运行），如下操作：

Bacon("test",
      thick=5,            # 每个剖面的厚度（单位同depth），值越小模型越平滑
      acc.mean = 20,      # 先验积累速率均值（单位：年/深度单位），湖泊沉积常用10-50，泥炭可能用50-200
      mem.strength = 10,  # 记忆强度先验
      mem.mean = 0.5,     # 记忆平均值先验
      cc = 2,             # 校准曲线：1=IntCal20（北半球陆地）[citation:1], 2=Marine20, 3=SHCal20
      BCAD = FALSE,       # 输出年代使用 BP（FALSE） 还是 BC/AD（TRUE）
      ask = FALSE,        # 关闭交互式提问
      suggest = FALSE     # 关闭初始运行建议
)
      
# 3. 绘制基本图形
#agedepth()

#调整图形参数（以下参数可组合使用）
agedepth(
  # 坐标轴与刻度
  d.min = 30,                   # 深度轴最小值
  d.max = 550,                 # 深度轴最大值
  age.min = 200,               # 年龄轴最小值
  age.max = 8000,              # 年龄轴最大值
  rev.d = FALSE,               # 是否反转深度轴（FALSE从上到下增加）
  rev.age = FALSE,             # 是否反转年龄轴
  d.lab = "Depth (cm)",        # 深度轴标签
  age.lab = "cal yr BP",       # 年龄轴标签
  
  #dates.col = "lightred",  # 尝试修改数据点颜色
  C14.col = adjustcolor("purple", alpha.f = 0.4),  # 放射性碳样本填充色（紫色，40%透明度）
  C14.border = "purple",                           # 放射性碳样本边框色（紫色）
  
  # 图形样式
  mn.col = "red",              # 改变年龄模型线的颜色
  mn.lty = "solid",            # 线型为实线（"solid"可省略，但写明更清晰）
  mn.lwd = 1.5,                # 可选项：适当加粗线条，1.5是1.5倍默认粗细
  
  cutoff = 0.001,              # 概率显示下限，可减少尾部“拖影”
  date.res = 100,              # 日期分布曲线的分辨率
  
  # 置信区间
  prob = 0.95,                 # 置信区间概率（默认95%）
  plot.range = TRUE,           # 绘制全部MCMC迭代范围（灰色色带）
  range.col = "grey70",        # 调整范围色带的颜色
)








