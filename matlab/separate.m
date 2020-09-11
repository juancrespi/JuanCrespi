function resp = separate(X1,X2,i,j)
    v1 = X2(j,:)-X1(i,:);
    ptb = X1(i,:)+v1/2;
    resp = 1;
    for c=1:length(X1)
        if dot(X1(c)-ptb,v1)>0
            disp(c);
            resp = 0;
            break;
        end
    end
    disp('X2')
    for c=1:length(X2)
        if dot(X2(c)-ptb,v1)<0
            disp(c);
            resp = 0;
            break;
        end
    end
    
    
    