using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappPromotion
{
    public int Id { get; set; }

    public DateTime TimeStart { get; set; }

    public DateTime TimeEnd { get; set; }

    public short Active { get; set; }

    public virtual ICollection<CellphoneappBranchPromotionProduct> CellphoneappBranchPromotionProducts { get; } = new List<CellphoneappBranchPromotionProduct>();
}
