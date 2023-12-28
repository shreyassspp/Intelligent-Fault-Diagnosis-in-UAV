clc;
clear;


maxAmp = 7;

t = 0:0.1:7;
y = zeros(size(t));
tf = 4.3;

for i = 1:size(t,2)
    y1(i) = getValue(t(i),tf,1);
    y2(i) = getValue(t(i),tf,2);
    y3(i) = getValue(t(i),tf,3);
    y4(i) = getValue(t(i),tf,4);
    y(i) = getValue(t(i),tf,0);
end

y_upper = maxAmp*ones(size(t));
y_lower = -maxAmp*ones(size(t));


figure(1)
plot(t,y_upper,'r--')
hold on
plot(t,y_lower,'r--')
hold on
plot(t,y4,'b')


title('Total System Failure Fault')
ylabel('Deflection Angle')
xlabel('Time') 


function y = getValue(t,tf,type)
amp= 5;w= pi;
maxAmp = 7;

y = amp*sin(w*t);

    if(t>tf)
        if type==1
            y = amp*sin(w*tf);
        elseif type==2
            y=y*0.7;
        elseif type==3
            y = maxAmp;
        elseif type ==4
            y=5*abs(rand);
        end
    end
end