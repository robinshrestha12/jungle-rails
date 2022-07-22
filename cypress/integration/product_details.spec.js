/// <reference types="cypress" /> ///
describe("Jungle app website visit", () =>{
  beforeEach(()=>{
    cy.visit('http://localhost:3000/')
  })
  it("should have Jungle in the title", () => {
    cy.title().should('eq', 'Jungle')
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("should navigate to product detail page if a product is clicked", () => {
    cy.get('[alt="Scented Blade"]').click()
    cy.get('.product-detail').should('have.length', 1)
    });
})
