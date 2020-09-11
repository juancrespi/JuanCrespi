tic
lambda = 0.0001;
niter = 10000;
y=Y_Train;
y2=Y_Test;
x=X_Train;
x2=X_Test;
w = zeros(2,1);
b = 0;
t = 0;
m = length(y);
for iter = 1:niter
  % compute the subgradient at w,b 
    dw1 = lambda*w - sum( ( y.*(x*w+b)<1-0.001) .* y .* x, 1)'/m; 
    %al ser un sumatorio los mayores que 1 no aportan nada ya que son 0 y su derivada es 0
    dw2 = lambda*w - sum( ( y.*(x*w+b)<1+0.001) .* y .* x, 1)'/m;
    db1 = - sum( (y.*(x*w+b) < 1-0.001) .* y, 1)/m;
    db2 = - sum( (y.*(x*w+b) < 1+0.001) .* y, 1)/m;
    if norm(dw1-dw2)> 0 
      if ( dw1(1)*dw2(1) <= 0 && dw1(2)*dw2(2) <= 0 && db1*db2 <= 0 )
         nsv = sum( y.*(x*w+b) > 1-0.001 & y.*(x*w+b) < 1+0.001 )
         break
      end
    end
   % change the vector using a decreasing weigth eta=1/(lambda * iter)
    %eta = m/(lambda*iter);
    eta =0.5;
    w = w - eta*(dw1+dw2)/2;
    b = b - eta*(db1+db2)/2;
end    
iter
norma = norm(w)
jcvx=w'*x2'+b';
idxneg= find(jcvx<=0);
indices=ones(900,1);
indices(idxneg)=-1;
similarity= indices==y2;
NumeroDeElementosIguales= length(find(similarity))
clf
YMax = 3.9942;
hold on
plot([-(b-1)/norm(w),YMax/(-w(1)/w(2))-(b-1)/norm(w)],[0,YMax]);
plot([-(b+1)/norm(w),YMax/(-w(1)/w(2))-(b+1)/norm(w)],[0,YMax]);
plot([-b/norm(w),YMax/(-w(1)/w(2))-b/norm(w)],[0,YMax]);
scatter(x2(:,1),x2(:,2),[],y2)
toc
