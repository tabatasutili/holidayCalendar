//
//  Constants.swift
//  holidayCalendar
//
//  Created by Sabrina on 15/08/23.
//

import Foundation

enum Constants {
    static let stringEmpty = ""
    static let numberOne = 1
    static let numberZero = 0
    static let searchTitle = "Pesquise feriados através do ano e país."
    static let countryPlaceHolder = "Escolha o país"
    static let yearPlaceHolder = "Escolha o ano"
    static let searchButton = "Pesquisar"
    static let HolidayCellIdentifier = "HolidayTableViewCell"
    static let DetailsCellIdentifier = "HolidayDetailsCell"
    static let apiNextHoliday = "https://date.nager.at/api/v3/NextPublicHolidays/"
    static let apiUrlCountrys = "https://date.nager.at/api/v3/AvailableCountries"
    static let apiUrl = "https://date.nager.at/api/v3/publicholidays/"
    static let bar = "/"
    static let dateFormatOriginal = "yyyy-MM-dd"
    static let dateFormated = "dd MMM yy"
    static let dateDefault = "00 - AAAA"
    static let localNameTitle = "Nome local:\n"
    static let internationalNameTitle = "Nome internacional:\n"
    static let dateTitle = "Data: \n"
    static let typeTitle = "Facultativo:  \n"
    static let globalTitle = "Global: \n"
    static let fixedTitle = "Data fixa: \n"
    static let yes = "Sim"
    static let no = "Não"
    static let bank = "Banco"
    static let titleDiteils = "Detalhes do feriado"
    static let alertEmptyTitle = "Campo vazio"
    static let alertEmptyMessage = "Selecione os compos de país e ano para continuar"
    static let alertErrorTitle = "Não foi possivel carregar lista"
    static let alertErrorMessag = "Tente novamente"
    static let back = "Voltar"
}
