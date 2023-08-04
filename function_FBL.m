function [nkp,ind,x_fig,y_fig,input_function,remaining_c_area ] = function_FBL( input,W,H )

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

board_number=1;
input=sortrows(input, [-2,-1]);
[rows, columns]=size(input);
c_area(board_number)=0; 
beginning_point_x=0;
beginning_point_y=0;
height_below=0;
height_below_right=0;
width_left=0;
no_failures_levels=0;
previous_height=[];
previous_width=[];
indices_=[];
for i=1:W
    Height(board_number,i)=0;
end
for i=1:H
    Width(board_number,i)=0;
end
board_number=1;
skipped_=[];
for i=1:rows
    skipped_=[skipped_ i];
end
while(length(skipped_)>0)
    for i=skipped_
        no_failures_levels=0;
       for j=1:1:board_number 
        down_possible=0;
        left_possible=0;
        no_failures=0;
        beginning_point_x(i)=W-input(i,2)
        beginning_point_y(i)=Height(j,beginning_point_x(i)+1)%height_below;
            while no_failures<2
                height_below=Height(j,beginning_point_x(i)+1);
                height_below_right=Height(j,beginning_point_x(i)+input(i,2));
                width_left=Width(j,beginning_point_y(i)+1);
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
            for r=1:1:W
                if r<=length(Height)
                    previous_height(j,r)=Height(j,r);
                else
                    previous_height(j,r)=0;
                end
            end
            for t=1:1:H
                if t<=length(Width)
                    previous_width(j,t)=Width(j,t);
                else
                    previous_width(j,t)=0;
                end
            end
            for z=beginning_point_x(i):1:(beginning_point_x(i)+input(i,2))
                if z<=W    
                    try
                            Height(j,z)=beginning_point_y(i)+input(i,1);
                    catch
                    Height(j,1)=beginning_point_y(i)+input(i,1);
                    end
                end
            end
            for k=beginning_point_y(i):1:(beginning_point_y(i)+input(i,1))
                if k<=H    
                    try
                        if beginning_point_x(i)>=Width(j,k)
                            Width(j,k)=beginning_point_x(i)+input(i,2);
                        end
                    catch
                    Width(j,1)=beginning_point_x(i)+input(i,2);
                    end
                end
            end
        if no_failures>=2 && Height(j,beginning_point_x(i)+1)<H
            k=find(skipped_==i);
            skipped_(k)=[];
            indices_(i)=j;
            break;
        else
            no_failures_levels=no_failures_levels+1;
            for z=beginning_point_x(i):1:(beginning_point_x(i)+input(i,2))
                if z<=length(previous_height)
                    try
                    Height(j,z)=previous_height(j,z);
                    catch
                      Height(j,1)=previous_height(j,1);  
                    end
                else
                    Height(j,z)=0;
                end
            end
            for k=beginning_point_y(i):1:(beginning_point_y(i)+input(i,1))
                if k<=length(previous_width)
                    try
                    Width(j,k)=previous_width(j,k);
                    catch
                        Width(j,1)=previous_width(j,1);
                    end
                else 
                    Width(j,k)=0;
                end
            end
        end
        if no_failures_levels==board_number
            no_failures_levels=0;
            board_number=board_number+1;
            indices_(i)=board_number;
            for m=1:W
                Height(board_number,m)=0;
                previous_height(board_number,m)=0;
            end
            for g=1:H
                Width(board_number,g)=0;
                previous_width(board_number,g)=0;
            end
            beginning_point_x(i)=0;
            beginning_point_y(i)=0;
            for z=beginning_point_x(i):1:(beginning_point_x(i)+input(i,2))
                try
                Height(board_number,z)=beginning_point_y(i)+input(i,1);
                catch
                    Height(board_number,1)=beginning_point_y(i)+input(i,1);
                end
            end
            for k=beginning_point_y(i)+1:1:(beginning_point_y(i)+input(i,1))
                try
                Width(board_number,k)=beginning_point_x(i)+input(i,2);
                catch
                    Width(board_number,1)=beginning_point_x(i)+input(i,2);
                end
            end
            k=find(skipped_==i);
            skipped_(k)=[];
            break;
        end
       end
    end
    for d=1:1:board_number
    remaining_c_area(d)=W*H;  
    m=find(indices_==d);
    for n=m
        remaining_c_area(d)=remaining_c_area(d)-input(n,2)*input(n,1);
    end
    end
    
nkp=board_number;
ind=indices_;
x_fig=beginning_point_x;
y_fig=beginning_point_y;
input_function=input;
end
end

