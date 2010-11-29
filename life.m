
rounds = 40; % Max likes to indulge in 40 rounds when he is binging.
investments = 100; % Max likes to break out a $100 bill each time he goes on a binge.
lifetime = 365*40; % How many binges does Max want to take?

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

fprintf(1, 'Max%ss biggest take was $%d.\n', "'", record_win - investments); 


if (winnings<0)
    fprintf(1, 'Having spent %d nights at the casino Max lost $%d.\n', lifetime, abs(winnings)); 
else
    fprintf(1, 'Max has beaten the odds over %d nights. Max is up $%d.\n', lifetime, winnings); 
end

plot (wealth)
xlabel('Nights at the casino')
ylabel('Winnings ($)')
title('The life of Max')
print (strcat(int2str(time()), ".png"), '-dpng')


