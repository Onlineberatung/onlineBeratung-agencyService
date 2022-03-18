# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [1.11.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.10.0...v1.11.0) (2021-12-14)


### Features

* restructure postcode admin api ([4267c39](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/4267c39856a7cbf82db953d547d2ef85ae01a095))
* updated service api descriptions ([4cb88c0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/4cb88c0f1fce86a81b1a01bb3cf2fe2452b39680))


### Bug Fixes

* search also for special characters only ([f2920c7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/f2920c7bdc9a4a0dd80b36b53e4e7bdceffe76d8))
* search also for umlauts ([cdcf656](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/cdcf6566ceb805f50eba38b785be14421872f4cb))

## [1.10.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.9.0...v1.10.0) (2021-07-26)


### Features

* add new agency properties url and external to agency admin api ([b7cba5d](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/b7cba5db4a41f199d207ce88910e132f163b5beb))
* added database change set ([d0aae3f](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/d0aae3f8fe8b63f51682ca7945b162c02d6c79fb))
* extension of api endpoint ([c35d711](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/c35d711dc485b67b37f7516de473069b11535737))

## [1.9.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.8.0...v1.9.0) (2021-06-18)


### Features

* adapt new keycloak version ([ae1daa5](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/ae1daa5103bcb5db8d48d294dfb1b353d9e4ee41))
* add endpoint to retrieve agencies by consulting type ([b6ffccc](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/b6ffcccfe6ba101174d4aa9a0e273fb622208dad))
* added showAskerProfile in consultingtypeservice.yaml ([97bdec0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/97bdec0a9aac0dbded68d37eabce51be1aacb81b))
* impl. connection to consultingTypeService, started test refactoring ([bc9a989](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/bc9a9899fa01f206d622af51374361d09ea59024))
* impl. ConsultingTypeService error handling, fixing tests ([2634ae7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/2634ae75e79b12cf490acbff3ae3d481919e90d5))
* impl. test for ConsultingTypeManager and fixed all tests ([ca9cd82](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/ca9cd822914ab9535162f344bd2a634f5b409264))
* merged caritas dev into diakonie dev ([78af354](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/78af354d5fa6c627213fc69169a530a091a17bf3))


### Bug Fixes

* adjust name of property to avoid deserialization problems ([3c051d3](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/3c051d3e8c091663bce8971234c516ea629bcff9))
* correct refactor change which changed exception handling behaviour ([72ee88c](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/72ee88c5a227c4eb17bd9d8e7464cd0fe4487f10))
* formatted ([b2b2068](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/b2b2068766012c4ee3e57122a65b99b0389733e3))
* increased time to live ([5e817b9](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/5e817b9c104cd75a4112fb77784154699e904d47))
* removed consulting type setting files ([a9fd839](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/a9fd8391db3c53ae9b592ee0a2603864c62222eb))
* removed dev dependencies ([545a280](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/545a280deb453f99c96b8cd98fe63760162ae96e))
* removed value from properties file ([bc568bd](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/bc568bdafab0ef933550f877cbb8f3046c220419))
* removed white spot agency id ([b92fd2a](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/b92fd2a6912c0e234ffbc797b81bd38903a9876c))
* replaced !=null with nonNull ([eaef8aa](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/eaef8aaa16bad13e1fa0317b2f0e79976fb84181))
* set correct case (lowercase) for docker repository value ([5579fd0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/5579fd02d3ed956d3d7bc622381c0823eb5d824e))
* updated consultingtypeservice.yaml ([a2a0a1f](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/a2a0a1f6f3a8077762c3e52f73830d2efadaa2d8))

## [1.8.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.7.0...v1.8.0) (2021-05-03)


### Features

* added generation of admin api markdown and push workflow ([6a02c6f](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/6a02c6f1484a65172be3fb9ffbb9fcaf92ef070f))
* added supportgroup consutling type ([76fa237](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/76fa237fc0779d187814bf038ad9e56a44f7df1d))
* rename consulting type supportgroup ([5fe1b77](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/5fe1b77bc97f12e21866af09da13a6856b7d7b8a))

