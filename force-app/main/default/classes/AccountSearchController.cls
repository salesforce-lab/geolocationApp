/**
 * @description       : 
 * @author            : Juan Felipe Muriel
 * @group             : 
 * @last modified on  : 17-03-2025
 * @last modified by  : Juan Felipe Muriel
**/
public with sharing class AccountSearchController {
    @AuraEnabled
    public static List<Account> searchAccounts( String searchTerm ) {
        List<Account> accounts = new List<Account>();
        if ( String.isNotBlank( searchTerm ) ) {
            List<List<SObject>> searchResults = [
                FIND :searchTerm
                RETURNING Account(
                    Id, Name, Phone, Website,
                    BillingStreet, BillingCity,
                    BillingState, BillingPostalCode
                    ORDER BY Name
                    LIMIT 10
                )
            ];
            accounts = searchResults[0];
        }
        return accounts;
    }
}