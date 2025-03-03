using { Language } from '@sap/cds/common';

namespace sap.capire.user; 

/**
 * This entity represents a user in the system, including their personal information and language preferences.
 */
entity User {
  key ID            : String;
  firstName         : String;
  lastName          : String;
  email             : EMailAddress;
  systemlanguage    : Language;
  userlanguage      : Language;
  profilePicture    : LargeBinary @Core.MediaType : 'image/png';
}


/**
 * Type for email addresses.
 */
type EMailAddress : String;