%% Basheq Tarifi (1696842)
clear all
clc
format long
disp("Basheq Tarifi (1696842)");

%% Testing of Unique Keys
disp("Testing of Unique Keys:");

K1 = '1F1F1F1F0E0E0E0E';
K2 = '1FFE1FFE0EFE0EFE';
K3 = '1FFEFE1F0EFEFE0E';
Keys = [K1; K2; K3];
NumUniqueSubkeys = [findUniqueKeys(K1,1);...
                    findUniqueKeys(K2,1);...
                    findUniqueKeys(K3,1)];

classification = table(NumUniqueSubkeys,'RowNames',string(Keys))

%% Binary Testing of DES
disp("Binary Testing of DES:");
disp("Encryption:")
plain = '0000000100100011010001010110011110001001101010111100110111101111'
key = '0001001100110100010101110111100110011011101111001101111111110001'

cipher = DES_Complete(plain,key,0,0)

disp("Decryption:")
recoveredPlain = DES_Complete(cipher,key,0,1)
%% Hexadecimal Testing
disp("Hex Testing of DES:")
M = '0123456789ABCDEF';
K = '133457799BBCDFF1';
C = DES_Complete(M,K,1,0);

recoveredM = DES_Complete(C,K,1,1);
names = ["Plain text";"Key";"Cipher text";"Decrypted Cipher Text"];
Value = string([M;K;C;recoveredM]);
table(Value,'RowNames',names)

disp("Hex Testing of greater than 64 bits:")
disp("Encryption:")
M = '6570737465696e6469646e746b696c6c68696d73656c66696c6c756d696e617469636f6e6669726d6564'
K = '0E329232EA6D0D73'
C = DES_Complete(M,K,1,0)
disp("Decryption:")

RecoveredM = DES_Complete(C,K,1,1)
%% ASCII Testing of DES
disp("ASCII Testing:")
disp("Encryption:")
M = 'Mama, uwu Didn''t mean to make you cry If I''m not back again this time tomorrow Carry on, carry on As if nothing really matters'
K = 'fmercury'
C = DES_Complete(M,K,2,0)

disp("Decryption:")
RecoveredM = DES_Complete(C,K,2,1)

%% Triple DES
disp("Triple DES:")

M = '0123456789ABCDEF';
K1 = '133457799BBCDFF1';
K2 = '0E329232EA6D0D73';
K3 = '596F7572206C6970';
    
M1 = DES_Complete(M,K1,1,0);
M2 = DES_Complete(M1,K2,1,1);
	
C = DES_Complete(M2,K3,1,0);

Names = ["Plain Text"; "Key 1"; "Key 2"; "Key 3"; ...
        "First Intermediate"; "Second Intermediate"; "Final Cipher Text"];
Value = string([M;K1;K2;K3;M1;M2;C]);

table(Value,'RowNames',Names)