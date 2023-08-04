function [ c_area_total,wys ] = function_BFDH( input,W )

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
c_area_total=[];
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
first_time_appearance=0;

while(length(skipped_)>0)
    if length(skipped_)>=1
        A=[1];
        f=[1]; 
        B=[W]; 
        [r,c]=size(skipped_); 
        intcon=1:c; 
        lb=zeros(c,1); 
        for i=skipped_
            A=[A input(i,2)];
            f=[f -input(i,2)]; 
            B=[B 1];
        end
        A=A(2:length(A)); 
        A=[A;eye(c,c)];
        f=f(2:length(f)); 
        [xopt,fval]=intlinprog(f,intcon,A,B,[],[],lb)
        Width=W;
        removed_item=[];
        first_time_appearance=0;
        for j=1:1:length(xopt)
            if xopt(j)~=0
                Width=Width-A(1,j);
                display('completed');
                removed_item=[removed_item skipped_(j)];
                if first_time_appearance==0
                    number_maximal_height=skipped_(j);
                    first_time_appearance=1;
                end
                rectangle('Position',[x y input(skipped_(j),2) input(skipped_(j),1)],'FaceColor','b')
                x=x+input(skipped_(j),2);
                c_area_level=c_area_level+(input(skipped_(j),2)*(input(number_maximal_height,1)-input(skipped_(j),1)));
            end
        end
        x=0;
        c_area_level=c_area_level+Width*input(number_maximal_height,1);
        c_area_total=[c_area_total c_area_level];
        c_area_level=0;
        for j=removed_item
            k=find(skipped_==j)
            skipped_(k)=[];
        end
        if isempty(skipped_)==0
            no_id_level=no_id_level+1;
            y=y+input(number_maximal_height,1);
            line([0 W],[y y]);
            Width=W;
        else
            y=y+input(number_maximal_height,1);
        end
    else
        Width=Width-input(skipped_,2)
        c_area_level=c_area_level+Width*input(skipped_,1);
        c_area_total=[c_area_total c_area_level];
        skipped_=[];
    end
end
axis([0 W 0 y]);
wys=y;
end
        
