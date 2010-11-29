function [win] = bet_high (pocket, bet)

odds = 2;

if (pocket >= 19 && pocket <= 36)
    win = bet*odds;
else
    win = 0;
end
