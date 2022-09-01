int n;
int n2;
int n3;
String k = "Arvaa numero";
int snumero = int(random(0,1000));
boolean arvaa = false;
boolean arvattu = false;
float sijainti = 300;
float nmaara = 0;
int arvaus;
int arvaukset = 0;
int aika = 250;

void setup ()
{
  size(600,600);
  textAlign(CENTER,CENTER);
  colorMode(HSB,100);
  textSize(40);
  background(0);
}

void draw()
{
  background(0);
  text(arvaus,300,300);
  text(k,300,200);
  //println(n,n2,n3,nmaara,arvaus,snumero,aika);
  frameRate(60);
  //Logiikka
  arvaus = n + n2 + n3;
  if (nmaara < 1)
  {
    nmaara = 0;
  }
  //Testaa osuuko arvaus oikeaan ja reagoi
  if ((arvaus == snumero) && (arvaa == true))
  {
    textSize(40);
    k = "Arvasit oikein luku on" + " " + snumero;
    arvattu = true;
    aika = aika - 1;
  }
  if ((arvaus > snumero) && (arvaa == true))
  {
    k = "Luku on pienempi";
    arvaa = false;
    nmaara = 0;
    n = 0;
    n2 = 0;
    n3 = 0;
  }
  if ((arvaus < snumero) && (arvaa == true))
  {
    k = "Luku on suurempi";
    arvaa = false;
    nmaara = 0;
    n = 0;
    n2 = 0;
    n3 = 0;
  }
  
  //Uusi peli
  if ((arvattu == true) && (aika <= 0))
  {
    k = "Klikkaa pelataksesi uudestaan \n Arvauksien määrä "+arvaukset;
    if (mousePressed == true) {
      snumero = int(random(0,1000));
      n = 0;
      n2 = 0;
      n3 = 0;
      nmaara = 0;
      arvattu = false;
      k = "Arvaa numero";
      aika = 250;
      arvaa = false;
    }
  }
}


void keyPressed()
{
  //Arvaa
  if ((key == ENTER) && (arvattu == false))
  {
    arvaa = true;
    arvaukset = arvaukset + 1;   // Arvauksien määrä
  }
  //Kumittaminen
  if (key == BACKSPACE)
  {
    if ((nmaara == 1) && (key == ''))
    {
      n = 0;
      nmaara = nmaara - 1;
    }
    else if ((nmaara == 2) && (key == ''))
    {
      n2 = 0;
      n = n / 10;
      nmaara = nmaara - 1;
    }
    else if ((nmaara == 3) && (key == ''))
    {
      n3 = 0;
      n2 = n2 / 10;
      n = n / 10;
      nmaara = nmaara - 1;
    }
  }
  
  //Arvauksen kirjoittaminen
  if ((key != ENTER) && (key != BACKSPACE) && (key-48 >= 0) && (key-48 <= 9))
  {
    if (nmaara == 0)
    {
      n = key - 48;
      nmaara = nmaara + 1;
    }
    else if (nmaara == 1)
    {
      n = n * 10;
      n2 = key - 48;
      nmaara = nmaara + 1;
    }
    else if (nmaara == 2)
    {
      n = n * 10;
      n2 = n2 * 10;
      n3 = key - 48;
      nmaara = nmaara + 1;
    }
  }
}
    
