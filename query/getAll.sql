SELECT mfr.mfr_name as mfr,
ost.os_type_name as osType,
osv.os_version_name as osVersion,
cpub.cpu_brand as cpuBrand,
cpum.cpu_model_id as cpuModel,
st.storage_type as storageType,
CONCAT(dr.width, "x", dr.height) as displayRes,
l.model as model,
l.screen_size as screenSize,
l.weight as weight,
l.battery_life_hr as batteryLifeHr,
l.base_cpu_clock_ghz as baseCpuClockGhz,
l.is_touch_screen as isTouchScreen,

FROM laptop as l
JOIN mfr as mfr ON l.mfr_id = mfr.mfr_id
JOIN os_version as osv ON l.os_version_id = osv.os_version_id
JOIN os_type as ost ON osv.os_type_id = ost.os_type_id
JOIN cpu_model as cpum ON l.cpu_model_id = cpum.cpu_model_id
JOIN cpu_brand as cpub ON cpum.cpu_brand_id = cpub.cpu_brand_id
JOIN storage_type as st ON l.storage_type_id = st.storage_type_id
JOIN display_res as dr ON l.display_res_id = dr.display_res_id;