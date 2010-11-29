function [stakes, bet] = calc_bet (stakes, run)

run_to_bet = 3;
inc_each_loss = 3;
min_bet = 5;
max_bet = 400;

global verbose;

if (run >= run_to_bet)
    % This next line is Max's strategy
    bet = min_bet * inc_each_loss^(run - run_to_bet);
    if (bet > max_bet) 
        if (verbose)
            fprintf(1, 'You are only allowed to bet %d.\n', max_bet);
        end
        bet = max_bet; 
    end
    if (stakes < bet)
        if (verbose)
            fprintf(1, 'You can only afford to bet %d.\n', stakes);
        end
        bet = stakes;
    end
    stakes = stakes - bet;
else
    bet = 0;
end
