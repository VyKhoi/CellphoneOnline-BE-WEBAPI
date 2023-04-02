using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace BECELLPHONES2.Entities;

public partial class CellphonesContext : DbContext
{
    public CellphonesContext()
    {
    }

    public CellphonesContext(DbContextOptions<CellphonesContext> options)
        : base(options)
    {
    }

    public virtual DbSet<CellphoneappBranch> CellphoneappBranches { get; set; }

    public virtual DbSet<CellphoneappBranchProductColor> CellphoneappBranchProductColors { get; set; }

    public virtual DbSet<CellphoneappBranchPromotionProduct> CellphoneappBranchPromotionProducts { get; set; }

    public virtual DbSet<CellphoneappColor> CellphoneappColors { get; set; }

    public virtual DbSet<CellphoneappComment> CellphoneappComments { get; set; }

    public virtual DbSet<CellphoneappEarphone> CellphoneappEarphones { get; set; }

    public virtual DbSet<CellphoneappImageproduct> CellphoneappImageproducts { get; set; }

    public virtual DbSet<CellphoneappLaptop> CellphoneappLaptops { get; set; }

    public virtual DbSet<CellphoneappManufacture> CellphoneappManufactures { get; set; }

    public virtual DbSet<CellphoneappOrder> CellphoneappOrders { get; set; }

    public virtual DbSet<CellphoneappOrderdetail> CellphoneappOrderdetails { get; set; }

    public virtual DbSet<CellphoneappProduct> CellphoneappProducts { get; set; }

    public virtual DbSet<CellphoneappProductColor> CellphoneappProductColors { get; set; }

    public virtual DbSet<CellphoneappPromotion> CellphoneappPromotions { get; set; }

    public virtual DbSet<CellphoneappReview> CellphoneappReviews { get; set; }

    public virtual DbSet<CellphoneappRole> CellphoneappRoles { get; set; }

    public virtual DbSet<CellphoneappSmartphone> CellphoneappSmartphones { get; set; }

    public virtual DbSet<CellphoneappUser> CellphoneappUsers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=VYKHOI\\VYKHOI;Initial Catalog=cellphones;Integrated Security=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<CellphoneappBranch>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_branch_Id");

            entity.ToTable("cellphoneapp_branch");

