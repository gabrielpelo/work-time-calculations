class Instant
  MINUTES_IN_DAY = 1440
  @time

  def initialize(t)
    if t.is_a? Numeric
      @time = t
    elsif t.is_a? String
      @time = convert_to_m(t)
    else
      raise "Invalid value to initialize an Instant."
    end
  end

  def to_i
    @time
  end

  def to_s
    h = (@time / 60).to_i.to_s.rjust(2, '0')
    m = (@time % 60).to_i.to_s.rjust(2, '0')
    h + ":" + m
  end

  def +(t)
    Instant.new(@time + t.to_i)
  end

  def -(t)
    Instant.new(@time - t.to_i)
  end

  def self.now
    Instant.new(Time.now.hour.to_s + ":" + Time.now.min.to_s)
  end

  private
    def convert_to_m(s)
      r = split_with_separator(s)
      if r >= MINUTES_IN_DAY
        r = split_without_separator(s)
      end
      r
    end

    def split_with_separator(s)
      sep = /[\.:]/
      h = s.split(sep)[0]
      m = s.split(sep)[1]
      to_m(h, m)
    end

    def split_without_separator(s)
      s = s.gsub(/\D/,'').to_s.rjust(4,'0')
      h = s[0..1]
      m = s[2..3]
      to_m(h, m)
    end

    def to_m(h, m)
      h.to_i * 60 + m.to_i
    end
end
