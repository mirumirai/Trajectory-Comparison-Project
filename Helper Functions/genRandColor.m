%Biased towards darker colors, not fully random
function [randColor] = genRandColor
    red = abs(rand()-.1);
    green = abs(rand()-.1);
    blue = abs(rand()-.1);
    randColor = [red green blue];
end