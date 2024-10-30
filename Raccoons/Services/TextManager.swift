//
//  TextManager.swift
//  Raccoons
//
//  Created by  Ivan Kiskyak on 30.10.24.
//

import Foundation

protocol ITextManageable {
    func getLicenseText() -> String
}

class TextManager {
    private let textLicense = """
Apps made available through the App Store are licensed, not sold, to you.
Your license to each App is subject to your prior acceptance of either this
Licensed Application End User License Agreement (“Standard EULA”),
or a custom end user license agreement between you and the Application
Provider (“Custom EULA”), if one is provided. Your license to any Apple App
under this Standard EULA or Custom EULA is granted by Apple, and your license
to any Third Party App under this Standard EULA or Custom EULA is granted by
the Application Provider of that Third Party App. Any App that is subject to
this Standard EULA is referred to herein as the “Licensed Application.”
The Application Provider or Apple as applicable (“Licensor”) reserves all
rights in and to the Licensed Application not expressly granted to you under
this Standard EULA.

a. Scope of License: Licensor grants to you a nontransferable license to use
the Licensed Application on any Apple-branded products that you own or
control and as permitted by the Usage Rules. The terms of this Standard
EULA will govern any content, materials, or services accessible from or
purchased within the Licensed Application as well as upgrades provided
by Licensor that replace or supplement the original Licensed Application,
unless such upgrade is accompanied by a Custom EULA. Except as provided in
the Usage Rules, you may not distribute or make the Licensed Application
available over a network where it could be used by multiple devices at the
same time. You may not transfer, redistribute or sublicense the Licensed
Application and, if you sell your Apple Device to a third party, you must
remove the Licensed Application from the Apple Device before doing so. You
may not copy (except as permitted by this license and the Usage Rules),
reverse-engineer, disassemble, attempt to derive the source code of, modify,
or create derivative works of the Licensed Application, any updates, or any
part thereof (except as and only to the extent that any foregoing
restriction is prohibited by applicable law or to the extent as may be
permitted by the licensing terms governing use of any open-sourced components
included with the Licensed Application).
"""
}

//MARK: - ITextManageable
extension TextManager: ITextManageable {
    func getLicenseText() -> String {
        textLicense
    }
}
