describe("adds item to cart", ()=>{
    beforeEach(() => {
        cy.visit('localhost:3000')
      })
      it("There is products on the page", () => {
        cy.get(".products article").should("be.visible");
      });
      it("There is 2 products on the page", () => {
        cy.get(".products article").should("have.length", 2);
      });
      it("adds item to cart", ()=>{
        cy.get("form.button_to").first().submit();
        cy.get('.nav-item.end-0 a.nav-link').should("contain.text", "My Cart (1)");
      })
    })