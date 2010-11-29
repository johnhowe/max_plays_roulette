
rounds = 40; % rounds played per binge
investments = 100; % $ starting each binge
lifetime = 52; % binges to indulge in

winnings = 0;
record_win = 0;

wealth = zeros (1,lifetime);

for j=1:lifetime
    wealth (1,j) = winnings;
    returns = addict (investments, rounds);
    winnings = winnings + returns - investments;
    if (returns > record_win)
        record_win = returns;
    end
end

fprintf(1, 'Your biggest take was $%d.\n', record_win - investments); 


if (winnings<0)
    fprintf(1, 'Having spent %d nights at the casino you have lost $%d.\n', lifetime, abs(winnings)); 
else
    fprintf(1, 'You have beaten the odds over %d nights. You are up $%d.\n', lifetime, winnings); 
end

plot (wealth);

