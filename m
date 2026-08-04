Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C5468C27
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851420; cv=none; b=qrcZNyoeNyeNMYdyj5zMRrLwBoQcrPGPugLdvkfV26JDZnSMaViRu5+8T+Z+KoV7rljACH75rx327ak+WgrhaS9J1HN3kAt0ZbhuZLPtMhnMb0EQzdnxBFNlEakfprs3I5a3G1gZnH6ptckNLoxH8Vc56DqI9NkNeSXwTTTYVAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851420; c=relaxed/simple;
	bh=SEOU5RkBkuI2ukllEZ2ddf/w+x7gbLwxKoQkicAoYpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cjhn8M2DEIWQUld3C3BsVwdz3PXywpHjVOO9ncVE5YvU2CyK0tzeGtxjW7eDkZZ4UvE7C6x0a1jcZ/i6LYoI2FvzvYWbzOKo4QvL7ILFsnQlLYJ5E9ZALm2Mo/y5f06YUixYp0l0x7zhh/GuTKQjNiVfwKLuTy15u5puOeqbDBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThuamzJD; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThuamzJD"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso1373150f8f.2
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851416; x=1786456216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnvjlA4VIB7kb1Sr8VcLedlruGUDjsd/vyAj9uQl35A=;
        b=ThuamzJDvJFt2x4abSYRJEY7agQ/+UwwUepQIc0ybmMsM1OL8b69mZ/D3zisli14NJ
         eb4exrSJewfhJwam5nD7THJrT64XNDBhhSNx90PQQNiHyKF3ThuhmrzXzQDofaYOM318
         sXDWkWF+97SGaIb12QVeZ+5Dk4dZUj/xM19IjYM9QNWFR8Yp/IvyhZroI+bp72i8F/YU
         KUjFNGG0N/nWzJFRf/akSfXcropQFjWnnCKBl1VCsnwkZ9d0Yc8RhKDIRF5uPWbXePnF
         Fyu7iTocF/VVLq9bDvQr9FS4pocWNRqaoLwgb8sZ0piclI5Ovy5kdsPjRlmgSJbXZP8x
         cCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851416; x=1786456216;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnvjlA4VIB7kb1Sr8VcLedlruGUDjsd/vyAj9uQl35A=;
        b=KK8kQSRFPzZl6glWmiMdGAEes/BnwrGGR9kaM0B80g2yVL73rws2fWbLlao/y4cVRz
         pCLoGY1GKJHddDp4kbam6MIl7aKYs3SxBfimhlcb9hbsf8KEu88CmcyWQUOAVz4+GV4x
         MsC5zWvruMemOHcyg44Aggj/YvHjEvFk/NpZYRGXo5WcRJo1QbY4GVQAIujifbF9uqwU
         gf90F2lYcneXMCUzYhr/QS1hn+16/GEbWFsKvw46y+MTF0Q1iVGO7opTUo5WaWs2rvFb
         bjxAGhUfqNTua7fRjKwOk9UZQf9VCbKapNf8WY64/kXMNN1CBUNtYNwu7Twu3IL0Tz0S
         VmWw==
X-Forwarded-Encrypted: i=1; AHgh+RqmB/vyou/ERTx/b0h+V0m3nFdeFxkFeLmKGvIUJ/QMWuHBKgEzBWzx67iFoIcfIXVkLS9i/ckz3C2hTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNknhO8Cflf/3wXq6EycUhmk/+qM9uL1ytQdXbYaCjiKNlbOM
	QgwkS4hQUd7yJiGdgBNrjihNEzpJUPN6/vcgDpyHQJITN9F2uPr7I3T/
