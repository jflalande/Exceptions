class Toto():

  def test(self):
    return 10;

  def __test2(self):
    return 15;

if __name__ == "__main__":
  t = Toto()
  print t.test(); # Ok, that's public
  #print t.test2(); # Not ok, that's private
  print t._Toto__test2(); # Ok, too !
