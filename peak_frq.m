## Copyright (C) 2019 zahra
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
## @deftypefn {} {@var{retval} =} peak_frq (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: zahra <zahra@zahra-Lenovo-ideapad-500-15ISK>
## Created: 2019-06-06

function [pF] = peak_frq (address)

  [x, fs] = audioread(address); ##data and sampling frequency
  y = fft(x); ##fast fourier transfer on signal data
  n = length(x);
  f = (0:n-1)*(fs/n); ##fs/n: frequency increment --> frequency range
  power = (abs(y) .^ 2)/n;
  [pP, pF] = max(abs(power));
  pF = f(pF);
endfunction
