﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AssignmentTwo.Models.EF
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TechSupportEntities : DbContext
    {
        public TechSupportEntities()
            : base("name=TechSupportEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Incident> Incidents { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Registration> Registrations { get; set; }
        public virtual DbSet<State> States { get; set; }
        public virtual DbSet<Technician> Technicians { get; set; }
    }
}
