data = xlsread('data_mag_rad.xls');
mag = data(:,7);
rad = data(:,6);

mag_norm = (max(mag) - mag)/(max(mag) - min(mag)); %????????????
rad_norm = (max(rad) - rad)/(max(rad) - min(rad));

mag_average = 1:mag_norm/5; %???????? ??????? ? ?????? ?? ?????
rad_average = 1:rad_norm/5;

j = 1;
for i = 5:5:length(mag_norm) %???????? ????????????? ?????????? ?????
    local = mag_norm(i-4:i);
    mag_average(j) = mean(local);
    j = j + 1;
end

j = 1;
for i = 5:5:length(rad_norm) %???????? ??????????? ?????????? ?????
    local = rad_norm(i-4:i);
    rad_average(j) = mean(local);
    j = j + 1;
end

flipted_mag = fliplr(mag_average); %???????????? ??????????? ????????????? 
result_average = 1:length(flipted_mag); %???????? ???????? ??????? 
for i = 1:length(result_average) %?????? ???????? ??????? 
    local = rad_average(i)*flipted_mag(i); 
    result_average(i) = mean(local); 
end 

hold on; %???????
plot(mag_average,'b'); 
plot(rad_average,'r');
plot(result_average, 'g');
legend('magnit','radio','average')