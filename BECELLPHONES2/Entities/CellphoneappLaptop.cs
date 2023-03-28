﻿namespace BECELLPHONES2.Entities;

public partial class CellphoneappLaptop
{
    public int ProductPtrId { get; set; }

    public string Cpu { get; set; } = null!;

    public string Ram { get; set; } = null!;

    public string Rom { get; set; } = null!;

    public string GraphicCard { get; set; } = null!;

    public string Battery { get; set; } = null!;

    public string OperatorSystem { get; set; } = null!;

    public string Others { get; set; } = null!;

    public virtual CellphoneappProduct ProductPtr { get; set; } = null!;
}
