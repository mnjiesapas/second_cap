// Definir el namespace
namespace mnj.sapas;

// Crear un tipo personalizado que se llame Category y sea String de 20 y usarlo.
type Category : String(20);

entity Categories {
    key ID          : UUID;
        description : Category;
}

// Crea un tipo estructurado que se llame Structure y contenga 4 campos (los que tu quieras) y usarlo.
type Structure {
    field1 : String(1);
    field2 : String(2);
    field3 : String(3);
    field4 : String(4);
};

entity Dummy {
    key fields : Structure;
};

// Crea un array que se llame Items y contenga 4 campos (los que tu quieras) y usarlo.
type Items    : many {
    fields : Structure;
};

entity Dummy_array {
    key field_key : String(1);
        array     : Items;
};

// Crea un tipo por referencia para que Height de la entidad Products sea del mismo tipo que Price.
entity Products {
    key ID               : UUID;
        Name             : String;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        Height           : type of Price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

// Crea un tipo por referencia para que Name de Suppliers sea del mismo tipo que Name de la entidad Products.
entity Suppliers {
    key ID         : UUID;
        Name       : Products:Name;
        Street     : String;
        City       : String;
        State      : String(2);
        PostalCode : String(5);
        Country    : String(3);
        Email      : String;
        Phone      : String;
        Fax        : String;
};

// Crea un dato llamado estado al que solo se le pueda añadir activo o inactivo
type Estado   : String enum {
    activo;
    inactivo;
};

// Al campo name, si no le entran datos, debe de tener un valor que sea Paco.
entity Default {
  key key_field : UUID;
   name  : Products:Name default 'Paco'; 
}

// ¿Cómo podemos hacer una compilación de nuestro código?
// con la sentencia --> cds c db/schema.cds
// para mostrar la compilación en SQL--> cds c db/schema.cds --to sql

// ¿Cómo podemos añadir restricciones a un campo?
// con las enumeraciones o la sentencia not null

// Crea una entidad que contenga un campo clave ID y un campo virtual que muestre la cantidad.
entity Dummy_virtual {
    key ID : UUID;
    virtual virtual_field : Integer;
}

// ¿Cómo podemos decirle a un campo virtual que el sistema va a generar el valor de forma automática?
// con la anotación @Core.Computed: true e.g:
// entity Dummy_virtual {
//     key ID : UUID;
//     @Core.Computed: true
//     virtual virtual_field : Timestamp default $now;
// }

// Crea una vista de una entidad.
entity Products_lite as select from Products {
    ID,
    Name as NombreProducto,
} where Description like '%1080P%' ;
