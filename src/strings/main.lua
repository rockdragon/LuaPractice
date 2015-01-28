 local comments = [[
 /*
  comments 1
 */
 /*
  comments 2
 */
 ]]
 
 print(string.match(comments, "/%*(.-)%*/"))
 
 print(string.match(comments, "/%*(.*)%*/"))
 
 