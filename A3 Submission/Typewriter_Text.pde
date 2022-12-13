void typewriteText(){
if (textcounter < text.length()) {
  c++;
  if (c == 5) {
    textcounter++;
    c = 0;
  }
  textSize(textsize);
  text(text.substring(0, textcounter), textX, textY, width, height);
  if (textcounter >= text.length()) {
      textcounter = text.length() - 1;
    }
  }
}
