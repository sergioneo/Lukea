KhipuRails.configure do |config|
  ##
  # Use receivers to set one or more receivers to the gem.
  # #add_receiver has 3 parameters, receiver_id, receiver_key, and receiver_mode(:dev|:pro)
  ##
  config.add_receiver "53370", "f8583904154a798466a7cfe4b4757feedb5fb86e", :dev

  ##
  # Use button_images to set one or more urls for the custom button images you might have.
  # Khipu's images are already registered.
  # Each button image is key/value pair
  # The same as with the receivers registration, use this method as a shortcut for long urls on your view.
  ##
  config.button_images.merge! :shortcut => "url"

  ##
  # The hash defaults can also be modified, giving you control of the default values the helper khipu_button uses.
  ##
  #config.button_defaults.merge! :variable_name => variable_value
end