function w = PegasusWithBias(x,y,lambda,b,niter)
  w = zeros(2,1);
  m = length(y);
  for t = 1:niter
    j = 1 + floor(rand()*m);
    eta = 1/(lambda*t);
    if ( y(j).*(x(j,:)*w+b)<1) 
      w = (1-eta*lambda)*w + eta*y(j).*x(j,:)';
    else
      w = (1-eta*lambda)*w ;
    end
  end
 clf
YMax = 3.9942;
hold on
plot([-(b-1)/norm(w),YMax/(-w(1)/w(2))-(b-1)/norm(w)],[0,YMax]);
plot([-(b+1)/norm(w),YMax/(-w(1)/w(2))-(b+1)/norm(w)],[0,YMax]);
plot([-b/norm(w),YMax/(-w(1)/w(2))-b/norm(w)],[0,YMax]);
scatter(x(:,1),x(:,2),[],y)
end
