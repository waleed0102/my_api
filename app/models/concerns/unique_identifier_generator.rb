module UniqueIdentifierGenerator
  extend ActiveSupport::Concern
  ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)

  included do
    def bijective_encode(i)
      return ALPHABET[0] if i == 0
      s = ''
      base = ALPHABET.length
      while i > 0
        s << ALPHABET[i.modulo(base)]
        i /= base
      end
      s.reverse
    end
  end
end