puts "Hello mruby"

# If you run `bundle exec mundle exec mirb` you'll see it return `false` there.
puts "Emscripten.enabled? => #{Emscripten.enabled?}"

javascript_result = Emscripten.run_script_string('1 + 2')
puts "Javascript says 1 + 2 = #{javascript_result}"

puts "after 5 seconds an alert will appear"

script = <<JS
setTimeout(function(){
  alert("Hello mruby")
}, 5000);
JS
Emscripten.run_script_string(script)
