function plotOddball
% This script sorts exported oddball experiment data from LabChart into
% deviant & standard trials and plots them.
% A. Juavinett for BIPN 145

uiopen('.mat')

%% SET UP VARIABLES
trial = {};
deviant_trials = [];
standard_trials = [];
dev_trial = 1;
std_trial = 1;

%% GO THROUGH EACH TRIAL & SORT BY DEVIANT & STANDARD

min_trial = min(dataend - datastart); % minimum length of a trial

for iTrial = 1:length(dataend)
    trial{iTrial} = data(datastart(iTrial):dataend(iTrial));
        if dataend(iTrial)-datastart(iTrial) > 1200
            deviant_trials(dev_trial,:) = trial{iTrial}(1:min_trial);
            dev_trial = dev_trial + 1;
        else
            standard_trials(std_trial,:) = trial{iTrial}(1:min_trial);
            std_trial = std_trial +1;
        end
end

% AVERAGE trials
deviant_mean = mean(deviant_trials,'omitnan');
standard_mean = mean(standard_trials,'omitnan');

% NORMALIZE (not necessary, currently commented out)
% deviant_mean = deviant_mean - deviant_mean(1);
% standard_mean = standard_mean - standard_mean(1);

%% PLOT THE DATA
figure;
plot(standard_mean)
hold on
plot(deviant_mean)
xlabel('time (seconds)')
ylabel('voltage (\mu V)')
xticklabels([0 .2 .4 .6 .8 1])
legend({'standard','deviant'})

