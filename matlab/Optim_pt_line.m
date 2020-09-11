
function [w,b,ib,cb] = Optim_pt_line(X1,X2)
best = Inf;
cb=-1;
ib=-1;
for i=1:length(X1)
    j = i+1;
    if j > length(X1)
        j=1;
    end
    ok = 1;
    dist = Inf;
    v1 = zeros(3,1);
    v1(1:2,:)=(X1(j,:)-X1(i,:))';
    for c=1:length(X2)
        v2 = zeros(3,1);
        v2(1:2,:)=(X2(c,:)-X1(i,:))';
        v3 = cross(v1,v2);
        if v3(3) >=0  
            ok = 0;
            break;
        end
        if -v3(3) < dist
            cbest = c;
            dist = -v3(3);
        end
    end
    if ok == 1
        m=ones(3,3);
        w=ones (2,1);
        sol=[1; -1; -1];
        m(1,1:2)= X2(cbest,:)';
        m(2,1:2)= X1(i,:)';
        m(3,1:2)= X1(j,:)';
        if det(m)~= 0
            wb=m\sol;
            if norm(wb(1:2))< best
               best =  norm(wb(1:2));
               w = wb(1:2);
               b = wb(3);
               cb = cbest;
               ib= i;
            end
        end
    end
end


 
