function [ c_area_total, wys ] = function_FFDH(input,W)

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
                remaining_width(f)=remaining_width(f)-input(j,2)
                rectangle('Position',[x_plotting(f) y_plotting(f) input(j,2) input(j,1)],'FaceColor','b')
                x_plotting(f)=x_plotting(f)+input(j,2);
                axis([0 W 0 h])
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
                    remaining_width(no_id_level)=W;
                    maximum=0;
                    for k=skipped_
                        maximum=[maximum input(k,1)];
                    end
                    maximum=maximum(2:length(maximum));
                    line([0 W],[h h]);
                    h=h+max(maximum);
                    maximal_height=[maximal_height max(maximum)];
                    y_plotting=[y_plotting y_plotting(no_id_level-1)+maximal_height(no_id_level-1)]
                    x_plotting=[x_plotting 0];
                    y=sum(y_plotting);
                    c_area_level(no_id_level)=maximal_height(no_id_level)*W;
                    c_area_level(no_id_level)=c_area_level(no_id_level)-(input(j,2)*input(j,1));
                    Width=W;
                    remaining_width(no_id_level)=remaining_width(no_id_level)-input(j,2);
                    rectangle('Position',[x y_plotting(no_id_level) input(j,2) input(j,1)],'FaceColor','b')
                    x_plotting(no_id_level)=x_plotting(no_id_level)+input(j,2);
                    axis([0 W 0 h])
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
wys=sum(maximal_height);
end

