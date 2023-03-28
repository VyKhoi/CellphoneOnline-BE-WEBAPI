namespace BECELLPHONES2.Entities;

public partial class CellphoneappComment
{
    public int Id { get; set; }

    public string ContentComment { get; set; } = null!;

    public int IdProductId { get; set; }

    public int IdUserId { get; set; }

    public virtual CellphoneappProduct IdProduct { get; set; } = null!;

    public virtual CellphoneappUser IdUser { get; set; } = null!;
}
