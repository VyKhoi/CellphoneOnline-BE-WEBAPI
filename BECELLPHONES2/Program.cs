using BECELLPHONES2.Entities;
using Microsoft.EntityFrameworkCore;
using Stripe;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddDbContext<CellphonesContext>(option => option.UseSqlServer(builder.Configuration.GetConnectionString("MyDB")));
StripeConfiguration.ApiKey = "sk_test_51Mm6CAJTSCX72rEN0osGovCVaSKimGjDCkJjqJmA4vxPFvOav5pfxsJwuaNsm2GQOObTWTsiyY5zPog6FIrVBSgf00zDD66h8d";

builder.Services.AddCors(p => p.AddPolicy("MyCors", builder =>
{
    builder.WithOrigins("http://localhost:3000", "http://localhost:3001")
        .AllowAnyMethod()
        .AllowAnyHeader()
        .AllowCredentials();
}));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCors("MyCors");
app.UseAuthorization();

app.MapControllers();

app.Run();
