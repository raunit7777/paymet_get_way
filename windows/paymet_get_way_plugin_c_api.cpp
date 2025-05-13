#include "include/paymet_get_way/paymet_get_way_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "paymet_get_way_plugin.h"

void PaymetGetWayPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  paymet_get_way::PaymetGetWayPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
