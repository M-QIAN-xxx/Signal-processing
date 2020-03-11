clear;
clc;
TuneJazz = load('TuneJazz.mat'); %Replace the content in quotes with the address of your TuneJazz.mat file
data_array = TuneJazz.TuneS; %Assign the variable Tunes referenced from TuenJazz to x
plot(data_array);%绘制原始曲线
grid
hold on
col_array = length(data_array)   %总共离散点的个数
data_array_section=ones(1,col_array);
for k=1:col_array
    data_array_section(k)=data_array(k);  %将取出的1000个采样点放入矩阵data_array_section中
end

moving_point=1001;      %定义moving average中去多少个点进行平均运算，也就是M的值，必须为奇数
moving_point_left=(-moving_point+1)/2;  
moving_point_right=(moving_point-1)/2;  %取输出点对称两边的采样点的值做平均
data_array_filter=zeros(1,col_array);   %初始化一个和data_array_section大小相同的矩阵，存储结果
 
 for i=1:moving_point_right
     data_array_filter(i)=data_array_section(i);  
 end

 for i=(col_array+moving_point_left+1):col_array  
     data_array_filter(i)=data_array_section(i);
 end  %这一段代码，是对矩阵的前(M-1)/2个和后(M-1)/2个点进行赋值,因为这些前期和后期的点，无法由算法更新                    

for i=(moving_point_right+1):(col_array+moving_point_left)  %i的范围为要更新的数据下标范围
    for j=moving_point_left:moving_point_right
        data_array_filter(i)=data_array_filter(i)+data_array_section(i+j);  %moving average filter process
    end
    data_array_filter(i)=data_array_filter(i)/moving_point;
end

plot(data_array_filter); %绘制滤波后的曲线
legend('Input Data','Filter Data')
hold off