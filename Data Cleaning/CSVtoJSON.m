function CSVtoJSON(f1, f2, f3)
    [~, ~, c1] = xlsread(f1);
    [~, ~, c2] = xlsread(f2);
    [~, ~, c3] = xlsread(f3);
    [r,~] = size(c1);
    
    id = fopen('out.txt', 'w');
    
    % first series
    fprintf(id, '[\n["1990", [');
     for i = 1:r
         fprintf(id, num2str(round(c1{i, 4})));
         fprintf(id, ',');
         fprintf(id, num2str(round(c1{i, 5})));
         fprintf(id, ',');
         fprintf(id, num2str(c1{i, 3}/60));
         if i ~= r
             fprintf(id, ',');
         else
             fprintf(id, '\n]\n],');
         end
     end
    
     % second series
     fprintf(id, '\n[\n"1995", [');
     for i = 1:r
         fprintf(id, num2str(round(c2{i, 4})));
         fprintf(id, ',');
         fprintf(id, num2str(round(c2{i, 5})));
         fprintf(id, ',');
         fprintf(id, num2str(c2{i, 3}/60));
         if i ~= r
             fprintf(id, ',');
         else
             fprintf(id, '\n]\n],');
         end
     end
     
     % third series
     fprintf(id, '\n["2000", [');
     for i = 1:r
         fprintf(id, num2str(round(c3{i, 4})));
         fprintf(id, ',');
         fprintf(id, num2str(round(c3{i, 5})));
         fprintf(id, ',');
         fprintf(id, num2str(c3{i, 3}/60));
         if i ~= r
             fprintf(id, ',');
         else
             fprintf(id, '\n]\n]\n]');
         end
     end
    
     fclose(id);
end