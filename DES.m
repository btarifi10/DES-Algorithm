function cipher = DES(plain,K,decrypt)
% DES
% Basheq Tarifi (1696842)
%
% Implements all 16 Rounds of DES given the 64 bit input text and the 64
% bit key (including parity bits). If decryption functionality is used, the
% order of the subkeys are reversed to DES descrypt the input.

iPermuteTable = [58 50 42 34 26 18 10 2 60 52 44 36 28 20 12 4 ...
                 62 54 46 38 30 22 14 6 64 56 48 40 32 24 16 8 ...
                 57 49 41 33 25 17  9 1 59 51 43 35 27 19 11 3 ...
                 61 53 45 37 29 21 13 5 63 55 47 39 31 23 15 7];
             
keyPermute = [57 49 41 33 25 17 9 1 58 50 42 34 26 18 ...
              10 2 59 51 43 35 27 19 11 3 60 52 44 36 ...
              63 55 47 39 31 23 15 7 62 54 46 38 30 22 ...
              14 6 61 53 45 37 29 21 13 5 28 20 12 4];
          
fPermuteTable = [40 8 48 16 56 24 64 32 39 7 47 15 55 23 63 31 ...
                38 6 46 14 54 22 62 30 37 5 45 13 53 21 61 29 ...
                36 4 44 12 52 20 60 28 35 3 43 11 51 19 59 27 ...
                34 2 42 10 50 18 58 26 33 1 41 9 49 17 57 25];

if (nargin<3)||(decrypt==0)
    rounds = 1:1:16;
elseif decrypt==1
    rounds = 16:-1:1;
end

K_n = [];
for x = 1:56
    K_n = [K_n K(keyPermute(x))];
end

desIn = [];
for x = 1:64
    desIn = [desIn plain(iPermuteTable(x))];
end

for i = rounds
    
    K_i = subKeyGen(K_n,i);
    
    [L_i,R_i] = DESOneRound(desIn,K_i);
    
    desIn = [L_i R_i];
end

postPermIn = [R_i L_i];

desPacito = [];
for x = 1:64
    desPacito = [desPacito postPermIn(fPermuteTable(x))];
end

cipher = desPacito;
end

