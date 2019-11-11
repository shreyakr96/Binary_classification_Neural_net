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
## @deftypefn {} {@var{retval} =} svmap (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: MAHE <MAHE@MU-STD-S45>
## Created: 2017-07-08

function [x3] = svmap (A3)
%A3=[1 8 1 0 1;4 5 1 0 1;4 4 1 0 1; 1 1 1 0 1; 2 6 0 1 0; 2 3 0 0 0;6 5 1 0 1;6 4 0 0 1; 10 8 1 0 1; 10 1 0 0 1;8 6 0 1 0; 8 3 0 1 0];
%disp(A3);
[N3,D3]=size(A3);
d3=D3-1;
x30=zeros(D3,1);
q=zeros(D3,1);
A_in=zeros(N3,D3);
H3=2.*eye(D3);
for i=1:N3
  if A3(i,D3)==0
    A_in(i,2:D3)=A3(i,1:d3);
    A_in(i,1)=1;
    else
    A_in(i,2:D3)=-1.*A3(i,1:d3);
    A_in(i,1)=-1;
    endif
    endfor
    %disp('H3');
    %disp(H3);
    %disp('A_in');
    %disp(A_in);
    A_ub=zeros(N3,1);
    for i=1:N3
      A_ub(i,1)=-1;
      endfor
      %disp('A_ub');
      %disp(A_ub);
      
   
 [x3, obj, info, lambda] = qp (x30, H3, q, [], [], [], [], [], A_in, A_ub);
%disp('X3');
%disp(x3);
#{
class0=0;
class1=0;
for i=1:N3
  if(A3(i,D3)==0)
  class0=class0+1;
  else
  class1=class1+1;
  endif
  endfor
k1=zeros(class0,2);
k2=zeros(class1,2);
j1=1;
j2=1;
for i=1:N3
  if(A3(i,D3)==0)
  k1(j1,:)=A3(i,1:2);
  j1=j1+1;
  else
  k2(j2,:)=A3(i,1:2);
  j2=j2+1;
  endif
  endfor
   f1l=max(A3(:,2));
  f1=1:f1l;
 f2=(x3(1,1)+x3(2,1).*f1)./(-1.*x3(3,1));
  scatter(k1(:,1),k1(:,2));
  hold on;
   scatter(k2(:,1),k2(:,2));
  hold on;
  %plot(A3(:,1),A3(:,1));
  %wont be in the exact middle o two decison planes?
  plot(f1,f2);
  #}
endfunction
