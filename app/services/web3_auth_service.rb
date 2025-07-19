require 'eth'

class Web3AuthService
  def self.valid_signature?(address, signature, message)
    # Basic EIP-191 personal_sign verification
    begin
      pub = Eth::Key.personal_recover(message, signature)
      pub.downcase == address.downcase
    rescue
      false
    end
  end
end
