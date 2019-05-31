function plotSentenceOddball
% This script sorts exported oddball experiment data from LabChart into
% deviant & standard trials and plots them.
% A. Juavinett for BIPN 145

% uiopen('.mat')
[filename,pathname] = uigetfile('*.mat','Choose your ERP .mat file(s)','MultiSelect','on');


if ~ischar(filename) == 1

    for iFile = 1:length(filename)
        display(['File: ',filename{iFile}])
        load(fullfile(pathname,filename{iFile}))
        
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
        
        % Make mega trial variable
        all_deviant(iFile,1:1195) = deviant_mean(1:1195);
        all_standard(iFile,1:1195) = standard_mean(1:1195);
        
        %% PLOT THE DATA
        figure;
        plot(standard_mean)
        hold on
        plot(deviant_mean)
        xlabel('time (seconds)')
        ylabel('voltage (\mu V)')
        xticklabels([0 .2 .4 .6 .8 1])
        legend({'standard','deviant'})
    end
    
    %% PLOT THE DATA
    figure;
    shadedErrorBar(1:1195,mean(all_standard)',(std(all_standard)/sqrt(length(filename)))','lineprops','-b','patchSaturation',0.33)
    hold on
    shadedErrorBar(1:1195,mean(all_deviant)',(std(all_standard)/sqrt(length(filename)))','lineprops','-r','patchSaturation',0.33)
    xlabel('time (seconds)')
    ylabel('voltage (\mu V)')
    xticklabels([0 .2 .4 .6 .8 1])
    legend({'standard','deviant'})
    
    
%% FOR SINGLE FILES (there is a more elegant way to do this; this is just for now)
else 
    display(['File: ',filename])
    load(fullfile(pathname,filename))
    
    %% SET UP VARIABLES
    trial = {};
    deviant_trials = [];
    standard_trials = [];
    dev_trial = 1;
    std_trial = 1;
    % figure;
    
    %% GO THROUGH EACH TRIAL & SORT BY DEVIANT & STANDARD
    
    min_trial = min(min(dataend - datastart)); % minimum length of a trial
    dev_point = 1.4e04; % how many samples after is the dev_point
    
    for iTrial = 1:length(dataend)
        
        % plot(data(1,datastart(1,iTrial):dataend(1,iTrial)))
        % hold on
  
        trial{iTrial} = data(datastart(2,iTrial):dataend(2,iTrial));
        if data(1,(datastart(1,iTrial)+dev_point)) > 5
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

    %% PLOT THE DATA
    figure;
    plot(standard_mean)
    hold on
    plot(deviant_mean)
    xlabel('time (ms)')
    ylabel('voltage (\mu V)')
    %xticklabels([0 .2 .4 .6 .8 1 1.2 1.4 1.6 1.8 2])
    legend({'standard','deviant'})
    xlim([0,4501])
    
end


