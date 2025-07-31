# Hardlink-calibre-komga
Hash user script to remove copy and create hardlink for komga library using calibre source
The goal of this user_script is to use Calibre as main library and use Komga as OPDS 

Workflow: 
Add books to Calibre, collect metadata and integrate metadata to Epub / CBZ through Embed metadata and Embed comic metadata plugins
Use Copy to Disk your library with the following: {series}/{title} - {authors}
Launch this user_script to replace the copy by hardlink to save space on your disk.

Instruction
Replace SOURCE_DIR by your Calibre directory
Replace DEST_DIR by your Komga directory

Becareful:
Make sure Komga has Read Only access to the Komga directory library to avoid file modification and broke Calibre database. 
Make sure on Calibre that save_template_title_series_sorting = 'strictly_alphabetic' to avoid the, a, at the end of the file. (example: "The wizard" becomes "wizard, The")
