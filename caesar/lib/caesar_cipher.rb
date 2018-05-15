class CaesarCipher

  def self.encode(string, key)
    cipher_text = ""
    string.each_char do |c|
      if c =~ /[a-z]/
        cipher_text += (((c.ord + key - 97) % 26) + 97).chr
      elsif c =~ /[A-Z]/
        cipher_text += (((c.ord + key - 65) % 26) + 65).chr
      else
        cipher_text += c
      end
    end
    cipher_text
  end
end