function plotLabChartSpectrumData(SpectrumData)

% first, go to "import data' to import your lab chart spectrum data.
% after importing your data as a numerical matrix, you can use this script
% if your file does not import as a variable "SpectrumData", rename it
 
% save the axis values
frequency = SpectrumData(1,2:end);
time = round(SpectrumData(1,3:end),1);
data = SpectrumData(3:end,2:end);

% create your figure!
figure;
imagesc(flip(data'),[0,10^-12])
power = colorbar;
set(get(power,'label'),'string','Power (V^2)'); 

% change the color axis to match the scale of your data
caxis([0,10^-11])

% correct the time axis
%xticks([0:length(time)/5:length(time)])
xticklabels(time(xticks))
time_label = xlabel('time (seconds)');
time_label.FontSize = 14;

% correct the frequency axis
yticks([0:length(frequency)/5:length(frequency)])
yticklabels(flip([0:frequency(end)/5:200]))
freq_label = ylabel('frequency (Hz)');
freq_label.FontSize = 14;

% if you want to restrict frequencies
max_freq = 100;
freq_id = find(frequency == max_freq);
ylim([length(frequency)-freq_id length(frequency)])


