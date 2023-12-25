use communal_services;

ALTER TABLE `Customer_services` ADD FOREIGN KEY (`consumer_id`) REFERENCES `Consumer` (`consumer_id`);

ALTER TABLE `Benefits` ADD FOREIGN KEY (`consumer_id`) REFERENCES `Consumer` (`consumer_id`);

ALTER TABLE `Receipt` ADD FOREIGN KEY (`consumer_id`) REFERENCES `Consumer` (`consumer_id`);

ALTER TABLE `Consumer` ADD FOREIGN KEY (`subsidies_id`) REFERENCES `subsidies` (`subsidies_id`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`consumer_id`) REFERENCES `Consumer` (`consumer_id`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`utility_id`) REFERENCES `Utility_company` (`utility_company_id`);

ALTER TABLE `customer_services` ADD FOREIGN KEY (`rates_id`) REFERENCES `rates` (rates_id);

ALTER TABLE `receipt` ADD FOREIGN KEY (`object_id`) REFERENCES `object` (`object_id`);

ALTER TABLE `Debt` ADD FOREIGN KEY (`receipt_id`) REFERENCES `Receipt` (`receipt_id`);

ALTER TABLE `receipt` ADD FOREIGN KEY (`consultant_id`) REFERENCES `consultant` (`consultant_id`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`consultant_id`) REFERENCES `Consultant` (`consultant_id`);

ALTER TABLE `Consultant` ADD FOREIGN KEY (`utility_company_id`) REFERENCES `Utility_company` (`utility_company_id`);

ALTER TABLE `Consultant` ADD FOREIGN KEY (`services_id`) REFERENCES `Services` (`services_id`);

ALTER TABLE `services` ADD FOREIGN KEY (`utility_company_id`) REFERENCES `utility_company` (`utility_company_id`);

ALTER TABLE `services` ADD FOREIGN KEY (`service_type_id`) REFERENCES `service_type` (`service_type_id`);

ALTER TABLE `rates` ADD FOREIGN KEY (`services_id`) REFERENCES `services` (`services_id`);

ALTER TABLE `object` ADD FOREIGN KEY (`gas_meter_id`) REFERENCES `gas_meter` (`gas_meter_id`);
