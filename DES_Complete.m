function out = DES_Complete(text,key,format,decrypt)
% Complete DES
% Basheq Tarifi (1696842)
%
% Implements the complete DES Algorithm for binary (format = 0),
% hexadecimal (format = 1) or ASCII (format = 2) data of any size. If the
% data character array is not a multiple of 64 bits, it is padded. There is
% also functionality to decrypt (decrypt = 1) when given the correct key.

if (nargin<3)
    format = 0;
    decrypt = 0;
elseif (nargin<4)
    decrypt = 0;
end


if (format == 0)
    binText = text;
    K = key;
elseif (format == 1)
    temp = text;
    binText = num2str(hexToBinaryVector(temp,length(temp)*4),'%d');
    K = num2str(hexToBinaryVector(key,length(key)*4),'%d');
elseif (format == 2)
    binText = reshape(dec2bin(text,8)',1,[]);
    K = reshape(dec2bin(key,8)',1,[]);
end

if mod(length(binText),64) == 0
    pText = binText;
else
    numPad = 64 - mod(length(binText),64);
    pText = binText;
    for x = 1:numPad
        pText = [pText '0'];
    end
end

cText = [];

numBlocks = length(pText)/64;

for x = 1:numBlocks
    tempCipher = DES(pText(64*x-63:64*x),K,decrypt);
    cText = [cText tempCipher];
end

asciiText = ((reshape(cText,8,[]))');

if format == 0
    out = cText;
elseif format == 1
    decText = bin2dec(asciiText);
    out = reshape((dec2hex(decText))',1,[]);
elseif format == 2
    decText = bin2dec(asciiText);
    out = char(decText');
end

end