X-Gm-Gg: AR+sD105finguvndlpdpV4a79xoT+Vs4QjAMBsfi7nk2+84IcbX1zrMBk4yqK9zkJ7b
	sGSipkugoa31b/2C3eBqn9d43Iq58cuo6iuH4T4eFidLRREzqhUZGLDGBTCBt/qaBN/3i11BwR6
	mfo/1KuK76u7M7xYTCPaXcneawLaxSWpUK7XZV163kSkSgpKlky2DjKuI9MVyBi1D632IFS0887
	MULs3/9JbptEnWMIvt1pI75peEKT+OgOiq/4R9L4JZX/QhkqQfz+WH3FroKApVm9EizqFacBM3E
	O7j8ffDUmaaEeQogAMN6A2WaXG0295w78E8PaMZ5/0SPhJBvSAgdqncRb+SEcxJFg/gKIOAeriy
	BlRmlAKk/KNA+HT1aigEUKbN94xtYbtA3RGmFKkjPYez2zQrYjZTv7GTdUo12CNcBTb6+k5BGaJ
	qiVzp15yMJb4+Mrchr4pQ9cx3F/vhciRauEclkuBOsPdoRmM8tDmu+ksBNNmcMsJCB+ZstP53S/
	TS3QbeD0A==
X-Received: by 2002:adf:e199:0:b0:47f:e729:c588 with SMTP id ffacd0b85a97d-47fe729c5bamr16715641f8f.14.1785851416133;
        Tue, 04 Aug 2026 06:50:16 -0700 (PDT)
