using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappEarphone
{
    public int ProductPtrId { get; set; }

    public string ConnectionType { get; set; } = null!;

    public string Design { get; set; } = null!;

    public string FrequencyResponse { get; set; } = null!;

    public virtual CellphoneappProduct ProductPtr { get; set; } = null!;
}
