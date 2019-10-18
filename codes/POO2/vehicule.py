class Vehicule:

  marque = "Peugeot" # Static variable... but may used as an object attribute

  def demarrer(self):
    return 0

v = Vehicule()
print("Vehicule.marque: " + Vehicule.marque)
print("v.marque: " + v.marque + " -- WTF?")
v2 = Vehicule()
v2.marque = "Toyota"
print("v2.marque: " + v2.marque)
print("v.marque: " + v.marque)
