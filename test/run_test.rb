# based on https://github.com/test-unit/test-unit/blob/6962846ebfb62325f7d8cbf67b5743c8da49e0f5/doc/text/how-to.md
base_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
lib_dir  = base_dir
test_dir = File.join(base_dir, "test")

$LOAD_PATH.unshift(lib_dir)

require 'test/unit'

exit Test::Unit::AutoRunner.run(true, test_dir)