function [ c_area_total,wys ] = function_NFDH(input,W)

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
input=sortrows(input, [-1,-2])
[rows, columns]=size(input);
x=0;
y=0;
h=max(input(:,1));
maximum=0;
maximal_height=input(1,1);
y_plotting=0;
x_plotting=0;
no_failures=0;

for i=1:rows
    skipped_=[skipped_ i];
end
skipped_=skipped_(2:length(skipped_));
while(length(skipped_)>0)
number_maximal_height=skipped_(1);
maximal_height=input(number_maximal_height,1);
    Width=W;
    for j=skipped_
        if Width>=input(j,2)
            Width=Width-input(j,2)
            rectangle('Position',[x y input(j,2) input(j,1)],'FaceColor','b')
            x=x+input(j,2);
            axis([0 W 0 h])
            k=find(skipped_==j);
            skipped_(k)=[];
            c_area_level=c_area_level+(input(j,2)*(maximal_height-input(j,1)));
        else
            remaining_width=[remaining_width Width];
            if no_id_level==1
                remaining_width=remaining_width(2:length(remaining_width));
                line([0 W],[h h]);
            end
            c_area_level=c_area_level+remaining_width(no_id_level)*maximal_height;
            buffer_=[buffer_ c_area_level];
            c_area_level=0;
            no_id_level=no_id_level+1;
            Width=W;
            Width=Width-input(j,2)
            x=0;
            y=h;
            maximum=0;
            for k=skipped_
                maximum=[maximum input(k,1)];
            end
            maximum=maximum(2:length(maximum));
            maximal_height=max(maximum);
            h=h+maximal_height;
            line([0 W],[h h]);
            rectangle('Position',[x y input(j,2) input(j,1)],'FaceColor','b')
            x=x+input(j,2);
            axis([0 W 0 h])
            k=find(skipped_==j);
            skipped_(k)=[];
        end
    end
end
remaining_width=[remaining_width Width];
if no_id_level==1
    remaining_width=remaining_width(2:length(remaining_width));
end
c_area_level=c_area_level+remaining_width(no_id_level)*maximal_height;
buffer_=[buffer_ c_area_level];
buffer_=buffer_(2:length(buffer_));
c_area=[c_area buffer_];
c_area=c_area(2:length(c_area));
c_area_total=c_area;
wys=h;

end

