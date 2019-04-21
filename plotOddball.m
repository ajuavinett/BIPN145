function plotOddball(data,dataend,datastart)

trial = {};
deviant_trials = [];
standard_trials = [];

min_trial = min(dataend - datastart);

for iTrial = 1:length(dataend)
    trial{iTrial} = data(datastart(iTrial):dataend(iTrial));
        if dataend(iTrial)-datastart(iTrial) > 1200
            deviant_trials(iTrial,:) = trial{iTrial}(1:min_trial);
        else
            standard_trials(iTrial,:) = trial{iTrial}(1:min_trial);
        end
end

% average trials

deviant_mean = mean(deviant_trials,'omitnan');
deviant_mean = deviant_mean - deviant_mean(1);
standard_mean = mean(standard_trials,'omitnan');
standard_mean = standard_mean - standard_mean(1);

% plot 
figure;
plot(standard_mean)
hold on
plot(deviant_mean)
xlabel('time (seconds)')
ylabel('voltage')
xticklabels([0 .2 .4 .6 .8 1])
legend({'standard','deviant'})

