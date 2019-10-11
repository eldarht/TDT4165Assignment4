
/**
 * @brief      Gets the first characters of a string.
 *
 * @param      String          The string
 * @param      CharacterCount  The character count to retrieve
 *
 * @return     The substring of the those characters.
 */
fun {GetChars String CharacterCount}
  if CharacterCount > 0 then
    String.1|{GetChars String.2 CharacterCount-1}
  else
    ""
  end
end