Received: from [192.168.178.84] ([134.19.63.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0ae0sm45000523f8f.33.2026.08.04.06.50.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:50:15 -0700 (PDT)
Message-ID: <0c5ceb5e-a9d3-48c9-9ea8-d00966de22de@gmail.com>
Date: Tue, 4 Aug 2026 15:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/qxl: avoid hangs on an unresponsive SPICE host
To: Mikhail Novosyolov <m.novosyolov@rosa.ru>, dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, simona@ffwll.ch,
 sumit.semwal@linaro.org, dreaming.about.electric.sheep@gmail.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 a.sudakov@rosa.ru, ghadi.rahme@canonical.com, timo.lindfors@iki.fi
References: <20260724122636.213906-1-m.novosyolov@rosa.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20260724122636.213906-1-m.novosyolov@rosa.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/24/26 14:26, Mikhail Novosyolov wrote:
> Symptoms:
>   - text/fbcon console (and TTY) of a QEMU VM hangs (does not work)
>   - SSH works OK
>   - system cannot be rebooted or powered off via systemd
> 
> QXL is a paravirtual display device: the guest submits drawing commands
> and the host (QEMU's SPICE server) executes them.  Each
> submitted batch carries a "release" -- a completion record the host
> marks done when the work is finished -- which the guest uses as a
> dma_fence.  Before the guest can reuse or evict a piece of video memory
> it must wait for the release covering it to be marked done: a to-do
> entry that needs its checkbox ticked before the page can be recycled.
> 
> The host drains the command ring only while a display client is
> attached (someone is watching the screen).  With no client -- the
> normal state of an unattended server VM -- the host stops processing,
> the checkboxes are never ticked, and the guest's wait never completes.
> Heavy console output (fbcon redraw) fills video memory and keeps the
> guest waiting on these releases, which surfaces as "[TTM] Buffer
> eviction failed" / "failed to allocate VRAM BO"; and during shutdown,
> where teardown waits on the same releases with no timeout, as an
> uninterruptible hang that leaves systemd and the console callback stuck
> in D state and makes the VM impossible to reboot cleanly.

That is a really good catch, it is actually mandatory for a dma_fence implementation to have a fallback timer to avoid such things.

> This change makes the guest drive the host forward again while it
> waits: periodically notify the host to process and free completed work,
> and run the cleanup that ticks the checkboxes -- restoring the
> behaviour removed by commit 5a838e5d5825 ("drm/qxl: simplify
> qxl_fence_wait").  Two deliberate choices keep the two known upstream
> failure modes from coming back:
> 
>   - the cleanup is queued asynchronously, never flushed inline (flushing
>     here would deadlock -- CVE-2024-36944; details below);
>   - the total wait is bounded (30 s by default), so a completely
>     unresponsive host can no longer hold the console/modeset locks
>     forever; on give-up a ratelimited warning is logged and the caller
>     proceeds or retries.

That sounds extremely questionable to me. From a dma_fence perspective implementing this in the qxl_fence_wait() callback is pretty much a NO-GO to begin with and most likely the reason why Gerd and Thomas reworked the code in the first place.

The usual approach is to have either a timer or delayed work which is started as soon as the fence is created and when times out pings the host periodically to do something.

To summarize the general idea is ok, but don't do that in qxl_fence_wait().

Regards,
Christian.

> 
> The periodic nudge resolves the eviction failures; the bound resolves
> the reboot hang.
> 
> Background -- known discussions of this regression:
> 
>   * Ubuntu/Launchpad bug and reproducer (test.sh):
>       https://bugs.launchpad.net/bugs/2065153
>   * Regression report and analysis:
>       https://lore.kernel.org/regressions/ZTgydqRlK6WX_b29@eldamar.lan/
>   * Debian #1054514 (the report behind the upstream revert):
>       https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054514
>   * Ubuntu kernel-team reproducer thread:
>       https://lists.ubuntu.com/archives/kernel-team/2025-July/161304.html
> 
> Commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") reduced the
> wait to a single wait_event_timeout() whose condition calls
> qxl_io_notify_oom() exactly once, when first tested.  The condition is
> never re-evaluated unless release_event fires, and with the host not
> draining no such wakeup arrives; releases never complete and the fence
> is never signalled.
> 
> qxl_queue_garbage_collect() is called with flush=false on purpose:
> flush_work() in this context deadlocks against the console owner and the
> worker pool -- the CVE-2024-36944 regression -- which is why the upstream
> revert of commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") did
> not stick and was reapplied as commit 3628e0383dd3 ("Reapply "drm/qxl:
> simplify qxl_fence_wait"").  flush=false matches what the IRQ handler
> already does and cannot deadlock.
> 
> Bounding the wait deliberately relaxes the assumption documented in
> dma_fence_wait() (include/linux/dma-fence.h) that a MAX_SCHEDULE_TIMEOUT
> wait can never time out: a give-up is reported to the caller as a
> timeout (0), so the few MAX_SCHEDULE_TIMEOUT callers reachable from qxl
> through TTM (the page-fault idle wait, delayed delete, the OOM ghost
> swapout and evict_all) continue with an unsignaled fence.  This is not a
> new failure class: it only fires after fence_giveup_ms on a host that is
> entirely unresponsive -- on a merely slow host the fence signals long
> before the bound, thanks to the periodic nudge -- and the pre-regression
> implementation, commit 07ed11afb68d ("Revert "drm/qxl: simplify
> qxl_fence_wait""), already returned with an unsignaled fence via its
> 'goto signaled' path once its spin-count limit was reached.
> 
> The reboot/shutdown hang is a lock-contagion effect.  An atomic commit
> holds a DRM modeset ww-mutex and blocks on a release fence that never
> signals, so every later console update then blocks on that same mutex.
> Systemd's own console writes are such an update: they trigger fbcon
> panning (drm_fb_helper_pan_display() -> drm_atomic_get_plane_state() ->
> drm_modeset_lock()), which takes the ww-mutex non-interruptibly
> (TASK_UNINTERRUPTIBLE) and therefore lands in D state.  With pid 1
> stuck in D state the VM can neither be shut down nor rebooted, and only
> a host-side reset clears it.
> 
> Example of this lock:
>   INFO: task systemd:1 blocked for more than 245 seconds.
>   Not tainted 6.12.47-generic-5rosa2021.1-x86_64 #1
>   "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>   task:systemd
>   state:D stack:0 pid:1 tgid:1 ppid:0
>   flags:0x00000000
> Call Trace:
>   <TASK>
>   __schedule+0x408/0x1360
>   schedule+0x27/0xf0
>   schedule_preempt_disabled+0x15/0x30
>   __ww_mutex_lock.constprop.0+0x526/0x980
>   ? __kmalloc_noprof+0x177/0x420
>   drm_modeset_lock+0x37/0xc0
>   drm_atomic_get_plane_state+0x7e/0x180
>   drm_client_modeset_commit_atomic+0xaa/0x230
>   drm_client_modeset_commit_locked+0x5a/0x160
>   drm_fb_helper_pan_display+0xfd/0x240
> 
> 30 seconds seems to be a reasonable default value:
>   - it should not be triggered on a slow, but responsive host,
>     realistic worst-case release completion on a slow host is < 10 sec
>   - it must be less than hung_task_timeout_secs=120s
>   - it should be less than DefaultTimeoutStopSec=90s in systemd
> 
> Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
> Assisted-by: Kimi:K3
> Assisted-by: Z.AI:GLM-5.2
> Signed-off-by: Mikhail Novosyolov <m.novosyolov@rosa.ru>
> ---
>  drivers/gpu/drm/qxl/qxl_release.c | 59 ++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 06979d0e8a9f..75286e6d5ec5 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -21,6 +21,8 @@
>   */
> 
>  #include <linux/delay.h>
> +#include <linux/jiffies.h>
> +#include <linux/moduleparam.h>
> 
>  #include <drm/drm_print.h>
> 
> @@ -56,20 +58,67 @@ static const char *qxl_get_timeline_name(struct dma_fence *fence)
>         return "release";
>  }
> 
> +/*
> + * Upper bound for a single release fence wait when the host does not
> + * respond at all, in milliseconds.  Prevents uninterruptible sleeps
> + * without a bound when a SPICE host stops draining the QXL rings.
> + */
> +static unsigned int fence_giveup_ms = 30000;
> +module_param(fence_giveup_ms, uint, 0644);
> +MODULE_PARM_DESC(fence_giveup_ms,
> +                "upper bound in ms for a qxl release fence wait with unresponsive host (default 30000)");
> +
>  static long qxl_fence_wait(struct dma_fence *fence, bool intr,
>                            signed long timeout)
>  {
>         struct qxl_device *qdev;
>         unsigned long cur, end = jiffies + timeout;
> +       unsigned long giveup = jiffies + msecs_to_jiffies(fence_giveup_ms);
> +       signed long left = timeout, slice;
> 
>         qdev = container_of(fence->extern_lock, struct qxl_device,
>                             release_lock);
> 
> -       if (!wait_event_timeout(qdev->release_event,
> -                               (dma_fence_is_signaled(fence) ||
> -                                (qxl_io_notify_oom(qdev), 0)),
> -                               timeout))
> -               return 0;
> +       /*
> +        * A SPICE host may stop draining the QXL rings, e.g. when no
> +        * display client is attached to the VM.  In that state releases
> +        * complete only if the device is kicked through the OOM notifier
> +        * and garbage collection gets a chance to run, so poke both
> +        * periodically while waiting.
> +        *
> +        * Garbage collection is queued without flushing on purpose:
> +        * flush_work() here can deadlock against the console owner and
> +        * the worker pool (see CVE-2024-36944).
> +        *
> +        * The wait is bounded by fence_giveup_ms even when the caller
> +        * passed an infinite timeout: a completely unresponsive host
> +        * must not hang tasks holding the console lock forever.  The
> +        * bound is reported to the caller as an ordinary timeout,
> +        * letting TTM retry eviction later.
> +        */
> +       for (;;) {
> +               qxl_io_notify_oom(qdev);
> +               qxl_queue_garbage_collect(qdev, false);
> +
> +               slice = min_t(signed long, left, msecs_to_jiffies(100));
> +               if (wait_event_timeout(qdev->release_event,
> +                                      dma_fence_is_signaled(fence),
> +                                      slice))
> +                       break;
> +
> +               left -= slice;
> +               if (left <= 0)
> +                       return 0;
> +
> +               if (time_after(jiffies, giveup)) {
> +                       dev_warn_ratelimited(qdev->ddev.dev,
> +                                            "fence %llu#%llu not signaled after %u ms, giving up\n",
> +                                            (unsigned long long)fence->context,
> +                                            (unsigned long long)fence->seqno,
> +                                            fence_giveup_ms);
> +                       return 0;
> +               }
> +       }
> 
>         cur = jiffies;
>         if (time_after(cur, end))
> --
> 2.51.0
> 

