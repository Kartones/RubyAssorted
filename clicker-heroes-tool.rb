#!/usr/bin/env ruby

require "base64"
require "digest/md5"

class SavegameToolset

  SAVEDATA_SEPARATOR = "Fe12NAfA3R6z4k0z"
  HASH_SALT          = "af0ik392jrmt0nsfdghy0"

  def unencryptSavegame(filepath, output_filepath)
    save(unscrambleSavegameData(open(filepath)), output_filepath)
  end

  def encryptSavegame(filepath, output_filepath)
    save(scrambleSavegameData(open(filepath)), output_filepath)
  end


  private

  def open(filepath)
    file_data = ""
    file = File.open(filepath, "r")
    while (line = file.gets)
      file_data += line;
    end
    file.close
    file_data
  end

  def save(data, filepath)
    file = File.new(filepath, "w")
    file.write(data)
    file.close
  end

  def unscrambleSavegameData(data)
    # First remove separator and hash/checksum
    clear_data = data.split(SAVEDATA_SEPARATOR).first
    # Now remove fake data (all odd characters are not used)
    @index = 0
    base64_data = clear_data.split("").select { |character|
      @index += 1
      (@index-1) % 2 == 0
    }.join("")

    Base64.decode64(base64_data)
  end

  def scrambleSavegameData(data)
    base64_data = Base64.encode64(data).gsub("\n","")
    data_hash = hashData(base64_data)

    # As odd characters (countig with 0-based index) are skipped, anything will do so fill with a space
    scrambled_data = base64_data.split("").map { |character|
      "#{character} "
    }

    scrambled_data.join("") + SAVEDATA_SEPARATOR + data_hash
  end

  def hashData(data)
    data_array = data.split("")
    sorted_data = data_array
    ::Digest::MD5.hexdigest(sorted_data.join("") + HASH_SALT)
  end

end

begin
  toolset = SavegameToolset.new
  # TODO: Make command-line args based
  source = "/home/kartones/Downloads/clickerHeroSave.txt"
  intermediate = "/home/kartones/Downloads/cleanbase64.txt"
  destination = "/home/kartones/Downloads/encrypted.txt"

  toolset.unencryptSavegame(source, intermediate)
  puts "-- SAVEGAME UNENCRYPTED, edit the file #{intermediate} --"
  puts "--- PRESS ANY KEY TO ENCRYPT AGAIN ---"
  gets
  toolset.encryptSavegame(intermediate, destination)
  puts "-- SAVEGAME ENCRYPTED TO FILE #{destination} --"
end