## [1.7.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.6.0...v1.7.0) (2021-04-12)


### Features

* adapt admin postcoderanges api to match react admin requirements ([17b20eb](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/17b20eba3160cb60100376cf592005afaa88a624))
* adapt api def to match react admin needs ([26140dc](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/26140dc111536b47951291534368ae24bddbb9e5))
* adapt changes for carinet react admin ([efd3690](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/efd3690e8f8454fda6ada12b5f96153f1b455a44))
* add null values as string ([0bcb48b](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/0bcb48bd96740fe20b915008661bd8f2e036c47c))
* switched java version for docker build, github actions and mave… ([a919329](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/a9193295dfa76bef607612eb65cb38d2fd3ff638))


### Bug Fixes

* fixed wrong path in Dockerfile ([195283e](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/195283ed7ef7794ef3f76fdea5104ff0c1cc0c20))

## [1.6.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.5.0...v1.6.0) (2021-02-23)


### Features

* added admin call to delete an agency ([626920c](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/626920c135cb9f1608217cb29ba42615da5ba039))
* added admin call to update agency postcode ranges ([93a65f9](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/93a65f921dd5b4717ecd806914e4199408756358))
* added call to create a new postcode range for an agency ([0d7eb08](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/0d7eb084934c8c72caa581bcd08dbaf2bc31c103))
* added check for offline status updates on agencies ([47bb357](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/47bb3576eea12a7e5a01b4fe90ec7c743c73ec8f))
* added single resource get endpoint or agency ([75a3fb8](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/75a3fb85644dbd94dfc720a860298282a67ee42b))
* added tests and minor optimizations ([d4564fb](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/d4564fb991028cc5dceb906dd510661c94b52a22))
* changed agency list to return a randomly sorted list of agencies ([ca216da](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/ca216da5cecf05c18ed74298bf8cd4ec0179e41b))
* changed agency list to return a randomly sorted list of agencies ([b6e15fb](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/b6e15fbe5581a85351dc0b6f72121be5406532ad))
* define api spec and add client api of user admin service ([3b9e0db](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/3b9e0db9528a32be96f8a9b70ba896f455f0b98e))
* provide agency type switch logic ([bf8dc3d](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/bf8dc3d1778bbab0b207755d75e3e89d47b22b79))


### Bug Fixes

* fixed broken test ([ff5405c](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/ff5405cbdf7b1ba8e78ac36b5ca333d950dfb74a))

## [1.5.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.4.0...v1.5.0) (2021-01-11)


### Features

* added tests ([cd895fc](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/cd895fc6bd7fbe2d6cfd00b97b540ab11f3fa5f6))
* added tests ([39b2701](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/39b2701c1265a3402cdac8ba1f551cb92d520e87))
* added tests ([ccada67](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/ccada67d39991329178c57a273bf41facf967f9c))
* added tests ([a374902](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/a3749025e8dd85946cadc3eafd1c1923d1adba4c))
* added tests ([36aa69c](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/36aa69c85b6fad415eab8b4597fc350fda912b19))
* changed error handling for database actions ([200b18c](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/200b18c0feb27a83b061d513e88472880edef086))
* changed hal links ([8e7dd66](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/8e7dd66ea1b12683bce145a613dd90a8c596cc65))
* changed hal links for agency api ([0a8d8b7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/0a8d8b797402196a0a7685e18aa3d66ce6d76238))
* implementation ([5b6993d](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/5b6993dbdd0f25f0590eecd87851df23b1e06977))
* increment postcode sizes to 5 ([ab5cbe7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/ab5cbe7fa750392fc898b8cbbfafc077a306fc4d))
* increment postcode sizes to 5 ([48141de](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/48141de0418d59f60c1e21ce2ffcd0a7e105b679))
* provide deletion endpoint and hal builder ([60d4153](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/60d4153a07fab7a0c22f441fefecd54dd6de224a))
* provide deletion function for agency postcode ranges ([3a1d603](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/3a1d6033641164e122da09a10d3b55ef4ad1ce6c))
* provide new consulting type for men ([31c4397](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/31c4397e41160997126ccee6535182294bdb2a68))


