function [w,b] = PegasusWithBias1(x,y,lambda,niter)
  m = length(y);
  x1 = [ones(m,1),x];
  d = length(x1(1,:));
  w = zeros(d,1);

  for t = 1:niter
    j = 1+floor(rand()*m);
    eta = 1/(lambda*t);
    if ( y(j).*(x1(j,:)*w)<1) 
      w = (1-eta*lambda)*w + eta*( y(j) .* x1(j,:))' ;
    else
      w = (1-eta*lambda)*w ;
    end
    w = min(1,1/(sqrt(lambda)*norm(w)))*w;
  end
  b = w(1);
  w = w(2:3);
  clf
YMax = 3.9942;
hold on
plot([-(b-1)/norm(w),YMax/(-w(1)/w(2))-(b-1)/norm(w)],[0,YMax]);
plot([-(b+1)/norm(w),YMax/(-w(1)/w(2))-(b+1)/norm(w)],[0,YMax]);
plot([-b/norm(w),YMax/(-w(1)/w(2))-b/norm(w)],[0,YMax]);
scatter(x(:,1),x(:,2),[],y)
end