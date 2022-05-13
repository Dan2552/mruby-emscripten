#include "mruby.h"
#include "mruby/irep.h"

int main(int argc, char* argv[]) {
    mrb_state *mrb = mrb_open();
    mrb_load_irep(mrb, app);
    if (mrb->exc) mrb_print_error(mrb);
    mrb_close(mrb);
}
