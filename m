Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9EF37E5D1
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 15:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165088; cv=pass; b=EvxzGfkLQEBGGukNE1KVBcmaw2SJdNSNMbOueLUiOftsBa6CgGcFKtzdWDuIM0jK0luubNWQ3WfP/YxNE+j+6R3CHwVBQ7ZACmvYhd1tCJjwe0JWgWb7fSsDDqLaoD/S2UqoqYxmUP8b5Cdok/+qnULZ6+4Nex/uI31AJjlrUrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165088; c=relaxed/simple;
	bh=z8bTxZCuYDO/DbPzCqIKPPK/NAk1JE1/SUr0J/JQzZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNXILL0bdSoHDYjv/iQHTOFNZUcl+C6pF5g6g3gh7jcw7RDfGUuH3d5RpzgRHaGUxDGpV8mi2a/ztwMCOm2NMqzyDfZMWTlK8fyob9Mj5yoz7erHB0C3NvCUGe40f3/GRC+U12NIn+3OP6VGG8zI2i8turOqfcrnFlBh2MyCCyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YySjDzWo; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YySjDzWo"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1989660a12.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 08:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785165086; cv=none;
        d=google.com; s=arc-20260327;
        b=fkV+x118bcb3NzUX+01JGzlKoNwKKxJhOc2qhUhFXm85WUBT9V9yJiVD03Y5EPiG34
         ZTdn8UlT6rlJywQgJ7qRsCd6e4nBQIuuUx83tE41/UJJketUWCXR/OYpmzDG0QtVHJXz
         suM1MrSSuHNs8+Yz6ZnccXfuceGAC/00QUWy0gj8rNxEQbHyMMZpAM7RHDONCHgFKe4D
         UPJ7JIslm9+xqaoZsFhcUSvB+l40yUkM2bmZ9NazvOcre4t5toLjkwKFw+VibmsxWQjb
         GTH5AHiEtLK2kxkb8yCrci7fhb1tRBXoBvKgh11pkaN4JhemOnKRy01N+vUytwBPgotT
         ZJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DLprF9ab5aanfA37nxhElQ/PL48JoVdr0fckQzmPSz0=;
        fh=b/RZVm/Hh6rRUr04RUMiV+XfzipCiKTVunik4kJsXSY=;
        b=b/fJDVfzHUZ/YCMLoPvmSRtw5MRA83ByeaaDJN9ek9NCdSc+mLmAQLHch/gCdB7m+t
         1CzSaVlNjWKoJBrLQwpNYhVIZ9PNKIwCV4UtmFPOCJ+Vw2GKiTp06hzFfOMNT4Vm4ipd
         6SJ+Io9ARbaciin21Z6bLXqjiRECZFVBG5ws3YwDiDavdxgAWMUeaKJmmjpCpBiIFc96
         pJ1rPdpresu4iBCQw90npJV68m5W9oG/vTXYhevTjUJa1dzxTXcWkRGnZ4Yab72kiixz
         Un34K9hTLQ9pWTJNvGxvZrhPXZceChlUshfrrwBGNOHHAsg8Sdk+umhs2IcNzEFbX+eM
         6jlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785165086; x=1785769886; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DLprF9ab5aanfA37nxhElQ/PL48JoVdr0fckQzmPSz0=;
        b=YySjDzWoHKNUEGvKH6zG6XtqpNE+EX65cgOZovDKh6YDhsAf8KpOoXqfekVZc5yMkn
         xrT0ulwHdOG4UD0aFMrU0pAH5lKQv9Ri+KA+wXZBooj+VvQeaTWyOkKxlRR2UEqoNgz0
         vMYaV+swis7ZOGUH9yNJBnj4TDUElVsIHgbD88HiM3r543WuL7HyLI0tSoRA/434/2bS
         pd6j85wpyiQ1cflbOuQc5UHHKM+OuG4oL2JF6/RI6ejyyWeZY+dqMr31c52jp2V1muV8
         /oG6y5DxqCuFbr+EbevhVlR9VUoC4SGVW9UnjGOVzlXWTKnunTN0orpulFoFhJbW8Y9I
         EQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785165086; x=1785769886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DLprF9ab5aanfA37nxhElQ/PL48JoVdr0fckQzmPSz0=;
        b=BeKuR7RDEWoz8gDCctK3bBzQGUPjNZUMN2dTyFZRta0J4MeTKh+wHKKsXPeGzRraT6
         G3/B6WcHJCpGHoWVoG+mQroZAMICTkR75CnoyveDDMy5qScrTR0kfH8W3rKM/+guhLCy
         9V7sepH067sAb8tvyBQg/pqM64gXoLVpelvyA3ETm7NiE0PVwYtVGXZgiyjitwrS05+e
         Id4TLTDFpN1tHBdotbByHZ8dZnjXawbG4X0Wdz8p3Wpx9edUEHkgKoWnqGcsiWipp+/q
         TV36IgjnX1btgE8ZhtwrdC/kF9VJ04rO6GI+Y+XcsfepZuME5Tiq0PyGO0y4eef0/T2w
         IWqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpif+yHsAsNSummhKMOWdm6A/iVXFYv5g83d9+ybSMLhjZE2seYCehAgquzPDUMNwR0NOBPcM3/XlXx/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjW0dNEqxOck4Xe8ddEyn1YoCAC7DtSX5JMNnpLwm2QoV95EDR
	/YeECTnA+vHK5jvhL3wlaRWlbW4x743fmI3G0KZ7OXKCbaA3DUFuXOw5IzXtkuQspEZRNswCwRG
	GBEs7XvxDlCo7c4I169WsfkVwd4E4iQ==
