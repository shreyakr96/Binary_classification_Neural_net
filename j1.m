function [simplwt] = j1(init)
[s1,D1]=size(init);
d=D1-1;
init2=zeros(s1,D1+1);
for i=1:s1
  init2(i,1)=1;
  init2(i,2:D1+1)=init(i,1:D1);
  endfor
  init=init2;
p1=(d+1).*2;
p2=s1.*2;
cols=p1+p2;
rows=s1;
A=zeros(rows,cols);
for j=1:s1
  for i=1:p1./2;
  if(init(j,d+2)==1)
    if(init(j,i)!=0)
      A(j,2.*i-1)=init(j,i);
        A(j,2.*i)=-1.*init(j,i);
        else
        A(j,2.*i-1)=init(j,i);
        A(j,2.*i)=init(j,i);
        endif 
     else
    if(init(j,i)!=0)
      A(j,2.*i-1)=-1.*init(j,i);
        A(j,2.*i)=init(j,i);
        else
        A(j,2.*i-1)=init(j,i);
        A(j,2.*i)=init(j,i);
        endif 
    
        endif
    endfor
    endfor
     % disp(" ");
    p11=(p1./2)+1;
    for j=1:s1
      ctr=0;
      for i=p11:(p1+p2)./2
           while(ctr<=2)
        if(init(j,d+2)==1)
        ctr=ctr+1;
        A(j,2.*i-1)=-1;
        A(j,(2.*i))=1;
        else
        ctr=ctr+1;
        A(j,2.*i-1)=-1;
        A(j,(2.*i))=1;
        endif
        end
        endfor
        p11=p11+1;
        endfor
        
       % disp(A);
        
 K=zeros(s1,1);
 for j=1:s1
   if(init(j,d+2)==1)
   K(j,1)=1;
   else
   K(j,1)=1;
   endif
   endfor
   %disp(" ");
   %disp(K);
   %%change obj function
    cll0=0;
    cll1=0;
    for i=1:s1
      if(init(i,D1+1)==0)
      cll0=cll0+1;
    else cll1=cll1+1;
      endif
      endfor
    [x3,x4]=size(A);
    D5=D1.*2;
    C=zeros(1,x4);
    for i=1:D5
      C(1,i)=0;
      endfor
      zerocoeff=cll1.*100;
      onecoeff=cll0.*100;
      D6=D5+1;
      j=1;
      [s1,D2]=size(init);
            
      for i=D6:x4
        pod=mod(i,2);
        if(pod!=0)
            C(1,i)=0;
        
        else
           if(init(j,D2)==0)
          C(1,i)=-1.*zerocoeff;
          j=j+1;
          else
          C(1,i)=-1.*onecoeff;
          j=j+1;
          endif
         endif
         
         
         endfor
        
  #{
  A=[1 -2 1 1 0 0 0; -4 1 2 0 -1 1 0;-2 0 1 0 0 0 1];
  K=[11;3;1];
  C=[3 -1 -1 0 0 -300 -300];
 #}
%%% Simplex Tableu and initial Calculations---------------------------------------------------------------------
[M,N]=size(A);
  E=zeros(M+1,N+1);
  E(1:M,2:N+1)=A;
  E(1:M,1)=K;
  r=rank(A);
  basis=eye(r,r);
  l=zeros(1,r);
for i=1:r
  for j=1:N
    if A(:,j)==basis(:,i)
      l(1,i)=j;
      endif
      endfor
      endfor
   Xb=zeros(N,1);
   for u=1:r
     Xb(l(u),1)=K(u,1);
     endfor
     ZXb=C*Xb;
     Z=zeros(1,N);
      yn=zeros(N,N);
      for i=1:N
     for u=1:r
     yn(l(u),i)=A(u,i);
     endfor
     endfor
  for i=1:N
    Z(1,i)=( C*yn(:,i))-C(1,i);
        endfor
    E(M+1,1)=ZXb;
    E(M+1,2:N+1)=Z;
    %disp("Tableu");
    %disp(E);
    %disp(" ");
   
%%%%%% Simplex Algorithm------------------------------------------------------------------------------------
    opt=0; ctl=0;
  while(opt==0 && ctl<=10)
   %disp("Basis ");
   %disp(basis);
   %disp(" ");
   f=min(E(M+1,2:N+1));
   if f>=-0.0000001
     disp ("optimal solution -");
     opt=opt+1;
     
     s=zeros(1,r);
  for i=1:r
    for j=1:N
      if A(:,j)==basis(:,i)
        s(1,i)=j;
      endif
      endfor
      endfor
      ans=zeros(1,N);
   for u=1:r
     ans(1,s(u))=E(u,1);
     endfor
     %disp(" ")
     % disp(ans);
   else 
     d=zeros(1,N);
     j=1;
     for i=2:N+1;
       ctr=1;
       if(E(M+1,i)<0)
       for j=1:M 
         if E(j,i)>0 
           ctr=ctr-1;
           endif
           endfor
           endif
           endfor
             if (ctr==0)
             disp ("unbounded solution");
             opt=opt+1;
             
             
             else
             %%change
             enter=0;
             d= min(E(M+1,2:N+1));
             for i=2:N+1
               %%change
               if(E(M+1,i)==d && enter==0)
               enter=i;
              
               %%change over
               endif
               endfor
               
               select=zeros(M,1); 
               for i=1:M
                 if E(i,enter)>0
                 select(i,1)=E(i,1)./E(i,enter);
                 else
                 select(i,1)=10000;
                 endif
                endfor
                [g,leave]=min(select);
%%Pivoting method  ---------------------------------------------------------------------------------------------           
               pivot=E(leave,enter);
                E2=zeros(M+1,N+1);
                E2(:,enter)=0;
                E2(leave,:)=E(leave,:)./pivot;
                for i=1:M+1
                  for j=1:N+1
                    if(i!=leave)&&(j!=enter)
                    E2(i,j)=E(i,j)-(E(leave,j).*E(i,enter))./pivot;
                    endif
                    endfor
                    endfor
                   % disp("Tableu");
                   %disp(E2);
                    %disp(" ");
                basis(:,leave)=A(:,enter-1);
                       E=E2;
             endif
             
             endif
             ctl=ctl+1;
            end
            %disp(E);
            
            %disp(ans);
           [g1,h1]=size(ans);
           d13=D1;
           simplwt=zeros(D1,1);
           for i=1:d13
             simplwt(i,1)=ans(1,2.*i-1)-ans(1,2.*i);
                                   endfor
                                    %  disp(simplwt);



endfunction
