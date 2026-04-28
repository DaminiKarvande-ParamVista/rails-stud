# Fix for Windows: temp path with /Users confuses ImageMagick
ENV['TMPDIR'] = 'C:\\tmp'
ENV['TMP']    = 'C:\\tmp'
ENV['TEMP']   = 'C:\\tmp'

MiniMagick.configure do |config|
  config.tmpdir = 'C:\\tmp'
end