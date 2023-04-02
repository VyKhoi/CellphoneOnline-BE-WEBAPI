using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappImageproduct
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string LinkImg { get; set; } = null!;

    public int IdProductId { get; set; }

    public virtual CellphoneappProduct IdProduct { get; set; } = null!;
}