X-Gm-Gg: AR+sD114uUXwop95EpzR15KgEYd/FBYpHor+R/qlmjJvajFLp9v/HmKN+2N9iVyLONW
	/Zq/z1EXvI7wn8WJptXxF9Tserre+XQdGMpZaNvH9ePd3CXp0G5gFkeZ+q858TFF+WLmh90JDll
	YDPO2ncvBx21PwDD0LMHCkesvxkMF5/HxSJXzeeM5dlF4oQcr124VY1OJCAmgbu7/RSvZnU2Pfx
	clM7Gxy/H0SIvaeR6qkVz7PnyHhVI8ed3R9xE4X8prcZoRt3KRv5rxf8wj5ITURIsVP3Ib3p9En
	eNKU7njvf9gBY78wbPgFbFEDWMWw
X-Received: by 2002:a05:6a21:117:b0:3b5:6b5a:4f31 with SMTP id
 adf61e73a8af0-3c67267fd31mr10484309637.27.1785165085845; Mon, 27 Jul 2026
 08:11:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717154505.83935-1-pavone.lawyer@gmail.com>
In-Reply-To: <20260717154505.83935-1-pavone.lawyer@gmail.com>
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Date: Mon, 27 Jul 2026 17:11:13 +0200
X-Gm-Features: AUfX_mxQeAYfmsp5ndscJp3cVl_h1riLkJOcLZ-AQknL2ZhHaJnGBD90JFOpFcw
Message-ID: <CAMhzubpF5UQZ6b3F9EUM7U_HJUJ6gB9Px-9v=dCW6v-4CVBLKw@mail.gmail.com>
Subject: Re: [PATCH v4] media: rkvdec: fix clk reference leak on unbind
To: jonas@kwiboo.se, detlev.casanova@collabora.com, 
	nicolas.dufresne@collabora.com, hverkuil@kernel.org, mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar, heiko@sntech.de, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Self-review after running this on a Rock 5B+. The reorder closes the
