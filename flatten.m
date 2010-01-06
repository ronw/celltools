function y = flatten(x)
% y = flatten(x)
%
% Takes a cell array x that contains nested cell arrays and
% flattens the contents into a single cell array.
% E.g. flatten({1, {2, 3, {4}, 5}}) returns {1, 2, 3, 4, 5}

% Copyright (C) 2007 Ron J. Weiss
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

if ~iscell(x)
  error('flatten only works on cell arrays.');
end

y = inner_flatten(x);


function y = inner_flatten(x)
if ~iscell(x)
  y = {x};
else
  y = {};
  for n = 1:length(x)
    tmp = inner_flatten(x{n});
    y = {y{:} tmp{:}};
  end
end
