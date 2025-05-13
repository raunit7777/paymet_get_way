//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <paymet_get_way/paymet_get_way_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) paymet_get_way_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PaymetGetWayPlugin");
  paymet_get_way_plugin_register_with_registrar(paymet_get_way_registrar);
}
