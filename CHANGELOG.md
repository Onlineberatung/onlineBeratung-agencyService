# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

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
