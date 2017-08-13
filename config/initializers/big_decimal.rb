class BigDecimal
  def signif digits
    BigDecimal("%.#{digits}g" % self)
  end
end
