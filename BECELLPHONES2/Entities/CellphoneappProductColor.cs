using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappProductColor
{
    public int Id { get; set; }

    public decimal Price { get; set; }

    public int IdProductId { get; set; }

    public string NameColorId { get; set; } = null!;

    public virtual ICollection<CellphoneappBranchProductColor> CellphoneappBranchProductColors { get; } = new List<CellphoneappBranchProductColor>();

    public virtual CellphoneappProduct IdProduct { get; set; } = null!;

    public virtual CellphoneappColor NameColor { get; set; } = null!;
}
