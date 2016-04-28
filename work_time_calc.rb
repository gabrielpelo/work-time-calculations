def calc(t)
  to_hour to_minute(t) + to_minute("9:48")
end

def time_to_go(t)
  t1 = to_minute(Time.now.hour.to_s + ":" + Time.now.min.to_s)
  t2 = to_minute(t)
  to_hour t2 - t1
end

def to_minute(t)
  h = t.split(/[\.:]/)[0]
  m = t.split(/[\.:]/)[1]
  r = h.to_i * 60 + m.to_i
  if r >= 24 * 60
    t = t.gsub(/\D/,'')
    t = t.to_s.rjust(4,'0')
    h = t[0..1]
    m = t[2..3]
    r = h.to_i * 60 + m.to_i
  end
  r
end

def to_hour(t)
  h = (t / 60).to_i
  m = (t % 60).to_i
  h.to_s.rjust(2, '0') + ":" + m.to_s.rjust(2, '0')
end
