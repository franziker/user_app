using { sap.common.Languages, sap.common.CodeList } from '@sap/cds/common';

namespace sap.capire.user; 


/**
 * This entity represents a user in the system, including their personal information and language preferences.
 */
entity User {
  key ID            : String;
  firstName         : String;
  lastName          : String;
  email             : EMailAddress;
  systemlanguage    : Association to one Languages;
  userlanguage      : Association to one Languages;
  profilePicture    : Association to one image;
}


aspect sap.common.CodeList{
  key code:  String;
  descr:  String;
  
}

entity sap.common.Languages : CodeList{
  key languagdeCode : String;
  languageDescription: String;
}
/**
 * This entity represents an image file associated with a user's profile.
 */
entity image {
DraftAdministrativeData_DraftUUID: UUID;
key ID : String;
image   :LargeBinary @Core.MediaType : 'image/png'


}


/**
 * This entity represents a language supported by the system, including its code and description.
 */


type EMailAddress : String;
