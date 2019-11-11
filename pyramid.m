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
## @deftypefn {} {@var{retval} =} pyramid (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: MAHE <MAHE@MU-STD-S45>
## Created: 2017-07-09

function [wfin] = pyramid (k)
[w] = j1(k);
disp(w);
[cm,n1,n2,n3,n4]=classifyit(k,w);
disp(" Classification Matrix- class no-input(1-n)-desired output");
disp(cm);
[cnew,cdoll]=newin(cm,n3,n4);
disp(" ");
disp(" Augmented input matrix with a and b outputs at the end, and last column desired output");
disp(cnew);
[wfin] = svmap (cnew);
#{
disp(n1);
disp(" ");
disp(n2);
disp(" ");
disp(n3);
disp(" ");
disp(n4);
disp(" ");
#}
disp("Final Weight  matrix for neuron")
disp(wfin);
disp(" ");

if(n3>0)
cdoll2=cdoll;
disp("a");
[ainput] = ain(cdoll2,n2);
%disp("ainput");
%disp(ainput);
[wa]=pyramid(ainput);
endif
if(n4!=0)
cdoll3=cdoll;
disp("b");
[binput]=binp(cdoll3,n1);
%disp("binput");
%disp(binput);
[wb]=pyramid(binput);
endif

disp("Done");

endfunction
