function [loot, pocket] = gamble (bets)
% bets: array of bets - [low high red black even odd]  
% returns an array of returns in the same order

if length (bets) ~= 6
    error('myApp:argChk', 'Wrong number of input arguments')
end  

pocket = spin ();

loot (1,1) = bet_low (pocket, bets(1,1));
loot (1,2) = bet_high (pocket, bets(1,2));
loot (1,3) = bet_red (pocket, bets(1,3));
loot (1,4) = bet_black (pocket, bets(1,4));
loot (1,5) = bet_even (pocket, bets(1,5));
loot (1,6) = bet_odd (pocket, bets(1,6));

