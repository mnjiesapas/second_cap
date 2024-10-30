using mnj.sapas as sapas from '../db/schema';

service second_cap {
    entity Categories      as projection on sapas.Categories;
    entity Dummies         as projection on sapas.Dummy;
    entity Dummies_array   as projection on sapas.Dummy_array;
    entity Products        as projection on sapas.Products;
    entity Suppliers       as projection on sapas.Suppliers;
    entity Defaults        as projection on sapas.Default;
    entity Dummies_virtual as projection on sapas.Dummy_virtual;
    entity Products_lite   as projection on sapas.Products_lite;
}
