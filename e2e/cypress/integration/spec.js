it('detects text', () => {
  cy.visit('/');
  cy.get('.garden-search')
    .contains('What do you want to grow?');
});