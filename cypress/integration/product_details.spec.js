describe("visits home page", ()=>{
    beforeEach(() => {
      
        cy.visit('localhost:3000')
    })
    it("clicks on product details and checks if displayed", () => {
        cy.get(".products article").first().click()
        cy.get(".product-detail").should("be.visible");
    });
})