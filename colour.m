function [col] = colour (pocket)

% In number ranges from 1 to 10 and 19 to 28, odd numbers are red and even are black. In ranges from 11 to 18 and 29 to 36, odd numbers are black and even are red.

% 0 green
% 1 red
% 2 black

if (pocket == 0)
    col = 0;
elseif ((pocket >= 1 && pocket <= 10) || (pocket >= 19 && pocket <= 28))
    % odd are red, even are black
    if (mod(pocket,2))
        col = 1;
    else
        col = 2;
    end
else
    % odd are black, even are red
    if (mod(pocket,2)) 
        col = 2;
    else
        col = 1;
    end
end
