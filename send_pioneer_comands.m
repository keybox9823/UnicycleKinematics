function send_pioneer_comands(sp,v,w)

v = round(v* 1000);
w = round(w*180/pi);


pioneer_set_controls(sp,v,w);

end
