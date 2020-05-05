function I = simpson38(func,a,b,n)
% Application of simpson's 3/8 rule
% Simpson38: composite of simpson's 3/8 rule 
% I = simpson38(func,a,b,n):
%   composite trapezoidal rule
% Inputs:
%   func = function to be integrated
%   a,b = integration limits
%   n = number of segments (default = 99)
% Output:
%   I = integral estimate

%Created by: David Pelley
%9/22/2019

if nargin<3, error('At least 3 input arguments required'), end
if ~(b>a), error('Upper bound must be greater than lower'),end
if nargin<4||isempty(n) n = 99;
elseif mod(n,3) >0
    error('Number of Segments should be Multiple of 3')
end

x = a;
h = (b-a)/n;
m = n/3;
s = 0;
for i = 1:m
    s = s+func(x) +3*func(x+h) + 3*func(x+2*h) + func(x+3*h);
    x = x + 3 * h;
end
I = 3*(b-a)*s/(8*n);
