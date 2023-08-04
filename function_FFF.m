function [nkp,x_fig,y_fig,input_function,remaining_c_area] = function_FFF(input,W,H)
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
number_of_units=1;
indices_=[];
x_plotting=[];
y_plotting=[];
on_which_board(1)=1;
number_of_levels_on_unit(1)=1;
input=sortrows(input, [-1,-2]);
[rows, columns]=size(input);
skipped_=[];
for i=1:rows
    skipped_=[skipped_ i];
end
number_maximal_height=skipped_(1);
remaining_available_width(1,1)=W;
Height(1,1)=0;


while(length(skipped_)>0)
    for i=skipped_
        is_matching=0;
        no_failures_units=0;
        for j=1:1:number_of_units
            no_failures_levels=0;
            for k=1:1:number_of_levels_on_unit(j)
                if remaining_available_width(j,k)>=input(i,2) && (Height(j,k)==0 || Height(j,k)>=input(i,1)) 
                    if input(i,1)>Height(j,k)
                        number_of_levels_on_unit(j)=number_of_levels_on_unit(j)+1;
                        Height(j,k+1)=H-input(i,1);
                        Height(j,k)=input(i,1);
                        remaining_available_width(j,k+1)=W;
                    elseif Height(j,k)>input(i,1)
                        if k==number_of_levels_on_unit(j) && remaining_available_width(j,k)==W
                            number_of_levels_on_unit(j)=number_of_levels_on_unit(j)+1;
                            Height(j,k+1)=Height(j,k)-input(i,1);
                            Height(j,k)=input(i,1);
                            remaining_available_width(j,k+1)=W; 
                        end
                    end
                    x_plotting(i)=W-remaining_available_width(j,k);
                    if k==1
                        y_plotting(i)=0;
                    else
                        variable_height_do_y_plotting=0;
                        for n=1:1:k-1
                            variable_height_do_y_plotting=variable_height_do_y_plotting+Height(j,n);
                        end
                    y_plotting(i)=variable_height_do_y_plotting;
                    end
                    remaining_available_width(j,k)=remaining_available_width(j,k)-input(i,2);
                    k=find(skipped_==i);
                    skipped_(k)=[];
                    is_matching=1;
                    on_which_board(i)=j;
                    if is_matching==1
                        break;
                    end
                else
                    no_failures_levels=no_failures_levels+1;
                end   
            end
            if no_failures_levels~=0 && no_failures_levels==number_of_levels_on_unit(j) && Height(j,k)>input(i,1) && remaining_available_width(j,k)==W
                    number_of_levels_on_unit(j)=number_of_levels_on_unit(j)+1;
                    Height(j,k+1)=Height(j,k)-input(i,1);
                    Height(j,k)=input(i,1);
                    remaining_available_width(j,k+1)=W;
                elseif no_failures_levels~=0 && no_failures_levels==number_of_levels_on_unit(j) && Height(j,k)==input(i,1) && remaining_available_width(j,k)==W
                    Height(j,k)=input(i,1);
                    x_plotting(i)=W-remaining_available_width(j,k);
                    variable_height_do_y_plotting=0;
                    for n=1:1:k-1
                    	variable_height_do_y_plotting=variable_height_do_y_plotting+Height(j,n);
                    end
                    y_plotting(i)=variable_height_do_y_plotting;
                    remaining_available_width(j,k)=remaining_available_width(j,k)-input(i,2);
                    k=find(skipped_==i);
                    skipped_(k)=[];
                    is_matching=1;
                    on_which_board(i)=j;
                    if is_matching==1
                        break;
                    end
                elseif no_failures_levels==number_of_levels_on_unit(j)
                    no_failures_units=no_failures_units+1;
                    [a,b]=size(Height);
                    if no_failures_units==number_of_units
                        number_of_units=number_of_units+1;
                        Height(number_of_units,1)=0;
                        remaining_available_width(number_of_units,1)=W;
                        number_of_levels_on_unit(number_of_units)=1;
                    if remaining_available_width(number_of_units,1)>=input(i,2) && (Height(number_of_units,1)==0 || Height(number_of_units,1)>=input(i,1)) 
                        remaining_available_width(number_of_units,1)=remaining_available_width(number_of_units,1)-input(i,2);
                        if input(i,1)>Height(number_of_units,1)
                            number_of_levels_on_unit(number_of_units)=number_of_levels_on_unit(number_of_units)+1;
                            Height(number_of_units,2)=H-input(i,1);
                            Height(number_of_units,1)=input(i,1);
                            remaining_available_width(number_of_units,2)=W;
                        end
                        k=find(skipped_==i);
                        skipped_(k)=[];
                        is_matching=1;
                        on_which_board(i)=number_of_units;
                        x_plotting(i)=0;
                        y_plotting(i)=0;
                        if is_matching==1
                        break;
                        end
                    end
                    end
                end
            if is_matching==1
                break;
            end
        end
    end
end
for d=1:1:number_of_units
    remaining_c_area(d)=W*H;
    %figure
    n=find(on_which_board==d);
    for p=n
        axis([0 W 0 H])
        remaining_c_area(d)=remaining_c_area(d)-input(p,2)*input(p,1);
    end
end
nkp=on_which_board;
input_function=input;
x_fig=x_plotting;
y_fig=y_plotting;


end

