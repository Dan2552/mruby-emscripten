#include "mruby.h"
#include "mruby/string.h"

#ifdef __EMSCRIPTEN__
#include <emscripten.h>

static mrb_value mrb_emscripten_run_script_string(mrb_state *mrb, mrb_value self) {
  mrb_value input;
  mrb_get_args(mrb, "S", &input);

  const char *result = emscripten_run_script_string(mrb_string_cstr(mrb, input));

  return mrb_str_new_cstr(mrb, result);
}
#endif

void mrb_mruby_emscripten_gem_init(mrb_state *mrb) {
#ifdef __EMSCRIPTEN__
  struct RClass *lib_module = mrb_define_module(mrb, "Emscripten");

  mrb_define_class_method(mrb, lib_module, "run_script_string", mrb_emscripten_run_script_string, MRB_ARGS_REQ(1));
#endif
}

void mrb_mruby_emscripten_gem_final(mrb_state *mrb) {
}
