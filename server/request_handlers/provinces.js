const db = require("../db");
const fetch = require("node-fetch");

module.exports = {
  async insertProvincesHandler(req, res) {
    try {
      //   const { provinces, districts, wards } = req.body;

      const provincesResponse = await fetch(
        "https://provinces.open-api.vn/api/p"
      );
      const districtsResponse = await fetch(
        "https://provinces.open-api.vn/api/d"
      );
      const wardsResponse = await fetch("https://provinces.open-api.vn/api/w");

      const provinces = await provincesResponse.json();
      const districts = await districtsResponse.json();
      const wards = await wardsResponse.json();

      let prepared = [];
      let preparedValues = [];
      let j = 1;

      // provinces
      provinces.forEach(
        ({ code, codename, name, division_type, phone_code }) => {
          prepared.push(`($${j},$${j + 1},$${j + 2},$${j + 3},$${j + 4})`);
          preparedValues.push(code, codename, name, division_type, phone_code);

          j += 5;
        }
      );

      await db.query(
        `
            INSERT INTO provinces (province_id, province_code_name, province_name, division_type, phone_code)
            VALUES ${prepared.join(",")}
        `,
        preparedValues
      );

      // wards
      prepared = [];
      preparedValues = [];
      j = 1;

      districts.forEach(
        ({ code, codename, name, division_type, province_code }) => {
          prepared.push(`($${j},$${j + 1},$${j + 2},$${j + 3},$${j + 4})`);
          preparedValues.push(
            code,
            codename,
            name,
            division_type,
            province_code
          );

          j += 5;
        }
      );
      await db.query(
        `
            INSERT INTO districts (district_id, district_code_name, district_name, division_type, province_id)
            VALUES ${prepared.join(",")}
        `,
        preparedValues
      );

      // wards
      prepared = [];
      preparedValues = [];
      j = 1;

      wards.forEach(
        ({ code, codename, name, division_type, district_code }) => {
          prepared.push(`($${j},$${j + 1},$${j + 2},$${j + 3},$${j + 4})`);
          preparedValues.push(
            code,
            codename,
            name,
            division_type,
            district_code
          );

          j += 5;
        }
      );
      await db.query(
        `
            INSERT INTO wards (ward_id, ward_code_name, ward_name, division_type, district_id)
            VALUES ${prepared.join(",")}
        `,
        preparedValues
      );

      res.sendStatus(204);
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getProvincesHandler(req, res) {
    try {
      const provincesResult = await db.query(
        `
            SELECT province_id as code, province_code_name as codename, province_name as name, division_type, phone_code 
            FROM provinces
        `
      );

      res.status(200).json({
        provinces: provincesResult.rows,
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getDistrictsHandler(req, res) {
    try {
      const districtsResult = await db.query(
        `
            SELECT district_id as code, district_code_name as codename, district_name as name, division_type, province_id as province_code 
            FROM districts
        `
      );

      res.status(200).json({
        districts: districtsResult.rows,
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getProvincesHandler(req, res) {
    try {
      const provincesResult = await db.query(
        `
            SELECT province_id as code, province_code_name as codename, province_name as name, division_type, phone_code 
            FROM provinces
        `
      );

      res.status(200).json({
        provinces: provincesResult.rows,
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getWardsHandler(req, res) {
    try {
      const wardsResult = await db.query(
        `
            SELECT ward_id as code, ward_code_name as codename, ward_name as name, division_type, district_id as district_code 
            FROM wards
        `
      );

      res.status(200).json({
        wards: wardsResult.rows,
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
