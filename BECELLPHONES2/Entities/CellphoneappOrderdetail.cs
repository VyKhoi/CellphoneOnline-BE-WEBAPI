using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappOrderdetail
{
    public int Id { get; set; }

    public int Quantity { get; set; }

    public int IdBrandProductColorId { get; set; }

    public int IdOderId { get; set; }

    public decimal UnitPrice { get; set; }

    public virtual CellphoneappBranchProductColor IdBrandProductColor { get; set; } = null!;

    public virtual CellphoneappOrder IdOder { get; set; } = null!;
}
