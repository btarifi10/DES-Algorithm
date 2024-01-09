function [K_i] = subKeyGen(K,i)
% DES Subkey Generator
% Basheq Tarifi (1696842)
%
% When given the 56 bit binary key (after parity bits have been removed),
% this function returns the i-th 48 bit subkey which should be used in the
% i-th round of DES.

if ~ischar(K)
    error('Please input a string for K');
end

keyShiftTable = [1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1];

keyCompressTable = [14 17 11 24 1 5 3 28 15 6 21 10 ...
               23 19 12 4 26 8 16 7 27 20 13 2 ...
               41 52 31 37 47 55 30 40 51 45 33 48 ...
               44 49 39 56 34 53 46 42 50 36 29 32];
           
shift = sum(keyShiftTable(1:i));

lKey = K(1:28);
rKey = K(29:56);

lKey = [lKey(shift+1:28) lKey(1:shift)];
rKey = [rKey(shift+1:28) rKey(1:shift)];

sKey = [lKey rKey];

K_i = [];
for x = 1:48
    K_i = [K_i sKey(keyCompressTable(x))];
end

end

