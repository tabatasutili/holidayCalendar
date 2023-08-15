//
//  HolidayModel.swift
//  holidayCalendar
//
//  Created by Sabrina on 11/08/23.
//

import Foundation

// MARK: - Holiday
struct HolidayModel: Codable {
    let date: String
    let localName: String
    let name: String
    let countryCode: CountryCode
    let fixed, global: Bool
    let counties: [String]?
    let launchYear: JSONNull?
    let types: [TypeElement]
}

enum CountryCode: String, Codable {
    case br = "BR"
    case ad = "AD"
    case al = "AL"
    case ar = "AR"
    case at = "AT"
    case au = "AU"
    case ax = "AX"
    case ba = "BA"
    case bb = "BB"
    case be = "BE"
    case bg = "BG"
    case bj = "BJ"
    case bo = "BO"
    case bs = "BS"
    case bw = "BW"
    case by = "BY"
    case bz = "BZ"
    case ca = "CA"
    case ch = "CH"
    case cl = "CL"
    case cn = "CN"
    case co = "CO"
    case cr = "CR"
    case cu = "CU"
    case cy = "CY"
    case cz = "CZ"
    case de = "DE"
    case dk = "DK"
    case ec = "EC"
    case ee = "EE"
    case eg = "EG"
    case es = "ES"
    case fi = "FI"
    case fo = "FO"
    case fr = "FR"
    case ga = "GA"
    case gb = "GB"
    case gd = "GD"
    case gg = "GG"
    case gi = "GI"
    case gl = "GL"
    case gm = "GM"
    case gr = "GR"
    case gt = "GT"
    case gy = "GY"
    case hn = "HN"
    case hr = "HR"
    case ht = "HT"
    case hu = "HU"
    case id = "ID"
    case ie = "IE"
    case im = "IM"
    case it = "IT"
    case je = "JE"
    case jm = "JM"
    case jp = "JP"
    case kr = "KR"
    case li = "LI"
    case ls = "LS"
    case lt = "LT"
    case lu = "LU"
    case lv = "LV"
    case ma = "MA"
    case mc = "MC"
    case md = "MD"
    case me = "ME"
    case mg = "MG"
    case mk = "MK"
    case mn = "MN"
    case ms = "MS"
    case mt = "MT"
    case mx = "MX"
    case mz = "MZ"
    case na = "NA"
    case ne = "NE"
    case ng = "NG"
    case ni = "NI"
    case nl = "NL"
    case no = "NO"
    case nz = "NZ"
    case pa = "PA"
    case pe = "PE"
    case pg = "PG"
    case pl = "PL"
    case pr = "PR"
    case pt = "PT"
    case py = "PY"
    case ro = "RO"
    case rs = "RS"
    case ru = "RU"
    case se = "SE"
    case sg = "SG"
    case si = "SI"
    case sj = "SJ"
    case sk = "SK"
    case sm = "SM"
    case sr = "SR"
    case sv = "SV"
    case tn = "TN"
    case tr = "TR"
    case ua = "UA"
    case us = "US"
    case uy = "UY"
    case va = "VA"
    case ve = "VE"
    case vn = "VN"
    case za = "ZA"
    case zw = "ZW"
}

enum TypeElement: String, Codable {
    case bank = "Bank"
    case typeOptional = "Optional"
    case typePublic = "Public"
}

typealias Holidays = [HolidayModel]

struct Country: Codable {
    let countryCode, name: String
}

typealias Countrys = [Country]

