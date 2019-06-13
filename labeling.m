## Author: zahra <zahra@zahra-Lenovo-ideapad-500-15ISK>
## Created: 2019-06-06

function [retval] = labeling (folder)
audio_files=dir(fullfile(folder,'*.wav'))
eps = 30; ##Error in peak frequency
for k=1:numel(audio_files)
  file_address = strcat(folder, '/', audio_files(k).name);
  tmp = peak_frq(file_address);
  printf("%s peak = %d\n", audio_files(k).name, tmp(1,1)); 
  if(tmp > 122 - eps && tmp < 122 + eps)
    f = audio_files(k).name;
    rf = strcat('M_', f) ;
    movefile(fullfile(folder, audio_files(k).name), fullfile(folder, rf));     
    printf("%s peak = %d therefore male voice\n", audio_files(k).name, tmp(1,1)); 
  elseif(tmp > 212 - eps && tmp < 212 + eps) 
    f = audio_files(k).name;
    rf = strcat('F_', f) ;
    movefile(fullfile(folder, audio_files(k).name), fullfile(folder, rf));     
    printf("%s peak = %d therefore female voice\n", audio_files(k).name, tmp(1,1));
  else
    f = audio_files(k).name;
    rf = strcat('U_', f) ;
    movefile(fullfile(folder, audio_files(k).name), fullfile(folder, rf));     
    printf("%s peak = %d therefore unknown gender\n", audio_files(k).name, tmp(1,1));
  end 
end
endfunction