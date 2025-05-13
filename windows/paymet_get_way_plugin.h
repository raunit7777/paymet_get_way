#ifndef FLUTTER_PLUGIN_PAYMET_GET_WAY_PLUGIN_H_
#define FLUTTER_PLUGIN_PAYMET_GET_WAY_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace paymet_get_way {

class PaymetGetWayPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PaymetGetWayPlugin();

  virtual ~PaymetGetWayPlugin();

  // Disallow copy and assign.
  PaymetGetWayPlugin(const PaymetGetWayPlugin&) = delete;
  PaymetGetWayPlugin& operator=(const PaymetGetWayPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace paymet_get_way

#endif  // FLUTTER_PLUGIN_PAYMET_GET_WAY_PLUGIN_H_
