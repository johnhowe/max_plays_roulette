function [stakes, bet] = calc_bet (stakes, run)

run_to_bet = 3; % Max likes to bet after a run of three as the ball is way more likely to change its behaviour after having three of the same thing in a row.
inc_each_loss = 3; % Max likes to triple up after a loss.
min_bet = 5; % Max likes to start betting with a $5 chip.
max_bet = 450; % Max can only bet up to $450 - or something like that, I forget.

global verbose;

if (run >= run_to_bet)
    % This next line is Max's strategy
    bet = min_bet * inc_each_loss^(run - run_to_bet);
    if (bet > max_bet) 
        if (verbose)
            fprintf(1, 'Max is only allowed to bet %d.\n', max_bet);
        end
        bet = max_bet; 
    end
    if (stakes < bet)
        if (verbose)
            fprintf(1, 'Max only has $%d, not $%d.\n', stakes, bet);
        end
        bet = stakes;
    end
    stakes = stakes - bet;
else
    bet = 0;
end
