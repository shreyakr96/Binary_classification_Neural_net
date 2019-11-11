## Copyright (C) 2017 MAHE
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} classifyit (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: MAHE <MAHE@MU-STD-S45>
## Created: 2017-07-08

function [Cmatrix,N1,N2,N3,N5] = classifyit (A4,W4)
  [N4,D4]=size(A4);


d4=D4-1;
A4m=zeros(N4,D4);
for i=1:N4
  A4m(i,2:D4)=A4(i,1:d4);
  A4m(i,1)=1;
  endfor
  %solm=zeros(N4,1);
  solm=A4m*W4;
  %disp(solm);
  for i=1:N4
    if(solm(i,1)>=0)
    solm(i,1)=1;
    else
    solm(i,1)=0;
    endif
    endfor
    
    orig=zeros(N4,1);
    for i=1:N4
      orig(i,1)=A4(i,D4);
      endfor
      
     % disp(orig);
      disp(" ");
      %disp(solm);
      
  #{
  %%disp for 2 dimensional cases
  class0=0;
  class1=0;
for i=1:N4
  if(A4(i,D4)==0)
  class0=class0+1;
  else
  class1=class1+1;
  endif
  endfor
k1=zeros(class0,2);
k2=zeros(class1,2);
j1=1;
j2=1;
for i=1:N4
  if(A4(i,D4)==0)
  k1(j1,:)=A4(i,1:2);
  j1=j1+1;
  else
  k2(j2,:)=A4(i,1:2);
  j2=j2+1;
  endif
  endfor
   f1l=max(A4(:,2));
  f1=1:f1l;
 f2=(W4(1,1)+W4(2,1).*f1)./(-1.*W4(3,1));
  scatter(k1(:,1),k1(:,2));
  hold on;
   scatter(k2(:,1),k2(:,2));
  hold on;
    plot(f1,f2);
%end of display
#}


  N1=0;
  N2=0;
  N3=0;
  N5=0;
  
  for i=1:N4
    
    if (orig(i,1)==0 && solm(i,1)==0)
      N1=N1+1;
      elseif (orig(i,1)==1 && solm(i,1)==1)
      N2=N2+1;
      elseif (orig(i,1)==1 && solm(i,1)==0)
      N3=N3+1;
      else
      N5=N5+1;
    endif 
    endfor
    #{
    disp (N1);
    disp(" ");
    disp (N2);
    disp(" ");
    disp (N3);
    disp(" ");
    disp (N5);
    disp(" ");
    #}
    
    C1=zeros(N1,d4);
    C2=zeros(N2,d4);
     C3=zeros(N3,d4);
    C5=zeros(N5,d4);
     t1=1;
     t2=1;
     t3=1;
     t5=1;
     
     for i=1:N4
        if (orig(i,1)==0 && solm(i,1)==0)
     C1(t1,1:d4)=A4(i,1:d4);
     t1=t1+1;
      elseif (orig(i,1)==1 && solm(i,1)==1)
       C2(t2,1:d4)=A4(i,1:d4);
        t2=t2+1;
      elseif (orig(i,1)==1 && solm(i,1)==0)
     C3(t3,1:d4)=A4(i,1:d4);
        t3=t3+1;
      else
      C5(t5,1:d4)=A4(i,1:d4);
        t5=t5+1;
    endif 
    endfor
    #{
    disp("C1");
    disp(" Samples with Actual Output =0 Desired Output =0" )
    disp (C1);
    disp(" ");
     disp("C2");
    disp(" Samples with Actual Output =1 Desired Output =1")
    disp (C2);
    disp(" ");
     disp("C3");
    disp(" Samples with Actual Output =0 Desired Output =1")
    disp (C3);
    disp(" ");
     disp("C4");
    disp(" Samples with Actual Output =1 Desired Output =0")
    disp (C5);
    disp(" ");
    #}
    [N4,D4]=size(A4);
    D4=D4-1;
    Cmatrix=zeros(N4,D4+2);
    j1=1;
    for i=1:N1
      Cmatrix(i,2:D4+1)=C1(j1,:);
      Cmatrix(i,1)=1;
      Cmatrix(i,D4+2)=0;
      j1=j1+1;
      endfor
      j2=1;
      for i=N1+1:N1+N2
      Cmatrix(i,2:D4+1)=C2(j2,:);
      Cmatrix(i,1)=2;
      Cmatrix(i,D4+2)=1;
       j2=j2+1;
      endfor
      j3=1;
      for i=N1+N2+1:N1+N2+N3
      Cmatrix(i,2:D4+1)=C3(j3,:);
      Cmatrix(i,1)=3;
      Cmatrix(i,D4+2)=1;
      j3=j3+1;
      endfor
      j4=1;
      for i=N1+N2+N3+1:N1+N2+N3+N5
      Cmatrix(i,2:D4+1)=C5(j4,:);
      Cmatrix(i,1)=4;
      Cmatrix(i,D4+2)=0;
      j4=j4+1; 
      endfor
 
endfunction
