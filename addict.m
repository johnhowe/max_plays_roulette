function [stakes] = addict (income, rounds)

global verbose;
verbose = 0;

stakes = income;

low_run = 0;
high_run = 0;
red_run = 0;
black_run = 0;
even_run = 0;
odd_run = 0;

for i = 1:rounds
    if stakes <= 0
        % You loose
        if (verbose)
            fprintf(1, 'You lost all your money in %d rounds.\n', i); 
        end
        break;
    end

    [stakes, low_bet] = calc_bet (stakes, high_run);
    [stakes, high_bet] = calc_bet (stakes, low_run);
    [stakes, red_bet] = calc_bet (stakes, black_run);
    [stakes, black_bet] = calc_bet (stakes, red_run);
    [stakes, even_bet] = calc_bet (stakes, odd_run);
    [stakes, odd_bet] = calc_bet (stakes, even_run);
    bets = ([low_bet high_bet red_bet black_bet even_bet odd_bet]);

    [payout, pocket] = gamble (bets);

    if (verbose)
        if (low_bet) fprintf(1, 'You bet %d on low.\n', low_bet); end
        if (high_bet) fprintf(1, 'You bet %d on high.\n', high_bet); end
        if (red_bet) fprintf(1, 'You bet %d on red.\n', red_bet); end
        if (black_bet) fprintf(1, 'You bet %d on black.\n', black_bet); end
        if (even_bet) fprintf(1, 'You bet %d on even.\n', even_bet); end
        if (odd_bet) fprintf(1, 'You bet %d on odd.\n', odd_bet); end
        switch (colour(pocket))
            case 0
                fprintf(1, 'Dealer spins a green %d, you bet $%d and won $%d.\n', pocket, sum(bets), sum(payout)); 
            case 1
                fprintf(1, 'Dealer spins a red %d, you bet $%d and won $%d.\n', pocket, sum(bets), sum(payout)); 
            case 2
                fprintf(1, 'Dealer spins a black %d, you bet $$%d and won $%d.\n', pocket, sum(bets), sum(payout)); 
        end
        fprintf(1, 'You have $%d.\n\n', stakes); 
    end

    stakes = stakes + sum(payout);

    % Updating the length of the runs
    if (pocket == 0) %HOUSE

    else
        if (colour(pocket) == 1) %RED
            red_run = red_run + 1;
            black_run = 0;
        else
            black_run = black_run + 1;
            red_run = 0;
        end
        if (pocket >= 19 && pocket <= 36) %HIGH
            high_run = high_run + 1;
            low_run = 0;
        else
            low_run = low_run + 1;
            high_run = 0;
        end
        if (pocket > 0 && ~mod (pocket,2)) %EVEN
            even_run = even_run + 1;
            odd_run = 0;
        else
            odd_run = odd_run + 1;
            even_run = 0;
        end
    end
end

fprintf(1, 'You came with $%d and leave with $%d after %d spins, a take of $%d\n', income, stakes, i, stakes - income); 
