using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappBranch
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Address { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public DateTime EstablishmentDate { get; set; }

    public virtual ICollection<CellphoneappBranchProductColor> CellphoneappBranchProductColors { get; } = new List<CellphoneappBranchProductColor>();
}
