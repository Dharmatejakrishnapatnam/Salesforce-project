public class AccountTriggerHandler {

    // Configurable defaults for auto-created Opportunities
    private static final String OPP_NAME_SUFFIX = ' - Opportunity';
    private static final String DEFAULT_STAGE = 'Prospecting';
    private static final Integer DEFAULT_CLOSE_DATE_MONTHS_OUT = 1;

    public static void createOpportunityForNewAccounts(List<Account> newAccounts) {
        List<Opportunity> oppsToInsert = new List<Opportunity>();

        for (Account acc : newAccounts) {
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name + OPP_NAME_SUFFIX;
            opp.AccountId = acc.Id;
            opp.StageName = DEFAULT_STAGE;
            opp.CloseDate = Date.today().addMonths(DEFAULT_CLOSE_DATE_MONTHS_OUT);
            oppsToInsert.add(opp);
        }

        if (!oppsToInsert.isEmpty()) {
            insert oppsToInsert;
        }
    }
}// CI test1    WQGUIHOPJ;LHKFGDSaASFGH