            entity.Property(e => e.Address).HasMaxLength(50);
            entity.Property(e => e.EstablishmentDate).HasColumnType("date");
            entity.Property(e => e.Name).HasMaxLength(50);
            entity.Property(e => e.Phone).HasMaxLength(20);
        });

        modelBuilder.Entity<CellphoneappBranchProductColor>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_branch_product_color_Id");

            entity.ToTable("cellphoneapp_branch_product_color");

            entity.HasIndex(e => e.IdBranchId, "cellphoneApp_branch__idBranch_id_edb533ab_fk_cellphone");

            entity.HasIndex(e => e.IdProductColorId, "cellphoneApp_branch__idProductColor_id_fbdccc0b_fk_cellphone");

            entity.Property(e => e.IdBranchId).HasColumnName("idBranch_id");
            entity.Property(e => e.IdProductColorId).HasColumnName("idProductColor_id");

            entity.HasOne(d => d.IdBranch).WithMany(p => p.CellphoneappBranchProductColors)
                .HasForeignKey(d => d.IdBranchId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_branch_product_color$cellphoneApp_branch__idBranch_id_edb533ab_fk_cellphone");

            entity.HasOne(d => d.IdProductColor).WithMany(p => p.CellphoneappBranchProductColors)
                .HasForeignKey(d => d.IdProductColorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_branch_product_color$cellphoneApp_branch__idProductColor_id_fbdccc0b_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappBranchPromotionProduct>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_branch_promotion_product_Id");

            entity.ToTable("cellphoneapp_branch_promotion_product");

            entity.HasIndex(e => e.IdBrandProductColorId, "cellphoneApp_branch__idBrandProductColor__95f82815_fk_cellphone");

            entity.HasIndex(e => e.IdPromotionId, "cellphoneApp_branch__idPromotion_id_3456dae1_fk_cellphone");

            entity.Property(e => e.DiscountRate).HasColumnName("discountRate");
            entity.Property(e => e.IdBrandProductColorId).HasColumnName("idBrandProductColor_id");
            entity.Property(e => e.IdPromotionId).HasColumnName("idPromotion_id");

            entity.HasOne(d => d.IdBrandProductColor).WithMany(p => p.CellphoneappBranchPromotionProducts)
                .HasForeignKey(d => d.IdBrandProductColorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_branch_promotion_product$cellphoneApp_branch__idBrandProductColor__95f82815_fk_cellphone");

            entity.HasOne(d => d.IdPromotion).WithMany(p => p.CellphoneappBranchPromotionProducts)
                .HasForeignKey(d => d.IdPromotionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_branch_promotion_product$cellphoneApp_branch__idPromotion_id_3456dae1_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappColor>(entity =>
        {
            entity.HasKey(e => e.Names).HasName("PK_cellphoneapp_color_names");

            entity.ToTable("cellphoneapp_color");

            entity.Property(e => e.Names)
                .HasMaxLength(50)
                .HasColumnName("names");
        });

        modelBuilder.Entity<CellphoneappComment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_comment_Id");

            entity.ToTable("cellphoneapp_comment");

            entity.HasIndex(e => e.IdProductId, "cellphoneApp_comment_idProduct_id_886d85ab_fk_cellphone");

            entity.HasIndex(e => e.IdUserId, "cellphoneApp_comment_idUser_id_d2fff2a5_fk_cellphoneApp_user_Id");

            entity.Property(e => e.ContentComment)
                .HasMaxLength(100)
                .HasColumnName("contentComment");
            entity.Property(e => e.IdProductId).HasColumnName("idProduct_id");
            entity.Property(e => e.IdReply).HasColumnName("idReply");
            entity.Property(e => e.IdUserId).HasColumnName("idUser_id");

            entity.HasOne(d => d.IdProduct).WithMany(p => p.CellphoneappComments)
                .HasForeignKey(d => d.IdProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_comment$cellphoneApp_comment_idProduct_id_886d85ab_fk_cellphone");

            entity.HasOne(d => d.IdReplyNavigation).WithMany(p => p.InverseIdReplyNavigation)
                .HasForeignKey(d => d.IdReply)
                .HasConstraintName("FK_cellphoneapp_comment_cellphoneapp_comment")
                .OnDelete(DeleteBehavior.Cascade);

            entity.HasOne(d => d.IdUser).WithMany(p => p.CellphoneappComments)
                .HasForeignKey(d => d.IdUserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_comment$cellphoneApp_comment_idUser_id_d2fff2a5_fk_cellphoneApp_user_Id");
        });

        modelBuilder.Entity<CellphoneappEarphone>(entity =>
        {
            entity.HasKey(e => e.ProductPtrId).HasName("PK_cellphoneapp_earphone_product_ptr_id");

            entity.ToTable("cellphoneapp_earphone");

            entity.Property(e => e.ProductPtrId)
                .ValueGeneratedNever()
                .HasColumnName("product_ptr_id");
            entity.Property(e => e.ConnectionType)
                .HasMaxLength(50)
                .HasColumnName("connectionType");
            entity.Property(e => e.Design).HasMaxLength(50);
            entity.Property(e => e.FrequencyResponse)
                .HasMaxLength(50)
                .HasColumnName("Frequency_Response");

            entity.HasOne(d => d.ProductPtr).WithOne(p => p.CellphoneappEarphone)
                .HasForeignKey<CellphoneappEarphone>(d => d.ProductPtrId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_earphone$cellphoneApp_earphon_product_ptr_id_af17d76e_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappImageproduct>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_imageproduct_Id");

            entity.ToTable("cellphoneapp_imageproduct");

            entity.HasIndex(e => e.IdProductId, "cellphoneApp_imagepr_idProduct_id_4de16385_fk_cellphone");

            entity.Property(e => e.IdProductId).HasColumnName("idProduct_id");
            entity.Property(e => e.LinkImg)
                .HasMaxLength(255)
                .HasColumnName("linkImg");
            entity.Property(e => e.Name).HasMaxLength(50);

            entity.HasOne(d => d.IdProduct).WithMany(p => p.CellphoneappImageproducts)
                .HasForeignKey(d => d.IdProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_imageproduct$cellphoneApp_imagepr_idProduct_id_4de16385_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappLaptop>(entity =>
        {
            entity.HasKey(e => e.ProductPtrId).HasName("PK_cellphoneapp_laptop_product_ptr_id");

            entity.ToTable("cellphoneapp_laptop");

            entity.Property(e => e.ProductPtrId)
                .ValueGeneratedNever()
                .HasColumnName("product_ptr_id");
            entity.Property(e => e.Battery).HasMaxLength(30);
            entity.Property(e => e.Cpu)
                .HasMaxLength(50)
                .HasColumnName("CPU");
            entity.Property(e => e.GraphicCard)
                .HasMaxLength(50)
                .HasColumnName("Graphic_Card");
            entity.Property(e => e.OperatorSystem)
                .HasMaxLength(50)
                .HasColumnName("operatorSystem");
            entity.Property(e => e.Others).HasMaxLength(50);
            entity.Property(e => e.Ram)
                .HasMaxLength(50)
                .HasColumnName("RAM");
            entity.Property(e => e.Rom)
                .HasMaxLength(50)
                .HasColumnName("ROM");

            entity.HasOne(d => d.ProductPtr).WithOne(p => p.CellphoneappLaptop)
                .HasForeignKey<CellphoneappLaptop>(d => d.ProductPtrId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_laptop$cellphoneApp_laptop_product_ptr_id_137bfb4d_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappManufacture>(entity =>
        {
            entity.HasKey(e => e.Names).HasName("PK_cellphoneapp_manufacture_names");

            entity.ToTable("cellphoneapp_manufacture");

            entity.Property(e => e.Names)
                .HasMaxLength(100)
                .HasColumnName("names");
        });

        modelBuilder.Entity<CellphoneappOrder>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_order_Id");

            entity.ToTable("cellphoneapp_order");

            entity.HasIndex(e => e.IdUserId, "cellphoneApp_order_idUser_id_bb73099a_fk_cellphoneApp_user_Id");

            entity.Property(e => e.DeliveryAddress)
                .HasMaxLength(50)
                .HasColumnName("deliveryAddress");
            entity.Property(e => e.DeliveryPhone)
                .HasMaxLength(50)
                .HasColumnName("deliveryPhone");
            entity.Property(e => e.IdUserId).HasColumnName("idUser_id");
            entity.Property(e => e.OrderDate)
                .HasPrecision(6)
                .HasColumnName("orderDate");
            entity.Property(e => e.Status).HasMaxLength(30);

            entity.HasOne(d => d.IdUser).WithMany(p => p.CellphoneappOrders)
                .HasForeignKey(d => d.IdUserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_order$cellphoneApp_order_idUser_id_bb73099a_fk_cellphoneApp_user_Id");
        });

        modelBuilder.Entity<CellphoneappOrderdetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_orderdetail_Id");

            entity.ToTable("cellphoneapp_orderdetail");

            entity.HasIndex(e => e.IdBrandProductColorId, "cellphoneApp_orderde_idBrandProductColor__980f79ef_fk_cellphone");

            entity.HasIndex(e => e.IdOderId, "cellphoneApp_orderde_idOder_id_6730d0c3_fk_cellphone");

            entity.Property(e => e.IdBrandProductColorId).HasColumnName("idBrandProductColor_id");
            entity.Property(e => e.IdOderId).HasColumnName("idOder_id");
            entity.Property(e => e.UnitPrice)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("unit_price");

            entity.HasOne(d => d.IdBrandProductColor).WithMany(p => p.CellphoneappOrderdetails)
                .HasForeignKey(d => d.IdBrandProductColorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_orderdetail$cellphoneApp_orderde_idBrandProductColor__980f79ef_fk_cellphone");

            entity.HasOne(d => d.IdOder).WithMany(p => p.CellphoneappOrderdetails)
                .HasForeignKey(d => d.IdOderId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_orderdetail$cellphoneApp_orderde_idOder_id_6730d0c3_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappProduct>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_product_Id");

            entity.ToTable("cellphoneapp_product");

            entity.HasIndex(e => e.NameManufactureId, "cellphoneApp_product_nameManufacture_id_473540a7_fk_cellphone");

            entity.Property(e => e.Name).HasMaxLength(100);
            entity.Property(e => e.NameManufactureId)
                .HasMaxLength(100)
                .HasColumnName("nameManufacture_id");
            entity.Property(e => e.Type).HasMaxLength(50);

            entity.HasOne(d => d.NameManufacture).WithMany(p => p.CellphoneappProducts)
                .HasForeignKey(d => d.NameManufactureId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_product$cellphoneApp_product_nameManufacture_id_473540a7_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappProductColor>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_product_color_Id");

            entity.ToTable("cellphoneapp_product_color");

            entity.HasIndex(e => e.IdProductId, "cellphoneApp_product_idProduct_id_057d2aaf_fk_cellphone");

            entity.HasIndex(e => e.NameColorId, "cellphoneApp_product_nameColor_id_0ea8764a_fk_cellphone");

            entity.Property(e => e.IdProductId).HasColumnName("idProduct_id");
            entity.Property(e => e.NameColorId)
                .HasMaxLength(50)
                .HasColumnName("nameColor_id");
            entity.Property(e => e.Price).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.IdProduct).WithMany(p => p.CellphoneappProductColors)
                .HasForeignKey(d => d.IdProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_product_color$cellphoneApp_product_idProduct_id_057d2aaf_fk_cellphone");

            entity.HasOne(d => d.NameColor).WithMany(p => p.CellphoneappProductColors)
                .HasForeignKey(d => d.NameColorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_product_color$cellphoneApp_product_nameColor_id_0ea8764a_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappPromotion>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_promotion_Id");

            entity.ToTable("cellphoneapp_promotion");

            entity.Property(e => e.TimeEnd)
                .HasPrecision(6)
                .HasColumnName("timeEnd");
            entity.Property(e => e.TimeStart)
                .HasPrecision(6)
                .HasColumnName("timeStart");
        });

        modelBuilder.Entity<CellphoneappReview>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_review_Id");

            entity.ToTable("cellphoneapp_review");

            entity.HasIndex(e => e.IdProductId, "cellphoneApp_review_idProduct_id_4ede3625_fk_cellphone");

            entity.Property(e => e.IdProductId).HasColumnName("idProduct_id");
            entity.Property(e => e.Title).HasMaxLength(100);

            entity.HasOne(d => d.IdProduct).WithMany(p => p.CellphoneappReviews)
                .HasForeignKey(d => d.IdProductId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_review$cellphoneApp_review_idProduct_id_4ede3625_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappRole>(entity =>
        {
            entity.HasKey(e => e.NameRole).HasName("PK_cellphoneapp_role_nameRole");

            entity.ToTable("cellphoneapp_role");

            entity.Property(e => e.NameRole)
                .HasMaxLength(30)
                .HasColumnName("nameRole");
        });

        modelBuilder.Entity<CellphoneappSmartphone>(entity =>
        {
            entity.HasKey(e => e.ProductPtrId).HasName("PK_cellphoneapp_smartphone_product_ptr_id");

            entity.ToTable("cellphoneapp_smartphone");

            entity.Property(e => e.ProductPtrId)
                .ValueGeneratedNever()
                .HasColumnName("product_ptr_id");
            entity.Property(e => e.Battery).HasMaxLength(30);
            entity.Property(e => e.Cpu)
                .HasMaxLength(50)
                .HasColumnName("CPU");
            entity.Property(e => e.OperatorSystem)
                .HasMaxLength(50)
                .HasColumnName("Operator_System");
            entity.Property(e => e.Others).HasMaxLength(50);
            entity.Property(e => e.Ram)
                .HasMaxLength(50)
                .HasColumnName("RAM");
            entity.Property(e => e.Rom)
                .HasMaxLength(50)
                .HasColumnName("ROM");

            entity.HasOne(d => d.ProductPtr).WithOne(p => p.CellphoneappSmartphone)
                .HasForeignKey<CellphoneappSmartphone>(d => d.ProductPtrId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_smartphone$cellphoneApp_smartph_product_ptr_id_a0e68210_fk_cellphone");
        });

        modelBuilder.Entity<CellphoneappUser>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_cellphoneapp_user_Id");

            entity.ToTable("cellphoneapp_user");

            entity.HasIndex(e => e.IdRoleId, "cellphoneApp_user_idRole_id_ad7e3037_fk_cellphone");

            entity.Property(e => e.BirthDay)
                .HasColumnType("date")
                .HasColumnName("birthDay");
            entity.Property(e => e.Email).HasMaxLength(100);
            entity.Property(e => e.Hometown).HasMaxLength(50);
            entity.Property(e => e.IdRoleId)
                .HasMaxLength(30)
                .HasColumnName("idRole_id");
            entity.Property(e => e.Name).HasMaxLength(30);
            entity.Property(e => e.PassWord)
                .HasMaxLength(255)
                .HasColumnName("passWord");
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(20)
                .HasColumnName("phoneNumber");
            entity.Property(e => e.UserName)
                .HasMaxLength(30)
                .HasColumnName("userName");

            entity.HasOne(d => d.IdRole).WithMany(p => p.CellphoneappUsers)
                .HasForeignKey(d => d.IdRoleId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cellphoneapp_user$cellphoneApp_user_idRole_id_ad7e3037_fk_cellphone");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
