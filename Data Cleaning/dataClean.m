function dataClean(file)
    [~, ~, raw] = xlsread(file);
    [r, ~] = size(raw); 
    for i = r:-1:1
        if(isnan(raw{i,3}))
            raw(i,:) = [];
        else
            raw{i,3} = (raw{i,3});
        end
    end
    xlswrite([file(1:end-5), 'Clean2.xlsx'], raw);
end