clk leak, but it opens a window I missed when I sent it.
Moving the PM teardown ahead of rkvdec_v4l2_cleanup() is necessary,
for the drvdata reason in the commit message. The side effect is that
video_unregister_device() is now the last thing remove() does, so
/dev/videoN stays open-able while the empty IOMMU domain is already
freed.
A job queued in that window reaches rkvdec_iommu_restore() and touches
the freed domain. Before the reorder, cleanup ran first and the window
did not exist.
Splitting the helper keeps both properties: unregister the media and
video devices first, which stops new jobs, then tear down PM, then
release the m2m and V4L2 device. Only that last step clears drvdata,
so rkvdec_runtime_suspend() still finds its state.

   cancel_delayed_work_sync(&rkvdec->watchdog_work);

   rkvdec_v4l2_unregister(rkvdec); /* media + video unregister */

   pm_runtime_dont_use_autosuspend(&pdev->dev);

   if (rkvdec->empty_domain)
     iommu_domain_free(rkvdec->empty_domain);

   pm_runtime_disable(&pdev->dev);
   rkvdec_v4l2_release(rkvdec); /* media cleanup, m2m, v4l2 */

Running here on 7.2-rc5: unbind then rebind returns the rkvdec clock
enable counts to their pre-unbind values and /dev/video0 comes back.
I can send this as a v5 carrying both changes, or as a follow-up patch
on top of v4, whichever you prefer.
Thanks,
Francesco