### Bug Fixes

* javadoc ([0e2930c](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/0e2930c70e70ec98b00decc10ba23e54941159cc))
* merge conflicts ([0a40c08](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/0a40c0824165e26caec04cb7d36fed18a3f5e9d9))
* removed wrong imports ([16dac11](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/16dac11b243df4c12e329edf92ae90dc3ba5011e))

## [1.4.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.3.0...v1.4.0) (2020-12-14)


### Features

* added admin api call to get all dioceses ([cb8e287](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/cb8e287ca04881fb678bc7a0403b9317c0f20979))
* added agency admin api spec ([855974d](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/855974de7f52de3a3b9d549c6f91b89f3f240958))
* added create agency postcode range admin api spec ([83fe334](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/83fe33451c1538470e3a9f91baac9ce37382578c))
* added delete agency admin api spec ([13805de](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/13805de6c05d91af6616928ccb183a6827dc49f0))
* added delete specific postcode range for an agency admin api spec ([7202980](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/720298016528a4c885e123bd7c9e1819ae04b782))
* added get agency admin api spec ([2e1c026](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/2e1c026e58294ee6fb0b542aeaf22440df2cb926))
* added get agency postcode ranges admin api spec ([9c81864](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/9c818644cfc7a9e33d89312a711c121dbfca2dc4))
* added get specific postcode range for an agency admin api spec ([cb0203e](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/cb0203e95b941b812be66269c1b9ec1442badf04))
* added integration tests for AgencyValidator ([234a3b4](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/234a3b458a432272b4762054925b9caf234c43a5))
* added tests ([5acabc1](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/5acabc16cddf957f7c61a7a274d6e6b250932383))
* added tests ([878087f](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/878087f7dc30b80c8a08852ef501f9ebef1c1d57))
* added tests ([7bc28c1](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/7bc28c1ebc3865fdc586da1d682f99ac4966af28))
* added tests for CustomHttpHeader ([e03bf44](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/e03bf44ce102106df2244f1039e95f4544abf900))
* added update agency admin api spec ([1e92287](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/1e92287ae5a0c7a9dfce3b25d514095712b77689))
* added update specific postcode range for an agency admin api spec ([d2f3de2](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/d2f3de26232fbe87e17143ec3550de8abfda8852))
* extend integration tests ([55f450d](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/55f450dfda81472e8b697f76c50b4b6ff3010e71))
* implementation of create agency admin entry point ([21c3012](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/21c3012cd9da1025a3347b07d064998a816daff3))
* minor optimizations ([60423e8](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/60423e8315919414da62c4fac3b450c7dcbdd7b7))
* minor optimizations ([ef7e2db](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/ef7e2dbcd84288ed22f857a186bd7bf7762c4141))
* minor optimizations ([97e23a6](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/97e23a6286b10acc5780cf431b728f8bedf151ed))
* minor optimizations ([4bdbe22](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/4bdbe2254ea37844cb2b5c8c04435fa039a932b8))
* provide paginated endpoint for agency postcoderanges ([e427fd9](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/e427fd9c8718d47fbe1278d3e436577f99f11fc6))
* small optimizations ([b82181f](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/b82181fb45d7caf59f220872ee7e797482da5e01))


### Bug Fixes

* fixed checkstyle violation ([072b7b7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/072b7b76c4a5011328b54b46d8ffb4e025428ef9))
* fixed tests ([99c0f28](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/99c0f28fb2f6bb8fcb4c67bd551d9bd703db5509))
* removed unnecessary link ([e8293d8](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/e8293d8cbda522a920e00f3a1d6a843a0ce3415b))

