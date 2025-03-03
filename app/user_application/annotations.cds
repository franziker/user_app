using UserService as service from '../../srv/services';
using from '@sap/cds/common';

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
            Label : '{i18n>ProfilePicture}',
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
                Value : profilePicture,
                Label : '{i18n>ProfilePicture}',
            },
        ],
    },
    UI.FieldGroup #LangaugePreferences : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : systemlanguage_code,
                Label : 'System Language',
            },
            {
                $Type : 'UI.DataField',
                Value : userlanguage_code,
                Label : 'User Language',
            },
        ],
    },
    UI.HeaderInfo : {
        ImageUrl : profilePicture,
        TypeName : '',
        TypeNamePlural : '',
        TypeImageUrl : 'sap-icon://person-placeholder',
    },
    
);


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

annotate service.Language with {
    name @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Language',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : {
            $value : code,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.Language with {
    descr @(
        Common.Text : {
        $value : code,
        ![@UI.TextArrangement] : #TextOnly
    },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Language',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'descr',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Language.texts with {
    descr @(
        Common.Text : name,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Language',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Language with {
    code @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Language',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'name',
                },
            ],
            Label : '{i18n>UserLanguage}',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : {
            $value : name,
            ![@UI.TextArrangement] : #TextOnly,
        },
)};

annotate service.Languages with {
    code @(Common.Text : {
        $value : name,
        ![@UI.TextArrangement] : #TextOnly
    },
        UI.MultiLineText : false,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Languages',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'System Language',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Languages with {
    descr @(
        Common.Text : {
            $value : name,
            ![@UI.TextArrangement] : #TextOnly
        },
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Languages',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'name',
                },
            ],
            Label : '{i18n>UserLanguage}',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Languages with {
    name @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Languages',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'User Language',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : descr,
)};

annotate service.User with {
    systemlanguage @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Languages',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : systemlanguage_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'System Language',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : {
            $value : systemlanguage.name,
            ![@UI.TextArrangement] : #TextOnly,
        },
)};

annotate service.User with {
    userlanguage @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Languages',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : userlanguage_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'User Language',
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : {
            $value : userlanguage.name,
            ![@UI.TextArrangement] : #TextOnly
        },
)};

