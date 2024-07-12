#include "include/flutter_usb_thermal_plugin/flutter_usb_thermal_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_usb_thermal_plugin.h"

void FlutterUsbThermalPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_usb_thermal_plugin::FlutterUsbThermalPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
