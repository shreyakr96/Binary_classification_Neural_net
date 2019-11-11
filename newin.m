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
## @deftypefn {} {@var{retval} =} newin (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: MAHE <MAHE@MU-STD-S45>
## Created: 2017-07-08

function [Cnew,Cdoll] = newin (Cmatrix,N3,N4)
[r,c]=size(Cmatrix);
aout=zeros(r,1);
bout=zeros(r,1);
for i=1:r
  % nums = randi([0 1], 1, 1);
  lol=mod(i,2);
  if(Cmatrix(i,1)==1)
  aout(i,1)=0;
  if (lol!=0)
  bout(i,1)=1;
else 
  bout(i,1)=0;
  endif
  elseif(Cmatrix(i,1)==2)
  bout(i,1)=0;
  if (lol!=0)
  aout(i,1)=1;
else 
  aout(i,1)=0;
  endif
  elseif(Cmatrix(i,1)==3)
  aout(i,1)=1;
  bout(i,1)=0;
  else
  aout(i,1)=0;
  bout(i,1)=1;
  endif
endfor
Cdoll=zeros(r,c+2);
Cdoll=[Cmatrix,aout,bout];
desired=zeros(r,1);
for i=1:r
  desired(i,1)=Cmatrix(i,c);
  endfor
Cmod=zeros(r,c-2);
for i=1:r
  Cmod(i,:)=Cmatrix(i,2:c-1);
  endfor
  
  Cmatrix=Cmod;
  
  
  
 if(N3!=0 && N4!=0)
 Cnew=[Cmatrix,aout,bout];
 elseif(N3!=0)
 Cnew=[Cmatrix,aout];
 elseif(N4!=0)
 Cnew=[Cmatrix,bout];
 else
 Cnew=Cmatrix;
 endif
 Cnew=[Cnew,desired];
  
endfunction