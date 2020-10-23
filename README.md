# DCC011 - Introduction to Databases
### Computer Science Department UFMG - Universidade Federal de Minas Gerais, Brazil.

#### Description: Basic relational database to reinforce the concepts.
#### Group: Bernardo Figueiredo / Leandro Teixeira / Gabriel Espeschit / Thiago Lages / Victor Portugal

This an extension of [one of my previous repos](https://github.com/thiagolages/GestaoDeConstrutora), with a few modifications on the database so it matches all the specifications.

The considered system should support the management of a residential buildings constructor company. Each construction should be managed as a project, with a responsible engineer, and for each project, one should be able to control customers, materials orders, legal events, etc. as well as workers hiring and paying. The system must communicate with other systems that offer specific services to the constructor, like electrical and hydraulic installations contracts.

### Minimum Specs:

The relational database to be implemented must have its schema derived from an Entity-Relationship diagram that contains at least:
- 4 (four) types of entity;
- 3 (three) types of relationship
  - at least 1 (one) of them with M:N cardinality;
- Each type of entity must have, beyond its key (id), at least two other attributes;
- At least 1 (one) type of entity must include a multivalued attribute;
- The M:N relationship (or at least one of them) must include at least one attribute.
