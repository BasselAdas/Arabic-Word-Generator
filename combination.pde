class Combination {

  char  [] comb;
  float [] letters;
  float [] percentages;



  Combination(int n) {
    comb = new char[n];
    letters     = new float[35];
    percentages = new float[35];
  }

  void populate(int a, String w) {// takes the size of the word and the word it self 
    while ( a >= 0) {
      this.comb [a] = w.charAt(a);
      //next_letter(a, w);
      a--;
    }
  }




  void next_letter(int a, String w) {

    if ( (a + 1) < w.length()) {

      switch(w.charAt(a + 1)) {

      case 'ا': 
        letters[0] = letters[0] + 1;  
        break;
      case 'ب': 
        letters[1] = letters[1] + 1;  
        break;
      case 'ت': 
        letters[2] = letters[2] + 1; 
        break;
      case 'ث': 
        letters[3] = letters[3] + 1; 
        break;
      case 'ج': 
        letters[4] = letters[4] + 1;  
        break;
      case 'ح': 
        letters[5] = letters[5] + 1;  
        break;
      case 'خ': 
        letters[6] = letters[6] + 1; 
        break;
      case 'د': 
        letters[7] = letters[7] + 1;  
        break;
      case 'ذ': 
        letters[8] = letters[8] + 1; 
        break;
      case 'ر': 
        letters[9] = letters[9] + 1;  
        break;
      case 'ز': 
        letters[10] = letters[10] + 1;  
        break;
      case 'س': 
        letters[11] = letters[11] + 1;  
        break;
      case 'ش': 
        letters[12] = letters[12] + 1; 
        break;
      case 'ص': 
        letters[13] = letters[13] + 1;  
        break;
      case 'ض': 
        letters[14] = letters[14] + 1;  
        break;
      case 'ط': 
        letters[15] = letters[15] + 1;  
        break;
      case 'ظ': 
        letters[16] = letters[16] + 1;  
        break;
      case 'ع': 
        letters[17] = letters[17] + 1;  
        break;
      case 'غ': 
        letters[18] = letters[18] + 1;  
        break;
      case 'ف': 
        letters[19] = letters[19] + 1;  
        break;
      case 'ق': 
        letters[20] = letters[20] + 1;  
        break;
      case 'ك': 
        letters[21] = letters[21] + 1;  
        break;
      case 'ل': 
        letters[22] = letters[22] + 1;  
        break;
      case 'م': 
        letters[23] = letters[23] + 1;  
        break;
      case 'ن': 
        letters[24] = letters[24] + 1; 
        break;
      case 'ه': 
        letters[25] = letters[25] + 1;  
        break;
      case 'و': 
        letters[26] = letters[26] + 1;  
        break;
      case 'ي': 
        letters[27] = letters[27] + 1;  
        break;
      case 'ء': 
        letters[28] = letters[28] + 1;  
        break;
      case 'أ': 
        letters[29] = letters[29] + 1;  
        break;
      case 'ؤ': 
        letters[30] = letters[30] + 1;  
        break;
      case 'ة': 
        letters[31] = letters[31] + 1;  
        break;
      case 'إ': 
        letters[32] = letters[32] + 1;  
        break;
      case 'ى': 
        letters[33] = letters[33] + 1;  
        break;
      case 'ئ': 
        letters[34] = letters[34] + 1;  
        break;
        //default:             
        //  println("None");   
        //  break;
      }
    }
  }


  //void calc_per() {

  //  float sum = 0;

  //  for (int i = 0; i < 35; i++) {
  //    sum += this.letters[i];
  //  }

  //  for (int i = 0; i < 35; i++) {
  //    if (sum != 0) {
  //      float per = (this.letters[i] / sum) * 100;
  //      float m = map(per, 0, 100, 0, 255);
  //      this.percentages[i] = m;
  //      //println(m);
  //    } else {
  //      this.percentages[i] = 0; // Set to 0 if sum is 0 to avoid NaN
  //    }
  //  }
  //}



  void draw_row() {

    for (TableRow row : table.rows()) {

      float sum = 0;

      for (int i = 0; i < 35; i++) {
        sum += row.getInt(str(i));
      }

      for (int i = 0; i < 35; i++) {
        if (sum != 0) {
          float per = (row.getInt(str(i)) / sum) * 100;
          float m = map(per, 0, 100, 0, 255);
          this.percentages[i] = m;
          //println(m);
        } else {
          this.percentages[i] = 0; // Set to 0 if sum is 0 to avoid NaN
        }
      }



      String b   = row.getString("comb");
      fill(0);
      textSize(19);
      text(b, 5, y);

      for (int x = 0; x < 35; x++) {
        //if (Float.isNaN(percentages[x])){ // if it is null 
        //fill(255); //fill it with white
        //} else {
        //println(percentages[x]);
        fill(255 - this.percentages[x]); // so that 100% is black.
        //}
        rect (x * cellSize + 100, y - 10, cellSize, cellSize);
      }
      y += 20;
    }
  }


  void check() {

    String a  = new String(this.comb);//convert the array of Chars of current combination into a String and store it in a variable inorder to compare to already existing combinations in the table 

    boolean exists = false;

    for (TableRow row : table.rows()) {//loop through the already saved rows in the table
      String c = row.getString("comb");//save its

      if (c.equals(a)) {
        exists = true;
        for (int x = 0; x < 35; x++) {
          int prev  = row.getInt(str(x));
          this.letters[x] = this.letters[x] + prev;
          row.setFloat(str(x), this.letters[x]);
        }
        break;
      }
    }

    if (!exists) {

      TableRow newRow = table.addRow();
      newRow.setString("comb", a);

      for (int x = 0; x < 35; x++) {
        newRow.setFloat(str(x), letters[x]);
      }
    }

    //  TableRow result = table.findRow(a, "comb");

    //  if (result == null) {//add combination to the table only if there is no match
    //    TableRow newRow = table.addRow();
    //    //println(table.getRowCount());
    //    newRow.setString("comb", a);
    //    for (int x = 0; x < 35; x++) {
    //      newRow.setFloat(str(x), letters[x]);
    //    }
    //  } else {
    //    for (int x = 0; x < 35; x++) {
    //      int prev  = row.getInt(str(x));
    //      row.setFloat(str(x), letters[x] + prev );
    //    }
    //    break;  
    //  }
    //}
  }
}
