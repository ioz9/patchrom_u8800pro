.class Landroid/view/SurfaceView$3;
.super Ljava/lang/Object;
.source "SurfaceView.java"

# interfaces
.implements Landroid/view/SurfaceHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/view/SurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "SurfaceHolder"


# instance fields
.field final synthetic this$0:Landroid/view/SurfaceView;


# direct methods
.method constructor <init>(Landroid/view/SurfaceView;)V
    .locals 0
    .parameter

    .prologue
    .line 672
    iput-object p1, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final internalLockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;
    .locals 11
    .parameter "dirty"

    .prologue
    .line 758
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget v7, v7, Landroid/view/SurfaceView;->mType:I

    const/4 v8, 0x3

    if-ne v7, v8, :cond_0

    .line 759
    new-instance v7, Landroid/view/SurfaceHolder$BadSurfaceTypeException;

    const-string v8, "Surface type is SURFACE_TYPE_PUSH_BUFFERS"

    invoke-direct {v7, v8}, Landroid/view/SurfaceHolder$BadSurfaceTypeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 762
    :cond_0
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v7, v7, Landroid/view/SurfaceView;->mSurfaceLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 767
    const/4 v0, 0x0

    .line 768
    .local v0, c:Landroid/graphics/Canvas;
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-boolean v7, v7, Landroid/view/SurfaceView;->mDrawingStopped:Z

    if-nez v7, :cond_1

    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v7, v7, Landroid/view/SurfaceView;->mWindow:Landroid/view/SurfaceView$MyWindow;

    if-eqz v7, :cond_1

    .line 769
    if-eqz p1, :cond_2

    move-object v2, p1

    .line 771
    .local v2, frame:Landroid/graphics/Rect;
    :goto_0
    :try_start_0
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v7, v7, Landroid/view/SurfaceView;->mSurface:Landroid/view/Surface;

    invoke-virtual {v7, v2}, Landroid/view/Surface;->lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 778
    .end local v2           #frame:Landroid/graphics/Rect;
    :cond_1
    :goto_1
    if-eqz v0, :cond_3

    .line 779
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    iput-wide v8, v7, Landroid/view/SurfaceView;->mLastLockTime:J

    move-object v7, v0

    .line 798
    :goto_2
    return-object v7

    .line 769
    :cond_2
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v7, v7, Landroid/view/SurfaceView;->mSurfaceFrame:Landroid/graphics/Rect;

    move-object v2, v7

    goto :goto_0

    .line 772
    .restart local v2       #frame:Landroid/graphics/Rect;
    :catch_0
    move-exception v7

    move-object v1, v7

    .line 773
    .local v1, e:Ljava/lang/Exception;
    const-string v7, "SurfaceHolder"

    const-string v8, "Exception locking surface"

    invoke-static {v7, v8, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 786
    .end local v1           #e:Ljava/lang/Exception;
    .end local v2           #frame:Landroid/graphics/Rect;
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 787
    .local v5, now:J
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-wide v7, v7, Landroid/view/SurfaceView;->mLastLockTime:J

    const-wide/16 v9, 0x64

    add-long v3, v7, v9

    .line 788
    .local v3, nextTime:J
    cmp-long v7, v3, v5

    if-lez v7, :cond_4

    .line 790
    sub-long v7, v3, v5

    :try_start_1
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 793
    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 795
    :cond_4
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iput-wide v5, v7, Landroid/view/SurfaceView;->mLastLockTime:J

    .line 796
    iget-object v7, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v7, v7, Landroid/view/SurfaceView;->mSurfaceLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 798
    const/4 v7, 0x0

    goto :goto_2

    .line 791
    :catch_1
    move-exception v7

    goto :goto_3
.end method


# virtual methods
.method public addCallback(Landroid/view/SurfaceHolder$Callback;)V
    .locals 2
    .parameter "callback"

    .prologue
    .line 681
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v0, v0, Landroid/view/SurfaceView;->mCallbacks:Ljava/util/ArrayList;

    monitor-enter v0

    .line 684
    :try_start_0
    iget-object v1, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v1, v1, Landroid/view/SurfaceView;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 685
    iget-object v1, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v1, v1, Landroid/view/SurfaceView;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 687
    :cond_0
    monitor-exit v0

    .line 688
    return-void

    .line 687
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 1

    .prologue
    .line 807
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v0, v0, Landroid/view/SurfaceView;->mSurface:Landroid/view/Surface;

    return-object v0
.end method

.method public getSurfaceFrame()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 811
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v0, v0, Landroid/view/SurfaceView;->mSurfaceFrame:Landroid/graphics/Rect;

    return-object v0
.end method

.method public isCreating()Z
    .locals 1

    .prologue
    .line 677
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-boolean v0, v0, Landroid/view/SurfaceView;->mIsCreating:Z

    return v0
.end method

.method public lockCanvas()Landroid/graphics/Canvas;
    .locals 1

    .prologue
    .line 750
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/view/SurfaceView$3;->internalLockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    move-result-object v0

    return-object v0
.end method

.method public lockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;
    .locals 1
    .parameter "dirty"

    .prologue
    .line 754
    invoke-direct {p0, p1}, Landroid/view/SurfaceView$3;->internalLockCanvas(Landroid/graphics/Rect;)Landroid/graphics/Canvas;

    move-result-object v0

    return-object v0
.end method

.method public removeCallback(Landroid/view/SurfaceHolder$Callback;)V
    .locals 2
    .parameter "callback"

    .prologue
    .line 691
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v0, v0, Landroid/view/SurfaceView;->mCallbacks:Ljava/util/ArrayList;

    monitor-enter v0

    .line 692
    :try_start_0
    iget-object v1, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v1, v1, Landroid/view/SurfaceView;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 693
    monitor-exit v0

    .line 694
    return-void

    .line 693
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setFixedSize(II)V
    .locals 1
    .parameter "width"
    .parameter "height"

    .prologue
    .line 697
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget v0, v0, Landroid/view/SurfaceView;->mRequestedWidth:I

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget v0, v0, Landroid/view/SurfaceView;->mRequestedHeight:I

    if-eq v0, p2, :cond_1

    .line 698
    :cond_0
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iput p1, v0, Landroid/view/SurfaceView;->mRequestedWidth:I

    .line 699
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iput p2, v0, Landroid/view/SurfaceView;->mRequestedHeight:I

    .line 700
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->requestLayout()V

    .line 702
    :cond_1
    return-void
.end method

.method public setFormat(I)V
    .locals 2
    .parameter "format"

    .prologue
    const/4 v1, 0x0

    .line 715
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 716
    const/4 p1, 0x4

    .line 718
    :cond_0
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iput p1, v0, Landroid/view/SurfaceView;->mRequestedFormat:I

    .line 719
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v0, v0, Landroid/view/SurfaceView;->mWindow:Landroid/view/SurfaceView$MyWindow;

    if-eqz v0, :cond_1

    .line 720
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    #calls: Landroid/view/SurfaceView;->updateWindow(ZZ)V
    invoke-static {v0, v1, v1}, Landroid/view/SurfaceView;->access$000(Landroid/view/SurfaceView;ZZ)V

    .line 722
    :cond_1
    return-void
.end method

.method public setKeepScreenOn(Z)V
    .locals 3
    .parameter "screenOn"

    .prologue
    const/4 v2, 0x1

    .line 744
    iget-object v1, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v1, v1, Landroid/view/SurfaceView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 745
    .local v0, msg:Landroid/os/Message;
    if-eqz p1, :cond_0

    move v1, v2

    :goto_0
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 746
    iget-object v1, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v1, v1, Landroid/view/SurfaceView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 747
    return-void

    .line 745
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setSizeFromLayout()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 705
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget v0, v0, Landroid/view/SurfaceView;->mRequestedWidth:I

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget v0, v0, Landroid/view/SurfaceView;->mRequestedHeight:I

    if-eq v0, v2, :cond_1

    .line 706
    :cond_0
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v1, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iput v2, v1, Landroid/view/SurfaceView;->mRequestedHeight:I

    iput v2, v0, Landroid/view/SurfaceView;->mRequestedWidth:I

    .line 707
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->requestLayout()V

    .line 709
    :cond_1
    return-void
.end method

.method public setType(I)V
    .locals 2
    .parameter "type"

    .prologue
    const/4 v1, 0x0

    .line 725
    packed-switch p1, :pswitch_data_0

    .line 732
    :goto_0
    packed-switch p1, :pswitch_data_1

    .line 741
    :cond_0
    :goto_1
    :pswitch_0
    return-void

    .line 729
    :pswitch_1
    const/4 p1, 0x0

    goto :goto_0

    .line 735
    :pswitch_2
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iput p1, v0, Landroid/view/SurfaceView;->mRequestedType:I

    .line 736
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v0, v0, Landroid/view/SurfaceView;->mWindow:Landroid/view/SurfaceView$MyWindow;

    if-eqz v0, :cond_0

    .line 737
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    #calls: Landroid/view/SurfaceView;->updateWindow(ZZ)V
    invoke-static {v0, v1, v1}, Landroid/view/SurfaceView;->access$000(Landroid/view/SurfaceView;ZZ)V

    goto :goto_1

    .line 725
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 732
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public unlockCanvasAndPost(Landroid/graphics/Canvas;)V
    .locals 1
    .parameter "canvas"

    .prologue
    .line 802
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v0, v0, Landroid/view/SurfaceView;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0, p1}, Landroid/view/Surface;->unlockCanvasAndPost(Landroid/graphics/Canvas;)V

    .line 803
    iget-object v0, p0, Landroid/view/SurfaceView$3;->this$0:Landroid/view/SurfaceView;

    iget-object v0, v0, Landroid/view/SurfaceView;->mSurfaceLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 804
    return-void
.end method
