 n=100;
cvx_begin
variables a(n)
maximize(sum(a)-((a.*y)'*x)*((a.*y)'*x)'/2)
subject to
a>=0
a'*y==0
cvx_end
wcvx =(a.*y)'*x;
norma= norm(wcvx);
Bcvx = (y-x*wcvx'); %cojo solo un valor de b todos los b
bcvx=ones(900,1);
bcvx=bcvx*Bcvx(86);
jcvx=wcvx*x2'+bcvx';
idxneg= find(jcvx<=0);
indices=ones(900,1);
indices(idxneg)=-1;
similarity= indices==y2;
NumeroDeElementosIguales= length(find(similarity))
clf
YMax = max(x2(:,2));
hold on
plot([-(bcvx-1)/norm(wcvx),YMax/(-wcvx(1)/wcvx(2))-(bcvx-1)/norm(wcvx)],[0,YMax]);
plot([-(bcvx+1)/norm(wcvx),YMax/(-wcvx(1)/wcvx(2))-(bcvx+1)/norm(wcvx)],[0,YMax]);
plot([-bcvx/norm(wcvx),YMax/(-wcvx(1)/wcvx(2))-bcvx/norm(wcvx)],[0,YMax]);
scatter(x(:,1),x(:,2),[],y)