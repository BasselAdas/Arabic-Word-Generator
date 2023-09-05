Combination cmb;
int y = 20;
int cellSize = 14;
Table table;

String [] alphabet = {"ا", "ب", "ت", "ث", "ج", "ح", "خ", "د", "ذ", "ر", "ز", "س", "ش", "ص", "ض", "ط", "ظ", "ع", "غ", "ف", "ق", "ك", "ل", "م", "ن", "ه", "و", "ي", "ء", "أ", "ؤ", "ة", "إ", "ى", "ئ"};



void setup() {
  size(600, 1000);
  background(255);

  table = new Table();

  table.addColumn("comb");

  for (int i = 0; i < 35; i++) {
    table.addColumn(str(i));
  }


  String [] lines = loadStrings("test.txt");

  for (int i = 0; i < lines.length; i++) {//loop through every single line 
    String [] words = split(lines[i], ' ');// split the words in every line 
    for (int j = 0; j < words.length; j++) {// loop through the splited words 
      for (int k = 0; k < words[j].length(); k++) {//loop through the charachters of every word 
        cmb = new Combination(k+1);// create a new empty combination with size of k+1 inorder to avoid 0 size char array. 
        cmb.populate(k, words[j]);// give the size of current combination 
        cmb.next_letter(k, words[j]);
        cmb.check();
        //cmb.calc_per();
        //cmb.draw_row();
      }
    }
  }
  saveTable(table, "data/table.csv");
  cmb.draw_row();

}


void draw() {
 

  for (int x = 0; x < 35; x++) {
    fill(0);
    textSize(7);
    text(alphabet[x], x * cellSize + 105, 7);
  }
}
