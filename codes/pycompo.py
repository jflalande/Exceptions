class Patient:

  name = "Anonyme"

class Hopital:

  patients = []

  def putPatient(self, p):
    self.patients.append(p)

if __name__ == "__main__":

  p = Hopital()
  jf = Patient()
  jf.name = "JF"
  fred = Patient()
  fred.name = "Fred"
  p.putPatient(jf)
  p.putPatient(fred)
