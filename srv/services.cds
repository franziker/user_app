using { sap.capire.user as my } from '../db/schema';
using {  sap.common.Languages } from '@sap/cds/common';




/**
 * Provides functionalities for user management
 */
service UserService {
    @odata.draft.enabled
        entity User as select from my.User{
            *,
            cast(concat(firstName, ' ' ,lastName) as String) as name
        };
    entity Language as select from Languages;
    entity image as projection on my.image;
  
    }
    
/**
 * Provides administrative functionalities for managing users
 */
service AdminServie {
    entity User as projection on my.User
}


annotate UserService.User with @odata.draft.enabled;
annotate UserService.image with @odata.draft.enabled;
annotate UserService.Language with @odata.draft.enabled;