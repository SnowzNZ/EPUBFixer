import zip, strutils

# Open the EPUB file
var file = open("path/to/your/epub/file.epub")

# Read the contents of the EPUB file
var contents = file.readAllBytes()

# Extract the content from the EPUB file
var zipFile = ZipFileReader(contents)
var htmlFiles = zipFile.filter { it.isFile and it.fileName.endswith(".html") }

# Convert the text in the HTML files to UTF-8 format
for file in htmlFiles:
  var text = file.extractAsString()
  var utf8Text = text.toUtf8()

  # Overwrite the original text with the UTF-8 encoded text
  file.overwrite(utf8Text)

# Save the updated EPUB file
zipFile.write("path/to/your/converted/epub/file.epub")
