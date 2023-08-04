function [ c_area_total,wys ] = function_BL(input,W)

[w,k]=size(input);
for i=1:1:sum(input(:,3))
    B=[];
    if input(i,3)>1
        for k=1:1:input(i,3)
            B(k,:)=input(i,:);
        end
        input(i,:)=[];
        B(:,3)=1;
        input = [input(1:i-1, :); B; input(i:end, :)]
    end
end
c_area=0; 
remaining_width=W; 
number_maximal_height=1; 
input=sortrows(input, [-2,-1]);
[rows, columns]=size(input);
beginning_point_x=[];
beginning_point_y=[];
height_below=0;
height_below_right=0;
width_left=0;
Height=[];
Width=[];
for i=1:W
    Height(i)=0;
end
for i=1:sum(input(:,1))
    Width(i)=0;
end
for i=1:rows
    
    down_possible=0;
    left_possible=0;
    no_failures=0;
    beginning_point_x(i)=W-input(i,2)
    beginning_point_y(i)=Height(beginning_point_x(i)+1);%height_below;
    while no_failures<2
        height_below=Height(beginning_point_x(i)+1);
        height_below_right=Height(beginning_point_x(i)+input(i,2));
        width_left=Width(beginning_point_y(i)+1);
        if beginning_point_y(i)>height_below && beginning_point_y(i)>height_below_right
            down_possible=1;
        end
        if down_possible==1
            beginning_point_y(i)=height_below;
            down_possible=0;
        else
            no_failures=no_failures+1;
        end
        if beginning_point_x(i)>width_left
            left_possible=1;
        end
        if left_possible==1
            beginning_point_x(i)=width_left;
            left_possible=0;
        else
            no_failures=no_failures+1;
        end
    end
    for j=beginning_point_x(i):1:(beginning_point_x(i)+input(i,2))
        try
        Height(j)=beginning_point_y(i)+input(i,1);
        catch
        Height(1)=beginning_point_y(i)+input(i,1);
        end
    end
    for k=beginning_point_y(i):1:(beginning_point_y(i)+input(i,1)) %beginning_point_y(i)+
        try
            if beginning_point_x(i)>=Width(k)
                Width(k)=beginning_point_x(i)+input(i,2);
            end
         catch
        Width(1)=beginning_point_x(i)+input(i,2);%Width(k)=beginning_point_x(i)+input(i,2);
        end
    end
    object=rectangle('Position',[beginning_point_x(i) beginning_point_y(i) input(i,2) input(i,1)],'FaceColor','b')
    axis([0 W 0 max(Height)])%sum(input(:,1))
end
line([0 W],[max(Height) max(Height)]);
c_area_total=W*(max(Height));
for m=1:rows
    c_area_total=c_area_total-(input(m,1)*input(m,2));
end
wys=max(Height);
end

