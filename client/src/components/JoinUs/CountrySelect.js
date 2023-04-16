import React, { useState } from "react";

function CountrySelect({ validateCountry }) {
  const [input, setInput] = useState("US");

  const handleChange = (e) => {
    setInput(e.target.value);
  };

  return (
    <div>
      <select onChange={handleChange} id="country-select" value={input}>
        <optgroup label="Country/Region">
          <option value="AF" className="">
            Afghanistan
          </option>
          <option value="AL" className="">
            Albania
          </option>
          <option value="DZ" className="">
            Algeria
          </option>
          <option value="AS" className="">
            American Samoa
          </option>
          <option value="AD" className="">
            Andorra
          </option>
          <option value="AO" className="">
            Angola
          </option>
          <option value="AI" className="">
            Anguilla
          </option>
          <option value="AQ" className="">
            Antarctica
          </option>
          <option value="AG" className="">
            Antigua and Barbuda
          </option>
          <option value="AR" className="">
            Argentina
          </option>
          <option value="AM" className="">
            Armenia
          </option>
          <option value="AW" className="">
            Aruba
          </option>
          <option value="AU" className="">
            Australia
          </option>
          <option value="AT" className="">
            Austria
          </option>
          <option value="AZ" className="">
            Azerbaijan
          </option>
          <option value="BS" className="">
            Bahamas
          </option>
          <option value="BH" className="">
            Bahrain
          </option>
          <option value="BD" className="">
            Bangladesh
          </option>
          <option value="BB" className="">
            Barbados
          </option>
          <option value="BY" className="">
            Belarus
          </option>
          <option value="BE" className="">
            Belgium
          </option>
          <option value="BZ" className="">
            Belize
          </option>
          <option value="BJ" className="">
            Benin
          </option>
          <option value="BM" className="">
            Bermuda
          </option>
          <option value="BT" className="">
            Bhutan
          </option>
          <option value="BO" className="">
            Bolivia
          </option>
          <option value="BA" className="">
            Bosnia and Herzegovina
          </option>
          <option value="BW" className="">
            Botswana
          </option>
          <option value="BV" className="">
            Bouvet Island
          </option>
          <option value="BR" className="">
            Brazil
          </option>
          <option value="IO" className="">
            British Indian Ocean Territory
          </option>
          <option value="BN" className="">
            Brunei Darussalam
          </option>
          <option value="BG" className="">
            Bulgaria
          </option>
          <option value="BF" className="">
            Burkina Faso
          </option>
          <option value="BI" className="">
            Burundi
          </option>
          <option value="KH" className="">
            Cambodia
          </option>
          <option value="CM" className="">
            Cameroon
          </option>
          <option value="CA" className="">
            Canada
          </option>
          <option value="CV" className="">
            Cape Verde
          </option>
          <option value="KY" className="">
            Cayman Islands
          </option>
          <option value="CF" className="">
            Central African Republic
          </option>
          <option value="TD" className="">
            Chad
          </option>
          <option value="CL" className="">
            Chile
          </option>
          <option value="CN" className="">
            China Mainland{" "}
          </option>
          <option value="CX" className="">
            Christmas Island
          </option>
          <option value="CC" className="">
            Cocos (Keeling) Islands
          </option>
          <option value="CO" className="">
            Colombia
          </option>
          <option value="KM" className="">
            Comoros
          </option>
          <option value="CG" className="">
            Congo
          </option>
          <option value="CD" className="">
            Congo, The DRC
          </option>
          <option value="CK" className="">
            Cook Islands
          </option>
          <option value="CR" className="">
            Costa Rica
          </option>
          <option value="CI" className="">
            Cote d'Ivoire
          </option>
          <option value="HR" className="">
            Croatia
          </option>
          <option value="CU" className="">
            Cuba
          </option>
          <option value="CY" className="">
            Cyprus
          </option>
          <option value="CZ" className="">
            Czech Republic
          </option>
          <option value="DK" className="">
            Denmark
          </option>
          <option value="DJ" className="">
            Djibouti
          </option>
          <option value="DM" className="">
            Dominica
          </option>
          <option value="DO" className="">
            Dominican Republic
          </option>
          <option value="TL" className="">
            East Timor
          </option>
          <option value="EC" className="">
            Ecuador
          </option>
          <option value="EG" className="">
            Egypt
          </option>
          <option value="SV" className="">
            El Salvador
          </option>
          <option value="GQ" className="">
            Equatorial Guinea
          </option>
          <option value="ER" className="">
            Eritrea
          </option>
          <option value="EE" className="">
            Estonia
          </option>
          <option value="ET" className="">
            Ethiopia
          </option>
          <option value="FK" className="">
            Falkland Islands (Malvinas)
          </option>
          <option value="FO" className="">
            Faroe Islands
          </option>
          <option value="FJ" className="">
            Fiji
          </option>
          <option value="FI" className="">
            Finland
          </option>
          <option value="FR" className="">
            France
          </option>
          <option value="GF" className="">
            French Guiana
          </option>
          <option value="PF" className="">
            French Polynesia
          </option>
          <option value="TF" className="">
            French Southern Territories
          </option>
          <option value="GA" className="">
            Gabon
          </option>
          <option value="GM" className="">
            Gambia
          </option>
          <option value="GE" className="">
            Georgia
          </option>
          <option value="DE" className="">
            Germany
          </option>
          <option value="GH" className="">
            Ghana
          </option>
          <option value="GI" className="">
            Gibraltar
          </option>
          <option value="GR" className="">
            Greece
          </option>
          <option value="GL" className="">
            Greenland
          </option>
          <option value="GD" className="">
            Grenada
          </option>
          <option value="GP" className="">
            Guadeloupe
          </option>
          <option value="GU" className="">
            Guam
          </option>
          <option value="GT" className="">
            Guatemala
          </option>
          <option value="GN" className="">
            Guinea
          </option>
          <option value="GW" className="">
            Guinea-Bissau
          </option>
          <option value="GY" className="">
            Guyana
          </option>
          <option value="HT" className="">
            Haiti
          </option>
          <option value="HM" className="">
            Heard and McDonald Islands
          </option>
          <option value="VA" className="">
            Holy See (Vatican City State)
          </option>
          <option value="HN" className="">
            Honduras
          </option>
          <option value="HK" className="">
            Hong Kong
          </option>
          <option value="HU" className="">
            Hungary
          </option>
          <option value="IS" className="">
            Iceland
          </option>
          <option value="IN" className="">
            India
          </option>
          <option value="ID" className="">
            Indonesia
          </option>
          <option value="IR" className="">
            Iran (Islamic Republic of)
          </option>
          <option value="IQ" className="">
            Iraq
          </option>
          <option value="IE" className="">
            Ireland
          </option>
          <option value="IL" className="">
            Israel
          </option>
          <option value="IT" className="">
            Italy
          </option>
          <option value="JM" className="">
            Jamaica
          </option>
          <option value="JP" className="">
            Japan
          </option>
          <option value="JO" className="">
            Jordan
          </option>
          <option value="KZ" className="">
            Kazakhstan
          </option>
          <option value="KE" className="">
            Kenya
          </option>
          <option value="KI" className="">
            Kiribati
          </option>
          <option value="KP" className="">
            Korea, D.P.R.O.
          </option>
          <option value="KR" className="">
            Korea, Republic of
          </option>
          <option value="KW" className="">
            Kuwait
          </option>
          <option value="KG" className="">
            Kyrgyzstan
          </option>
          <option value="LA" className="">
            Laos
          </option>
          <option value="LV" className="">
            Latvia
          </option>
          <option value="LB" className="">
            Lebanon
          </option>
          <option value="LS" className="">
            Lesotho
          </option>
          <option value="LR" className="">
            Liberia
          </option>
          <option value="LY" className="">
            Libyan Arab Jamahiriya
          </option>
          <option value="LI" className="">
            Liechtenstein
          </option>
          <option value="LT" className="">
            Lithuania
          </option>
          <option value="LU" className="">
            Luxembourg
          </option>
          <option value="MO" className="">
            Macau
          </option>
          <option value="MK" className="">
            Macedonia
          </option>
          <option value="MG" className="">
            Madagascar
          </option>
          <option value="MW" className="">
            Malawi
          </option>
          <option value="MY" className="">
            Malaysia
          </option>
          <option value="MV" className="">
            Maldives
          </option>
          <option value="ML" className="">
            Mali
          </option>
          <option value="MT" className="">
            Malta
          </option>
          <option value="MH" className="">
            Marshall Islands
          </option>
          <option value="MQ" className="">
            Martinique
          </option>
          <option value="MR" className="">
            Mauritania
          </option>
          <option value="MU" className="">
            Mauritius
          </option>
          <option value="YT" className="">
            Mayotte
          </option>
          <option value="MX" className="">
            Mexico
          </option>
          <option value="FM" className="">
            Micronesia, Federated States of
          </option>
          <option value="MD" className="">
            Moldova, Republic of
          </option>
          <option value="MC" className="">
            Monaco
          </option>
          <option value="MN" className="">
            Mongolia
          </option>
          <option value="ME" className="">
            Montenegro
          </option>
          <option value="MS" className="">
            Montserrat
          </option>
          <option value="MA" className="">
            Morocco
          </option>
          <option value="MZ" className="">
            Mozambique
          </option>
          <option value="MM" className="">
            Myanmar (Burma)
          </option>
          <option value="NA" className="">
            Namibia
          </option>
          <option value="NR" className="">
            Nauru
          </option>
          <option value="NP" className="">
            Nepal
          </option>
          <option value="NL" className="">
            Netherlands
          </option>
          <option value="NC" className="">
            New Caledonia
          </option>
          <option value="NZ" className="">
            New Zealand
          </option>
          <option value="NI" className="">
            Nicaragua
          </option>
          <option value="NE" className="">
            Niger
          </option>
          <option value="NG" className="">
            Nigeria
          </option>
          <option value="NU" className="">
            Niue
          </option>
          <option value="NF" className="">
            Norfolk Island
          </option>
          <option value="MP" className="">
            Northern Mariana Islands
          </option>
          <option value="NO" className="">
            Norway
          </option>
          <option value="OM" className="">
            Oman
          </option>
          <option value="PK" className="">
            Pakistan
          </option>
          <option value="PW" className="">
            Palau
          </option>
          <option value="PA" className="">
            Panama
          </option>
          <option value="PG" className="">
            Papua New Guinea
          </option>
          <option value="PY" className="">
            Paraguay
          </option>
          <option value="PE" className="">
            Peru
          </option>
          <option value="PH" className="">
            Philippines
          </option>
          <option value="PN" className="">
            Pitcairn
          </option>
          <option value="PL" className="">
            Poland
          </option>
          <option value="PT" className="">
            Portugal
          </option>
          <option value="PR" className="">
            Puerto Rico
          </option>
          <option value="QA" className="">
            Qatar
          </option>
          <option value="RE" className="">
            Reunion
          </option>
          <option value="RO" className="">
            Romania
          </option>
          <option value="RU" className="">
            Russian Federation
          </option>
          <option value="RW" className="">
            Rwanda
          </option>
          <option value="KN" className="">
            Saint Kitts and Nevis
          </option>
          <option value="LC" className="">
            Saint Lucia
          </option>
          <option value="VC" className="">
            Saint Vincent and the Grenadines
          </option>
          <option value="WS" className="">
            Samoa
          </option>
          <option value="SM" className="">
            San Marino
          </option>
          <option value="ST" className="">
            Sao Tome and Principe
          </option>
          <option value="SA" className="">
            Saudi Arabia
          </option>
          <option value="SN" className="">
            Senegal
          </option>
          <option value="RS" className="">
            Serbia
          </option>
          <option value="SC" className="">
            Seychelles
          </option>
          <option value="SL" className="">
            Sierra Leone
          </option>
          <option value="SG" className="">
            Singapore
          </option>
          <option value="SK" className="">
            Slovakia (Slovak Republic)
          </option>
          <option value="SI" className="">
            Slovenia
          </option>
          <option value="SB" className="">
            Solomon Islands
          </option>
          <option value="SO" className="">
            Somalia
          </option>
          <option value="ZA" className="">
            South Africa
          </option>
          <option value="GS" className="">
            South Georgia and the South Sandwich Islands
          </option>
          <option value="SS" className="">
            South Sudan
          </option>
          <option value="ES" className="">
            Spain
          </option>
          <option value="LK" className="">
            Sri Lanka
          </option>
          <option value="SH" className="">
            St. Helena
          </option>
          <option value="PM" className="">
            St. Pierre and Miquelon
          </option>
          <option value="SD" className="">
            Sudan
          </option>
          <option value="SR" className="">
            Suriname
          </option>
          <option value="SJ" className="">
            Svalbard and Jan Mayen Islands
          </option>
          <option value="SZ" className="">
            Swaziland
          </option>
          <option value="SE" className="">
            Sweden
          </option>
          <option value="CH" className="">
            Switzerland
          </option>
          <option value="SY" className="">
            Syrian Arab Republic
          </option>
          <option value="TW" className="">
            Taiwan
          </option>
          <option value="TJ" className="">
            Tajikistan
          </option>
          <option value="TZ" className="">
            Tanzania, United Republic of
          </option>
          <option value="TH" className="">
            Thailand
          </option>
          <option value="TG" className="">
            Togo
          </option>
          <option value="TK" className="">
            Tokelau
          </option>
          <option value="TO" className="">
            Tonga
          </option>
          <option value="TT" className="">
            Trinidad and Tobago
          </option>
          <option value="TN" className="">
            Tunisia
          </option>
          <option value="TR" className="">
            Turkey
          </option>
          <option value="TM" className="">
            Turkmenistan
          </option>
          <option value="TC" className="">
            Turks and Caicos Islands
          </option>
          <option value="TV" className="">
            Tuvalu
          </option>
          <option value="UM" className="">
            U.S. Minor Islands
          </option>
          <option value="UG" className="">
            Uganda
          </option>
          <option value="UA" className="">
            Ukraine
          </option>
          <option value="AE" className="">
            United Arab Emirates
          </option>
          <option value="GB" className="">
            United Kingdom
          </option>
          <option value="US" className="">
            United States
          </option>
          <option value="UY" className="">
            Uruguay
          </option>
          <option value="UZ" className="">
            Uzbekistan
          </option>
          <option value="VU" className="">
            Vanuatu
          </option>
          <option value="VE" className="">
            Venezuela
          </option>
          <option value="VN" className="">
            Vietnam
          </option>
          <option value="VG" className="">
            Virgin Islands (British)
          </option>
          <option value="VI" className="">
            Virgin Islands (U.S.)
          </option>
          <option value="WF" className="">
            Wallis and Futuna Islands
          </option>
          <option value="EH" className="">
            Western Sahara
          </option>
          <option value="YE" className="">
            Yemen
          </option>
          <option value="ZM" className="">
            Zambia
          </option>
          <option value="ZW" className="">
            Zimbabwe
          </option>
        </optgroup>
      </select>
      {validateCountry && validateCountry(input)}
    </div>
  );
}

export default CountrySelect;
