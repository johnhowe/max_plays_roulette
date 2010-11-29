function [win] = bet_low (pocket, bet)

odds = 2;

if (pocket >= 1 && pocket <= 18)
    win = odds * bet;
else
    win = 0;
end

