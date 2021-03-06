.class public Landroid/graphics/BitmapShader;
.super Landroid/graphics/Shader;
.source "BitmapShader.java"


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V
    .locals 3
    .parameter "bitmap"
    .parameter "tileX"
    .parameter "tileY"

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/graphics/Shader;-><init>()V

    .line 32
    iput-object p1, p0, Landroid/graphics/BitmapShader;->mBitmap:Landroid/graphics/Bitmap;

    .line 33
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->ni()I

    move-result v0

    iget v1, p2, Landroid/graphics/Shader$TileMode;->nativeInt:I

    iget v2, p3, Landroid/graphics/Shader$TileMode;->nativeInt:I

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapShader;->nativeCreate(III)I

    move-result v0

    iput v0, p0, Landroid/graphics/BitmapShader;->native_instance:I

    .line 35
    return-void
.end method

.method private static native nativeCreate(III)I
.end method
