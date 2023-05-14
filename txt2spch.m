function txt2spch(transcript_wrds,spch_speed)

dum = 0;
whl_txt15 = {''};
whl_txt = {''};
for ind1 = 1:length(transcript_wrds)-1
    dum = dum + 1;
    whl_txt = strcat(whl_txt,transcript_wrds(ind1),{' '});
    if ind1 <= 15
        whl_txt15 = strcat(whl_txt15,transcript_wrds(ind1),{' '});
        disp(whl_txt15); pause(0.5); 
        if ind1 == 15
            whl_txt15 = {''}; dum = 0;
        end       
        if dum < 15
            clc;
        end
    elseif ind1 <= 30
        whl_txt15 = strcat(whl_txt15,transcript_wrds(ind1),{' '});
        disp(whl_txt15); pause(0.5);
        if ind1 == 30 
            whl_txt15 = {''}; dum = 0;
        end
        if dum < 30
            clc;
        end
    elseif ind1 <= 45
        whl_txt15 = strcat(whl_txt15,transcript_wrds(ind1),{' '});
        disp(whl_txt15); pause(0.5);
        if ind1 == 45 
            whl_txt15 = {''}; dum = 0;
        end
        if dum < 45
            clc;
        end
    elseif ind1 <= 60
        whl_txt15 = strcat(whl_txt15,transcript_wrds(ind1),{' '});
        disp(whl_txt15); pause(0.5);
        if ind1 == 60 
            whl_txt15 = {''}; dum = 0;
        end
        if dum < 60
            clc;
        end
    elseif ind1 <= 75
        whl_txt15 = strcat(whl_txt15,transcript_wrds(ind1),{' '});
        disp(whl_txt15); pause(0.5);
        if ind1 == 75 
            whl_txt15 = {''}; dum = 0;
        end
        if dum < 75
            clc;
        end
    elseif ind1 <= 90
        whl_txt15 = strcat(whl_txt15,transcript_wrds(ind1),{' '});
        disp(whl_txt15); pause(0.5);
        if ind1 == 90 
            whl_txt15 = {''}; dum = 0;
        end
        if dum < 90
            clc;
        end
    end
end

if isempty(char(whl_txt))
    disp("There's no speech or the speech quality is too low!")
else
    tts(convertStringsToChars(whl_txt), 'PACE', spch_speed);
end

end