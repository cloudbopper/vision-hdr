%% plots response curves for HDR
%
% input: 3-channel response function
%
function [ ] = plot_response_curve( gs )

figure;
xlabel('Pixel Value Z');
ylabel('Log Exposure X');
hold;
plot(gs(:,1), 'r');
plot(gs(:,2), 'g');
plot(gs(:,3), 'b');
title('Imaging response curve');
legend('R channel', 'G channel', 'B channel', 'Location', 'southeast');
end

