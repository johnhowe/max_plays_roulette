function [win] = bet_even (pocket, bet)

odds = 2;

if (pocket > 0 && ~mod (pocket,2))
    win = odds*bet;
else
    win = 0;
end
