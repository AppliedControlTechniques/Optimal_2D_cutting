function [nkp, ind, x_fig, maximal_, inp, remaining_c_area ] = function_HFF( input,W,H )
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

no_id_level=1; 
c_area_level=0;
c_area=0; 
remaining_width=W; 
buffer_=0; 
number_maximal_height=1; 
skipped_=0;
buffer__skipped=0;
input=sortrows(input, [-1,-2]);
[rows, columns]=size(input);
x=0;
y=0;
h=max(input(:,1));
maximum=0;
maximal_height=input(1,1);
c_area_level(1)=W*maximal_height;
y_plotting=0;
x_plotting=0;
no_failures=0;

%FFDH
for i=1:rows
    skipped_=[skipped_ i];
end
skipped_=skipped_(2:length(skipped_));
while(length(skipped_)>0)
    number_maximal_height=skipped_(1);
    Width=W;
    for j=skipped_
        for f=1:no_id_level
            if remaining_width(f)>=input(j,2)
                indices_(j)=f;
                x_plotting(f,j)=W-remaining_width(f);
                remaining_width(f)=remaining_width(f)-input(j,2)
                k=find(skipped_==j);
                skipped_(k)=[];
                c_area_level(f)=c_area_level(f)-(input(j,2)*input(j,1));
                no_failures=0;
                break;
            else
                no_failures=no_failures+1;
            end
            if no_failures==no_id_level
                no_failures=0;
                if isempty(skipped_)==0
                    no_id_level=no_id_level+1;
                    indices_(j)=no_id_level;
                    remaining_width(no_id_level)=W;
                    maximum=0;
                    for k=skipped_
                        maximum=[maximum input(k,1)];
                    end
                    maximum=maximum(2:length(maximum));
                    %line([0 W],[h h]);
                    h=h+max(maximum);
                    maximal_height=[maximal_height max(maximum)];
                    y_plotting=[y_plotting y_plotting(no_id_level-1)+maximal_height(no_id_level-1)]
                    y=sum(y_plotting);
                    c_area_level(no_id_level)=maximal_height(no_id_level)*W;
                    c_area_level(no_id_level)=c_area_level(no_id_level)-(input(j,2)*input(j,1));
                    Width=W;
                    x_plotting(no_id_level,j)=W-remaining_width(no_id_level);
                    remaining_width(no_id_level)=remaining_width(no_id_level)-input(j,2);
                    k=find(skipped_==j);
                    skipped_(k)=[];
                end
            end
        end
    end
end
c_area=[c_area buffer_];
c_area=c_area(2:length(c_area));
c_area_total=c_area_level;
remaining_height_available(1)=H;
number_of_units=1;
wrong=0;
for p=1:1:no_id_level
    for x=1:1:number_of_units
        if maximal_height(p)<=remaining_height_available(x)
            remaining_height_available(x)=remaining_height_available(x)-maximal_height(p);
            on_which_board(p)=x;
            wrong=0;
            break;
        else
            wrong=wrong+1;
        end
        if wrong==number_of_units;
            wrong=0;
            number_of_units=number_of_units+1;
            remaining_height_available(number_of_units)=H-maximal_height(p);
            on_which_board(p)=number_of_units;
        end
    end
end
for d=1:1:max(on_which_board)
remaining_c_area(d)=W*H
height_for_plotting=0;
y_for_plotting_board=0;
m=find(on_which_board==d);
for id_row__=m
    n=find(indices_==id_row__);
    for id_column__=n
    remaining_c_area(d)=remaining_c_area(d)-input(id_column__,1)*input(id_column__,2);
    end
end
end
nkp=on_which_board;
ind=indices_;
x_fig=x_plotting;
maximal_=maximal_height;
inp=input;
end