## [1.3.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.2.1...v1.3.0) (2020-11-23)


### Features

* added admin api specs to retrieve all dioceses ([551cdb7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/551cdb75ebd97776d7c014bd922d8748a41487e9))
* added missing root controller ([71e4066](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/71e4066fc1409ae5ecb954fcf5e83bc61a005de7))
* adjust admin endpoint naming structure ([00a48e7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/00a48e7341c0d1091e4fa8680fa42e29f28b9c95))
* integrate agency admin role authorization for admin endpoints ([93d2d40](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/93d2d40d89f910aa974152d52247d1f890f3894b))
* integrate basic search service and test database structure ([012254c](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/012254c2c1328f99e326f2275ce41a06922bcf3b))
* integrate first endpoint for admin search ([20474d5](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/20474d56d996ea38a8fef9fddc0c78daf8544188))
* provide fetching for postcode ranges via agency entity ([fbbdc47](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/fbbdc470565e42172f3293028e2bc26c178c9edd))
* provide hal based structure for agency search ([b446c7d](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/b446c7d76db951715916103bd1742e5272d58de2))
* provide search endpoint for agencies ([69ae93a](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/69ae93a38e5d947efa245259f7214d892837e942))
* small optimizations ([dc7ef03](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/dc7ef034c75359a4eb744765503bec2c78e3a9fd))
* update spring boot and dependencies ([8be66f7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/8be66f7b6b669cc44ea5d2b058f757372bfc8e8e))


### Bug Fixes

* add new mapped columns to sql query ([495412a](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/495412a191dd1c554fae419dd762b5659518fd36))
* release database connections after hibernate search query execution ([560fa76](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/560fa76f3e93e4cfc7c0d9e347d7733588589d62))
* update deprecated logging property ([41a2f21](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/41a2f2155668ce4636477eb2fe57131699b2ab3c))

### [1.2.1](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.2.0...v1.2.1) (2020-10-29)

## [1.2.0](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.1.2...v1.2.0) (2020-10-29)


### Features

* update swagger to openapi and define model for generation ([e51a2b7](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/e51a2b7555b8ef49dced05018eb6fa6652fed917))


### Bug Fixes

* failed tests ([5b6511b](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/5b6511b67114339ea658c48f89e2561ae97e9fea))

### [1.1.2](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.1.1...v1.1.2) (2020-10-12)

### [1.1.1](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/compare/v1.1.0...v1.1.1) (2020-10-12)


### Bug Fixes

* fix failed test ([b12484e](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/b12484e83b4e1104ce124ec91de4375deca00634))

## 1.1.0 (2020-07-29)


### Features

* added city to AgencyResponseDTO ([a16a605](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/a16a605c88dd1ee9967c448d0599a943c73b67d2))
* changed endpoint to accept list of agency ids ([edd6a38](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/edd6a38d6a986d008d7833d5f7893ab77346bc7b))
* Initial Commit ([363a00a](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/363a00a371d3a58cdddbc06c668fe9b8eaa46291))


### Bug Fixes

* added city to test ([73efd89](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/73efd89bbc632284ffd167eb7e3f953be4d6b950))
* added missing whitespace ([6677e10](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/6677e10697f0bdf0897998911bd6dcff38e19a52))
* added npm install for github release action ([79d45ce](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/79d45ce4fac9c463fd0fd8d96e634906864b1055))
* added requested naming changes ([202c982](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/202c982a585ef996397275680427314164f94041))
* fixed agencyController tests ([7bb5cc2](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/7bb5cc29410fdf77ffdd417410faff2bc91ef2b5))
* removed null check ([32e6d0e](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/32e6d0e15148c606cf0ece988e35f8c054cb3b24))
* removed unused definitions ([08fe6a2](https://github.com/CaritasDeutschland/caritas-onlineBeratung-agencyService/commit/08fe6a2f42f7838dba8ea6c086eb9520973ac396))
