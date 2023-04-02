using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappColor
{
    public string Names { get; set; } = null!;

    public virtual ICollection<CellphoneappProductColor> CellphoneappProductColors { get; } = new List<CellphoneappProductColor>();
}