Il giorno ven 17 lug 2026 alle ore 17:45 Francesco Saverio Pavone
<pavone.lawyer@gmail.com> ha scritto:
>
> From: Jonas Karlman <jonas@kwiboo.se>
>
> remove() calls pm_runtime_disable() before
> pm_runtime_dont_use_autosuspend(), so the second call can never suspend
> the device: it reaches rpm_idle(), which returns -EACCES once PM runtime
> is disabled. The probe error path has had the two the other way round
> since the driver was merged.
>
> This shows up when the device is unbound while the 100ms autosuspend
> window is still open, which is what an rmmod right after a decode does.
> device_release_driver() calls pm_runtime_put_sync() before .remove(),
> and rpm_idle() adds RPM_AUTO on its own, so that put only arms the
> autosuspend timer. pm_runtime_disable() then cancels the timer, and
> pm_runtime_reinit() relabels the device suspended without calling the
> driver back. The clk_bulk reference taken by rkvdec_runtime_resume() is
> never dropped, and a later probe does not reclaim it, so every such
> unbind leaks one enable count.
>
> Drop autosuspend first, so the callback still runs and releases the
> clocks.
>
> The PM calls also have to move ahead of rkvdec_v4l2_cleanup() rather
> than just swap with each other. rkvdec_runtime_suspend() looks its state
> up with dev_get_drvdata(), and v4l2_device_unregister() clears it:
> struct rkvdec_dev has v4l2_device as its first member, so
> &rkvdec->v4l2_dev and rkvdec are the same address and the check in
> v4l2_device_disconnect() matches. That is harmless today because
> pm_runtime_disable() suppresses the callback, but once the callback can
> run, a suspend after the V4L2 teardown dereferences NULL. Swapping only
> the two PM calls oopses on every unbind.
>
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> [fsp: wrote the commit message; the diff is unchanged]
> Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
> ---
> Changes in v4:
>  - No functional change. Resent as its own thread (no In-Reply-To on v2),
>    per Nicolas's note that a new version should be its own thread for
>    patchwork tracking. Same diff and same commit message as v3.
>
> Changes in v3:
>  - Rewrote the commit message, and dropped the VP9 claim from v1 and v2.
>    Those said this fixed a VP9 inter-prediction bug on RK3588, green chroma
>    from the second ALTREF frame onward. The bug is real, but this is not
>    what fixes it, and I should have established that before sending v1.
>
>    What happened: I took this patch out of chewitt's tree along with two
>    others and tested the three as a batch. The green is fixed by "media:
>    rkvdec: implement reset controls" from Alex Bee, which adds the
>    reset_control handling that recovers the VDPU381 after a transient error
>    (COLMV_REF_ERR_STA and friends) instead of leaving it dirty for the next
>    inter frame. Randy Li's PMU idle export goes with it. This patch was the
>    third one in that batch and got the credit.
>
>    Retested this week on the same Rock 5B+ with an unpatched driver: a VP9
>    Profile 0 1080p clip with alt-ref frames decodes byte-identical to the
>    libvpx reference, across five rmmod/insmod cycles and after an unbind
>    inside the autosuspend window. The green does not come back, because the
>    reset_control work is in the tree I test on. Sorry for the review and the
>    testing you spent on that basis.
>
>  - Worth flagging separately: mainline rkvdec has no reset_control support
>    at all, so the VDPU381 is never recovered after a transient error. That
>    is a real gap, it is just not this patch. I can write it up properly if
>    that is useful.
>
>  - The diff is unchanged from v1 and v2. It is Jonas's 2020 commit verbatim,
>    and his original one-line subject already described exactly what it does.
>    The wrong story was mine, not his.
>
>  - The subject changed with the message: "media: rkvdec: fix PM runtime
>    teardown ordering in remove" in v1 and v2, "media: rkvdec: fix clk
>    reference leak on unbind" here, since that is what it actually fixes.
>
>  - What is left is measured. With a dev_info() at the top of
>    rkvdec_runtime_suspend(), autosuspend_delay raised to 60s to take the
>    timer out of the race, and unbind driven through sysfs:
>        unpatched: 0 suspend callbacks, aclk_rkvdec0 enable_count 1 -> 2
>        patched:   1 suspend callback,  enable_count 1 -> 1
>    The leak survives rmmod and accumulates one per unbind. With
>    autosuspend_delay=0 both orders suspend once, which is the control: the
>    difference only exists inside the window.
>
>  - Fixes: was wrong in v1 and v2. ff8c5622f9f7 has the two pm_runtime calls
>    as context and only added iommu_domain_free(). cd33c830448b added remove()
>    with the reversed order, and the probe error path with the right one, so
>    the tag points there now.
>
>  - Dropped Cc: stable. A clk reference leaked on unbind is not backport
>    material, and the tag was only there for the VP9 claim.
>
>  - Dropped your Reviewed-by and Tested-by from v2: they were given for a fix
>    to something else.
>
>  - Not included, happy to send as follow-ups: clearing empty_domain after
>    iommu_domain_free(), and hoisting the unregisters to the top of remove()
>    as you suggested on v2.
>
> Tested on a Radxa Rock 5B+ (RK3588) on a 7.1 tree where the six calls in
> rkvdec_v4l2_cleanup() are open-coded; the executed sequence is the one this
> patch produces. VP9 decode stays byte-identical to libvpx, and five
> rmmod/insmod cycles leave dmesg clean.
>
> Link to v1: https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.com/
> Link to v2: https://lore.kernel.org/all/20260518145414.64514-1-pavone.lawyer@gmail.com/
> Link to v3: https://lore.kernel.org/all/20260717150440.77079-1-pavone.lawyer@gmail.com/
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index 1d1e9bfef8e9..0ec3fca9cccc 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1869,12 +1869,13 @@ static void rkvdec_remove(struct platform_device *pdev)
>
>         cancel_delayed_work_sync(&rkvdec->watchdog_work);
>
> -       rkvdec_v4l2_cleanup(rkvdec);
> -       pm_runtime_disable(&pdev->dev);
>         pm_runtime_dont_use_autosuspend(&pdev->dev);
>
>         if (rkvdec->empty_domain)
>                 iommu_domain_free(rkvdec->empty_domain);
> +
> +       pm_runtime_disable(&pdev->dev);
> +       rkvdec_v4l2_cleanup(rkvdec);
>  }
>
>  #ifdef CONFIG_PM
> --
> 2.54.0
>
