using UserService as service from '../../srv/sercives';
annotate service.User with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'firstName',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'lastName',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Profile Picture',
            ID : 'ProfilePicture',
            Target : '@UI.FieldGroup#ProfilePicture',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Langauge Preferences',
            ID : 'LangaugePreferences',
            Target : '@UI.FieldGroup#LangaugePreferences',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>FirstName}',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>LastName}',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Full Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Email}',
            Value : email,
        },
    ],
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : firstName,
                Label : '{i18n>FirstName}',
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
                Label : '{i18n>LastName}',
            },
            {
                $Type : 'UI.DataField',
                Value : name,
                Label : '{i18n>FullName}',
            },
            {
                $Type : 'UI.DataField',
                Value : email,
                Label : '{i18n>Email}',
            },
        ],
    },
    UI.FieldGroup #ProfilePicture : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : profilePicture.image,
                Label : '{i18n>ProfilePicture}',
            },
        ],
    },
    UI.FieldGroup #LangaugePreferences : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : systemlanguage.languageDescription,
                Label : '{i18n>ItSystemLanguage}',
            },
            {
                $Type : 'UI.DataField',
                Value : userlanguage.languageDescription,
                Label : 'Communication Language',
            },
        ],
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
        ImageUrl : profilePicture.image,
        Initials : name,
        TypeImageUrl : 'sap-icon://person-placeholder',
    },
);

annotate service.User with {
    systemlanguage @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'language',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : systemlanguage_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'languageCode',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'languageDescription',
            },
        ],
    }
};

annotate service.User with {
    userlanguage @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'language',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : userlanguage_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'languageCode',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'languageDescription',
            },
        ],
    }
};

annotate service.User with {
    profilePicture @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'image',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : profilePicture_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'image',
            },
        ],
    }
};

annotate service.language with {
    languageDescription @(
        Common.Text : {
            $value : languageCode,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'language',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : languageDescription,
                    ValueListProperty : 'languageCode',
                },
            ],
            Label : '{i18n>UserLanguage}',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.language with {
    languageCode @Common.Text : {
        $value : languageDescription,
        ![@UI.TextArrangement] : #TextOnly,
    }
};

