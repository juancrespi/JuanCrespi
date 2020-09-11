c=1
 n=2;
cvx_begin
variables w(n) b
minimize (1/2*w'*w)
subject to
y'*(x*w+b)>=1
cvx_end
clf
YMax = 3.9942;
hold on
plot([-(b-1)/norm(w),YMax/(-w(1)/w(2))-(b-1)/norm(w)],[0,YMax]);
plot([-(b+1)/norm(w),YMax/(-w(1)/w(2))-(b+1)/norm(w)],[0,YMax]);
plot([-b/norm(w),YMax/(-w(1)/w(2))-b/norm(w)],[0,YMax]);
scatter(x(:,1),x(:,2),[],y)
