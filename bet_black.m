function [win] = bet_black (pocket, bet)

% 0 green
% 1 red
% 2 black

odds = 2;

if (colour(pocket) == 2)
    win = odds*bet;
else
    win = 0;
end
