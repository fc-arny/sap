# -------------------------------------------------------------
# Some tool methods
# -------------------------------------------------------------
module Sap
  module Tools
    RND_MIN         = 6
    RND_TYPES_COUNT = 3
    RND_LETTER_COUNT = 26
    RND_NUMBER_COUNT = 10

    # ASCII code number
    RND_NUMBER_START        = 48
    RND_BIG_LETTER_START    = 65
    RND_SMALL_LETTER_START  = 97
    # -------------------------------------------------------------
    # Get hash-string for password   md5(md5(password) + salt))
    # -------------------------------------------------------------
    def hash_password(password, salt = '')
      Digest::MD5.hexdigest( Digest::MD5.hexdigest(password) + salt )
    end


    # -------------------------------------------------------------
    # Generate random string
    # -------------------------------------------------------------
    def self.get_random_string(length = RND_MIN)
      str = ''
      length.times do
        type = rand(RND_TYPES_COUNT)
        code =  case type
                  when 1 then RND_BIG_LETTER_START    + rand(RND_LETTER_COUNT - 1)   # Big letter
                  when 2 then RND_SMALL_LETTER_START  + rand(RND_LETTER_COUNT - 1)   # Small letter
                  else 48 + rand(RND_NUMBER_COUNT - 1)                               # Number
                end

        str << code.chr
      end
      return str
    end
  end
end