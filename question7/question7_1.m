for k = 1:4:5
    n = normrnd(0,sqrt(0.3),1,40);
    Eem = 0;
    for i = 1:40
        Eem = Eem + n(i)^2;
    end
end