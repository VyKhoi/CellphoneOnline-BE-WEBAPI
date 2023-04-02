using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappManufacture
{
    public string Names { get; set; } = null!;

    public virtual ICollection<CellphoneappProduct> CellphoneappProducts { get; } = new List<CellphoneappProduct>();
}
