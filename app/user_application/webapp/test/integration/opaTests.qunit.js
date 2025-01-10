sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/userapplication/test/integration/FirstJourney',
		'ns/userapplication/test/integration/pages/UserList',
		'ns/userapplication/test/integration/pages/UserObjectPage'
    ],
    function(JourneyRunner, opaJourney, UserList, UserObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/userapplication') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheUserList: UserList,
					onTheUserObjectPage: UserObjectPage
                }
            },
            opaJourney.run
        );
    }
);