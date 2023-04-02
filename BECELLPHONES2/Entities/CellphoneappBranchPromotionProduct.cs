using System;
using System.Collections.Generic;

namespace BECELLPHONES2.Entities;

public partial class CellphoneappBranchPromotionProduct
{
    public int Id { get; set; }

    public double DiscountRate { get; set; }

    public int IdBrandProductColorId { get; set; }

    public int IdPromotionId { get; set; }

    public virtual CellphoneappBranchProductColor IdBrandProductColor { get; set; } = null!;

    public virtual CellphoneappPromotion IdPromotion { get; set; } = null!;
}
