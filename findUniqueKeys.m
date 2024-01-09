function [numUKeys,sixteen] = findUniqueKeys(key,format)
% DES Unique Subkey Tester
% Basheq Tarifi (1696842)
%
% When given a 64 bit key in binary (format = 0), hexadecimal (format = 1)
% or ASCII (format = 2), this function determines all 16 subkeys to be used
% in DES and determines how many of them are unique.

if nargin<2
    format = 0;
end

if (format == 0)
    K = key;
elseif (format == 1)
    K = num2str(hexToBinaryVector(key,length(key)*4),'%d');
elseif (format == 2)
    K = reshape(dec2bin(key,8)',1,[]);
end

keyPermute = [57 49 41 33 25 17 9 1 58 50 42 34 26 18 ...
              10 2 59 51 43 35 27 19 11 3 60 52 44 36 ...
              63 55 47 39 31 23 15 7 62 54 46 38 30 22 ...
              14 6 61 53 45 37 29 21 13 5 28 20 12 4];
K_n = [];
for x = 1:56
    K_n = [K_n K(keyPermute(x))];
end

keys = [];

for i = 1:16
    keys = [keys; subKeyGen(K_n,i)];
end

uniqueKeys = unique(keys,'rows');

sixteen = keys;
numUKeys = size(uniqueKeys,1);

end


