using { sap.capire.user as my } from '../db/schema';

/**
 * Provides functionalities for user management
 */
service UserService {
    @requires   : 'authenticated-user'
    @cds.redirection.target
    @odata.draft.enabled
        entity User as select from my.User{
            *,
            cast(concat(firstName, ' ' ,lastName) as String) as name
        };
    


  } ;

        
/**
 * Provides administrative functionalities for managing users
 */
service AdminServie {
    @requires: 'Admin'
    @restrict: [{grant: 'READ', where: 'LANGU= ''DE'''}]
    entity User as projection on my.User
}


annotate UserService.User with @odata.draft.enabled;

