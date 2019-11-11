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
## @deftypefn {} {@var{retval} =} bin (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: MAHE <MAHE@MU-STD-S45>
## Created: 2017-07-09

function [binpi] = binp(Cmatrix,N1)
[r,c]=size(Cmatrix);
r1=r-N1;
c1=c-3;
binpi=zeros(r1,c1);
j=1;
for i=1:r
  if(Cmatrix(i,1)!=1)
  binpi(j,1:c1-1)=Cmatrix(i,2:c-3);
  binpi(j,c1)=Cmatrix(i,c);
  j=j+1;
  endif
endfor
endfunction
