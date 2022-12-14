import XCTest
@testable import ConnectNetworking

final class ConnectNetworkingTests: XCTestCase {
    private let responseData =
        """
        {
            "response": {
                "id": 1493043979042156,
                "user_id": 206567055700,
                "vehicle_id": 249117615725,
                "vin": "5YJYGDEE5MF257060",
                "display_name": "Starlight",
                "option_codes": "AD15,MDL3,PBSB,RENA,BT37,ID3W,RF3G,S3PB,DRLH,DV2W,W39B,APF0,COUS,BC3B,CH07,PC30,FC3P,FG31,GLFR,HL31,HM31,IL31,LTPB,MR31,FM3B,RS3H,SA3P,STCP,SC04,SU3C,T3CA,TW00,TM00,UT3P,WR00,AU3P,APH3,AF00,ZCST,MI00,CDM0",
                "color": null,
                "access_type": "OWNER",
                "tokens": [
                    "546dc2823f64c9c0",
                    "ea20a6d01bb786b9"
                ],
                "state": "online",
                "in_service": false,
                "id_s": "1493043979042156",
                "calendar_enabled": true,
                "api_version": 45,
                "backseat_token": null,
                "backseat_token_updated_at": null,
                "charge_state": {
                    "battery_heater_on": false,
                    "battery_level": 55,
                    "battery_range": 168.33,
                    "charge_amps": 30,
                    "charge_current_request": 30,
                    "charge_current_request_max": 30,
                    "charge_enable_request": true,
                    "charge_energy_added": 0.84,
                    "charge_limit_soc": 81,
                    "charge_limit_soc_max": 100,
                    "charge_limit_soc_min": 50,
                    "charge_limit_soc_std": 90,
                    "charge_miles_added_ideal": 3.5,
                    "charge_miles_added_rated": 3.5,
                    "charge_port_cold_weather_mode": false,
                    "charge_port_color": "<invalid>",
                    "charge_port_door_open": true,
                    "charge_port_latch": "Engaged",
                    "charge_rate": 21.8,
                    "charge_to_max_range": false,
                    "charger_actual_current": 30,
                    "charger_phases": 1,
                    "charger_pilot_current": 30,
                    "charger_power": 6,
                    "charger_voltage": 192,
                    "charging_state": "Charging",
                    "conn_charge_cable": "SAE",
                    "est_battery_range": 171.23,
                    "fast_charger_brand": "<invalid>",
                    "fast_charger_present": false,
                    "fast_charger_type": "<invalid>",
                    "ideal_battery_range": 168.33,
                    "managed_charging_active": false,
                    "managed_charging_start_time": null,
                    "managed_charging_user_canceled": false,
                    "max_range_charge_counter": 0,
                    "minutes_to_full_charge": 210,
                    "not_enough_power_to_heat": null,
                    "off_peak_charging_enabled": false,
                    "off_peak_charging_times": "all_week",
                    "off_peak_hours_end_time": 360,
                    "preconditioning_enabled": false,
                    "preconditioning_times": "all_week",
                    "scheduled_charging_mode": "Off",
                    "scheduled_charging_pending": false,
                    "scheduled_charging_start_time": null,
                    "scheduled_charging_start_time_app": 0,
                    "scheduled_departure_time": 1665536400,
                    "scheduled_departure_time_minutes": 1260,
                    "supercharger_session_trip_planner": false,
                    "time_to_full_charge": 3.5,
                    "timestamp": 1666542922609,
                    "trip_charging": false,
                    "usable_battery_level": 55,
                    "user_charge_enable_request": null
                },
                "climate_state": {
                    "allow_cabin_overheat_protection": true,
                    "auto_seat_climate_left": true,
                    "auto_seat_climate_right": true,
                    "battery_heater": false,
                    "battery_heater_no_power": null,
                    "bioweapon_mode": false,
                    "cabin_overheat_protection": "FanOnly",
                    "cabin_overheat_protection_actively_cooling": false,
                    "climate_keeper_mode": "off",
                    "defrost_mode": 0,
                    "driver_temp_setting": 22.2,
                    "fan_status": 0,
                    "hvac_auto_request": "On",
                    "inside_temp": 15.8,
                    "is_auto_conditioning_on": false,
                    "is_climate_on": false,
                    "is_front_defroster_on": false,
                    "is_preconditioning": false,
                    "is_rear_defroster_on": false,
                    "left_temp_direction": 0,
                    "max_avail_temp": 28.0,
                    "min_avail_temp": 15.0,
                    "outside_temp": 15.5,
                    "passenger_temp_setting": 22.2,
                    "remote_heater_control_enabled": false,
                    "right_temp_direction": 0,
                    "seat_heater_left": 0,
                    "seat_heater_rear_center": 0,
                    "seat_heater_rear_left": 0,
                    "seat_heater_rear_right": 0,
                    "seat_heater_right": 0,
                    "side_mirror_heaters": false,
                    "steering_wheel_heater": false,
                    "supports_fan_only_cabin_overheat_protection": true,
                    "timestamp": 1666542922608,
                    "wiper_blade_heater": false
                },
                "drive_state": {
                    "gps_as_of": 1666542921,
                    "heading": 240,
                    "latitude": 40.76358,
                    "longitude": -74.083084,
                    "native_latitude": 40.76358,
                    "native_location_supported": 1,
                    "native_longitude": -74.083084,
                    "native_type": "wgs",
                    "power": -5,
                    "shift_state": null,
                    "speed": null,
                    "timestamp": 1666542922609
                },
                "gui_settings": {
                    "gui_24_hour_time": false,
                    "gui_charge_rate_units": "mi/hr",
                    "gui_distance_units": "mi/hr",
                    "gui_range_display": "Rated",
                    "gui_temperature_units": "F",
                    "gui_tirepressure_units": "Psi",
                    "show_range_units": false,
                    "timestamp": 1666542922609
                },
                "vehicle_config": {
                    "aux_park_lamps": "NaPremium",
                    "badge_version": 0,
                    "can_accept_navigation_requests": true,
                    "can_actuate_trunks": true,
                    "car_special_type": "base",
                    "car_type": "modely",
                    "charge_port_type": "US",
                    "dashcam_clip_save_supported": true,
                    "default_charge_to_max": false,
                    "driver_assist": "TeslaAP3",
                    "ece_restrictions": false,
                    "efficiency_package": "MY2021",
                    "eu_vehicle": false,
                    "exterior_color": "PearlWhite",
                    "exterior_trim": "Black",
                    "exterior_trim_override": "",
                    "has_air_suspension": false,
                    "has_ludicrous_mode": false,
                    "has_seat_cooling": false,
                    "headlamp_type": "Premium",
                    "interior_trim_type": "Black2",
                    "key_version": 2,
                    "motorized_charge_port": true,
                    "paint_color_override": "20,20,20,0.01,0.04",
                    "performance_package": "Base",
                    "plg": true,
                    "pws": true,
                    "rear_drive_unit": "PM216MOSFET",
                    "rear_seat_heaters": 1,
                    "rear_seat_type": 0,
                    "rhd": false,
                    "roof_color": "RoofColorGlass",
                    "seat_type": null,
                    "spoiler_type": "None",
                    "sun_roof_installed": null,
                    "supports_qr_pairing": false,
                    "third_row_seats": "None",
                    "timestamp": 1666542922609,
                    "trim_badging": "74d",
                    "use_range_badging": true,
                    "utc_offset": -14400,
                    "webcam_supported": false,
                    "wheel_type": "Apollo19"
                },
                "vehicle_state": {
                    "api_version": 45,
                    "autopark_state_v3": "unavailable",
                    "calendar_supported": true,
                    "car_version": "2022.28.2 199fb0c76826",
                    "center_display_state": 0,
                    "dashcam_clip_save_available": false,
                    "dashcam_state": "Unavailable",
                    "df": 0,
                    "dr": 0,
                    "fd_window": 0,
                    "feature_bitmask": "b9ff,0",
                    "fp_window": 0,
                    "ft": 0,
                    "is_user_present": false,
                    "locked": true,
                    "media_state": {
                        "remote_control_enabled": true
                    },
                    "notifications_supported": true,
                    "odometer": 7220.587738,
                    "parsed_calendar_supported": true,
                    "pf": 0,
                    "pr": 0,
                    "rd_window": 0,
                    "remote_start": false,
                    "remote_start_enabled": true,
                    "remote_start_supported": true,
                    "rp_window": 0,
                    "rt": 0,
                    "santa_mode": 0,
                    "sentry_mode": false,
                    "sentry_mode_available": true,
                    "service_mode": false,
                    "service_mode_plus": false,
                    "software_update": {
                        "download_perc": 0,
                        "expected_duration_sec": 2700,
                        "install_perc": 0,
                        "status": "",
                        "version": " "
                    },
                    "speed_limit_mode": {
                        "active": false,
                        "current_limit_mph": 70.0,
                        "max_limit_mph": 120,
                        "min_limit_mph": 50.0,
                        "pin_code_set": true
                    },
                    "timestamp": 1666542922608,
                    "tpms_hard_warning_fl": false,
                    "tpms_hard_warning_fr": false,
                    "tpms_hard_warning_rl": false,
                    "tpms_hard_warning_rr": false,
                    "tpms_last_seen_pressure_time_fl": 1666542457,
                    "tpms_last_seen_pressure_time_fr": 1666542456,
                    "tpms_last_seen_pressure_time_rl": 1666542457,
                    "tpms_last_seen_pressure_time_rr": 1666542456,
                    "tpms_pressure_fl": 2.775,
                    "tpms_pressure_fr": 2.775,
                    "tpms_pressure_rl": 2.75,
                    "tpms_pressure_rr": 2.75,
                    "tpms_rcp_front_value": 2.9,
                    "tpms_rcp_rear_value": 2.9,
                    "tpms_soft_warning_fl": false,
                    "tpms_soft_warning_fr": false,
                    "tpms_soft_warning_rl": false,
                    "tpms_soft_warning_rr": false,
                    "valet_mode": false,
                    "valet_pin_needed": false,
                    "vehicle_name": "Starlight",
                    "vehicle_self_test_progress": 0,
                    "vehicle_self_test_requested": false,
                    "webcam_available": false
                }
            }
        }
        """.data(using: .utf8)!
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ConnectNetworking().text, "Hello, World!")
    }

    func testVehcileDataResponse() throws {
        let response = try JSONDecoder().decode(VehicleDataAPIResponse.self, from: responseData)
        XCTAssert(response.response.id == 1493043979042156)
    }
}
