using { cuid, managed } from '@sap/cds/common';
namespace sap.capire.user; 


/**
 * This entity represents a user in the system, including their personal information and language preferences.
 */
entity User: managed,  cuid {
key ID          : String;
firstName		: String;
lastName		: String;
name            : String = firstName||' ' || lastName;
email			: EMailAddress;
systemlanguage	: Association to one language;
userlanguage	: Association to one language;
profilePicture  : Association to one image;
}

/**
 * This entity represents an image file associated with a user's profile.
 */
entity image: cuid {
image   :LargeBinary @Core.MediaType : 'image/png'
}


/**
 * This entity represents a language supported by the system, including its code and description.
 */
entity language:  cuid{
key ID              : UUID;
languageCode		: String;
languageDescription	: String;
}	



type EMailAddress : String;