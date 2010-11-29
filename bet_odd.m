function [win] = bet_odd (pocket, bet)

odds = 2;

if (pocket > 0 && mod (pocket,2))
    win = bet*odds;
else
    win = 0;
end
