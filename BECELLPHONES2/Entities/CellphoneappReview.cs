using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappReview
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string Content { get; set; } = null!;

    public int IdProductId { get; set; }

    public virtual CellphoneappProduct IdProduct { get; set; } = null!;
}
