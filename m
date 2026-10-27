Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119866;
	b=L+VXw+rpkkGk1cbLRCha6s/G67U8MvQQmI+MyDcF42dTRLmNpWGeG7rVasCMXnAj5bXg
	 ydFpwpMLj0WYmJEM0k1m6ywwQIQ8jUCbRrXiaUdyUMtZ9IpFsx6/GSjklfl2AQECkX9Ir
	 ajNwCzc/b068J6JiYomjWku/vLAps0IzpH/18peuiL0EHbaBtzM/ffxtDuoCHT0LAmUiB
	 FmnuC37XXu8L+iDAa4ypANyeSE9xANig/JuIBkkD66VProKaPTJRoj1NH1IqgA35PZY8Z
	 SMqhBmBPG6sjYipIG9VtgLcYBYzHgF6bnJDn/vdMgoMTNtNx+OptyQjLjYWqp641fUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=gL6dJRyC87gSi0UJQ1axnIT4yInKJxdawRq198/IQ5k=;
	b=ygc+Tfuyof18Ua1T/cx+bzacOorB6oF3TpCn7K5zJPILj1r1Aimx/tJ2t6NOCs6XXkMK
	 wX9Y4kw577Py6YCP8M785pewFPKJO77QqkzIkQWR62A6SNtjRV3RHd3sorc3JGughgmg+
	 bSxTybN0L379h8WHs8kmx0E+Rz157t/BUzic5hCZmC/gEX1ovWbp8ABVcrTRZ7K6T56lU
	 rSQJGnrwhpo1pDMJiQd+4e77ush1Xa0sK0yj/d76QqcmqO66mDZ4ufBUj08zXdnqPQ/XI
	 yeMtDEuvl8X69jzGi+TfGVWIY0CWRbjF3DaCup0HonYYY+0k6QhiFRISLppuEKszGgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=f2AcRrWv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF54606A31E
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEF54606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=f2AcRrWv
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a6f2825dd6so35994fac.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119865; cv=none;
        d=google.com; s=arc-20260327;
        b=cYnsvb//8aCOfAj2iWO+xJQkAdVmiDcRWh2ECbFC8Mp4H3DkYmY6IQ4IgkKIIUUSCi
         odDM+AkMB9DYLhhNC3nqHmVHGY58dRHlX+sPbCDQ6TWE72HI/vNVNik3qn7fwI19DZda
         rS7Dz7LQ3JHKmstTlCCI+5y3k4N5DeVzJUZQziGQr2VGARmBN90ioG91ZQl9e8qtFJs1
         so5j8sDhjcimNk2DAB/BuGaGSpHOF2WnJIYO4cL8e1mCWb0rFWoVFT4DPa8v7aTzTmzm
         53Y13OVzdI38aaZv/DNacEXdqxtFiqNcOXh1AIzrELnfORYRF8YHJEq6odlTPjK1+AS8
         LqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gL6dJRyC87gSi0UJQ1axnIT4yInKJxdawRq198/IQ5k=;
        fh=tGHurcCrg7MRfmk5n2yOOFiewXDbw2V0/f8Rds+JktU=;
        b=T6Qdyv2OrVIiFyqgqiUchjh0icjEclCQDUvHU+gRB7t+hX+dt/PD+OXHcgPTEbCqz3
         L+NtaEJvHpOOkgtFOCA63xKYN++4iBo82x9QsrLSxvh18htFpb6YSnW/SLAxMTzgDsHy
         Z8i+Xdc7xUS6pq8yqpIV2OTJI1IHcsHrQQFBom695xOBqY1GFyVirXndMiPjxdcGsjg4
         PqcKVRsMf4GLw24HUwVsuDPPciMNSBC+zz8aawWTsz6j2lORDwpRL4YR1hGxdLsP9qm+
         v2cJQNNU9rwm1qknSfheH5D7Eu+TvWOZKagh+SgjNly00JVF996wHGn4pksR+1rLLHMb
         dUww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793119865; x=1793724665; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gL6dJRyC87gSi0UJQ1axnIT4yInKJxdawRq198/IQ5k=;
        b=f2AcRrWv5oi1ivQNNe9pviZGHpfiK1uiUFT8pQSXULYzdF+YGe/NCMqF+VONT4YcMy
         USUN9cHI8CB25BG4MuVk9Uo+sUb5OqCFcD+CwWgJorVgGmS41UzAfoMStWXY2Mw0ved+
         YtxBLBoUx3LFFlM5gBvrjrGIFDDRp9GncBafYJPjQ5ySeLnXd8n9GtT16YFUqEcm4R5m
         tToxLd3MkjgAnM+DdQWCi9UkKuuGdGK9WkIWxE9cy9LuB8WtAC/q/QssIgtrXvskHXT8
         MbFY3h/OXGffCL1rDyKIQbbd2cB+SdtloBYfaQEjvYEf2UHUEs4IqjYERIFuVvj3RJB+
         svpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119865; x=1793724665;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gL6dJRyC87gSi0UJQ1axnIT4yInKJxdawRq198/IQ5k=;
        b=a+viwQhDm6IYR2rxSNHgzyPFNZbvmuQu/wcqkcfUPJJT376XpzFMlpp4Hh3/U+USfD
         mW3MUAXuSweB8EeS/A6gQTI9U/zGjNbyMw06NZo4uq7Vvuuyh3fiGqTF/zygMjmLa+GI
         7Nng/Vr4lxcHjB3DH3m8dby47qUROyGmBCv7wal1wUBEJqUYEtDRTNOaIHKGUqkvoTLh
         KGeszPVIulfUlvM9CJsQioQ44L+L2B1YqJBE5uQHktiPVrnUvrvAmPPIeDYXzxs6Tnw0
         v0L+llSq0nZiPXXQROky2S4dKyx0VLSgTTKqWpwv3KuqdLJHPAs1muyZ5YY2kbLekskc
         uM/A==
X-Forwarded-Encrypted: i=1; AKwUvBwquYLB+5lxtVX+IbcWU17dQ1SAQvqeMOUCYW2dxNieWz1+pUsn/DlAlmC5orz9jbVRDs+nsfRsaQHbLQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL+6TE42EFns5lRloNz94k6RnSIfvgnmALfGpG5rVtH1xGPlWht
	4Uc+G+ifFV/+ZmUE2M/5AIwfs7mQDYjuEpM7qd+sN/bDNbmlb5xk9NPB4nyDtrMj2JQuCsONu2h
	LJlihZCdeuh3D7IE2Scfo7rPon3AJ3j4du1kRuGYdAw==
X-Gm-Gg: AYBFou1c67kt89pWWoTSvKPH7lIf8jIIxTvib1wvs9NJMctqVif2waL/LmgnSnlK7u/
	chO1D0sAMnbezI4LQnn0d1Ma1mpIpmTqAUdDfcLwh+NYd8LSKQZVtkXLAvvxcrcOO26aIlSOJTP
	lRN0A8AX+fSLs/SjId6lVHxQXchKry3myumOrNCHTJNJF9biLD9MljxGXDYaDRmo4R/M65HH0nX
	juJ2Ah3y4sCT6Y8qmvviBDDXSpUWvwnka0EQ/sikAErHuee4cnoVTGFEvJ5GxJwX8EBxywR4Ssx
	zqSzQ8RCnitE1F+U6FuEw4TSelEumNjDFCl/YeBCFKf9opsiwuY6bdqyp/s6j+dj+MMHwG79v9R
	shQDyJsHORN04wZCoGUoOimWzjj0XgFB6GDi1EVFusfqhaN+MKDUDu6iJKAyU1VqkytXgTL+9lo
	ElK2+0YCxfnZiJTKsDqiyIny5+6vB7wLdnRc6UsUNImV91tZF9KzQREg==
X-Received: by 2002:a05:6870:d889:b0:46a:c217:c56d with SMTP id
 586e51a60fabf-4a8bb1737f0mr98260fac.2.1793119864501; Tue, 27 Oct 2026
 09:51:04 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <20261026111032.88355-2-antoine.pichot@gmail.com> <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
In-Reply-To: <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 27 Oct 2026 16:50:48 +0000
X-Gm-Features: AclHuK-6apCrsSW-JKKLxfQ64Ax9KsC9jd8-Haw-R9qIe3JqmapOTsN1wSNV7Ks
Message-ID: <CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com>
Subject: Re: [PATCH 1/7] media: i2c: ov7251: Fix link frequency index
To: "D. Manresa" <dmanresa@gmail.com>
Cc: antoine.pichot@gmail.com, linux-media@vger.kernel.org, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, djrscally@gmail.com, 
	dan.scally@ideasonboard.com, hansg@kernel.org, 
	andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Antoine and D. Manresa

On Tue, 27 Oct 2026 at 10:27, D. Manresa <dmanresa@gmail.com> wrote:
>
> On Mon, Oct 26, 2026 at 08:10:26PM +0900, Antoine Pichot wrote:
> > Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
> > 319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
> > and the pixel rate and PLL registers are off the same way.

I'll agree that the link frequency isn't abided by, and your patch
does fix that. However testing on a DT based system (Raspberry Pi)
with a 24MHz extclk I'm also seeing issues.

I'm working with the datasheet from
https://static6.arrow.com/aropdfconversion/dedba0a4f2b52e9b6587341a0e31cd115a2c3a46/ov7750_ov7251_csp3_rev1f_ds_2.12.pdf

As I read it, the pixelrate is configured via PLL2. Those settings are
identical between the 2 link frequencies, so the pixel rate should be
48000000 in both cases. Without that I was getting 75fps from
libcamera when I asked for 100fps. 100 * 480 / 638.4 = 75.1fps.
The settings for PLL2 with a 24MHz extclk exactly follow the sample
PLL configuration in table 2.10 of the datasheet. For 24MHz the
multiplier is 0x28 / 40dec vs 0x32 / 50dec for 19.2MHz, resulting in
the same rate.

The settings for PLL1 seem to be all over the shop if the datasheet is correct.

With a 24MHz extclk and measuring with an oscilloscope, the "240MHz
link freq" actually runs at 400MHz. The "319.2MHz link frequency" runs
at 454MHz.
If I follow the datasheet, then the 240MHz mode does fall out at 400MHz
For the 319.2MHz mode I reckon that the VCO is well out of spec -
2.128GHz when the limit is 800MHz.

The numbers for the 19.2MHz modes look sane in their ratios, but I
can't test them.
The 240MHz link freq does a prediv of 3, multiply by 75, and divider
of 1, which keeps things in range, and 19.2 / 3 * 75 / 1 = 480MPix/s,
or 240MHz.
The 319.2MHz link frequency uses a prediv of 1 and multiply by 0x85 /
133 gives a VCO frequency of 2.55GHz, when again the limit is 800MHz.
That then gets divided by 4 afterwards for a supposed result of
638.4MPix/s or 319.2MHz.

@D. Manresa it'd be worth trying using a prediv instead of (post)div:
static const struct ov7251_pll1_cfg ov7251_pll1_cfg_19_2_mhz_319_2_mhz = {
    .pre_div = 0x04,
    .mult = 0x85,
    .div = 0x01,
    .pix_div = 0x0a,
    .mipi_div = 0x05,
};

So I'll agree the patch is correct, but it'll show up other failures
that were currently masked. I'm not fussed about the 24MHz mode, but
it sounds like there are devices using the 19.2MHz / 319.2MHz mode.

(I've also noted that the driver allows V4L2_CID_VBLANK to go down to
1, when 40 or below seem to give corrupt images for me. Implementing
set_frame_interval for a raw sensor is also wrong, particularly when
V4L2_CID_VBLANK is also implemented. I'll see if I can find some time
to patch it up).

Hope that helps.
  Dave

> The diagnosis holds on a Surface Pro 7+ (IPU6 Tiger Lake, 8086:9a19).
> ipu-bridge gives this machine the same single frequency as yours:
>
>   IPU_SENSOR_CONFIG("INT347E", 1, 319200000)
>
> and unpatched, the sensor reports
>
>   link_frequency ... value=0 (240000000)
>   pixel_rate ... value=48000000
>
> exactly the mismatch you describe.
>
> Applying the patch makes this machine worse, though, and since it carries
> Cc: stable I think that is worth resolving before it goes in.
>
> The fix does not only correct a reported value: it reprograms the PLL and
> moves the link from 480 to 638.4 Mbps.
>
>                      unpatched v6.19     + this patch
>   link_frequency     0 (240000000)       1 (319200000)
>   pixel_rate         48000000            63840000
>   PLL1 0x30b1/b3/b4  0x01 / 0x4b / 0x03  0x04 / 0x85 / 0x01
>
> The IPU6 receiver here does not hold that link. 150-frame captures of the
> 640x480 30 fps mode, counting dropped buffers from v4l2-ctl and csi2-5
> error lines from dmesg (including the "callbacks suppressed" lines):
>
>   unpatched  run 1  dropped 23   csi2 errors ~7216
>   unpatched  run 2  dropped 23   csi2 errors 13277
>   unpatched  run 3  dropped 13   csi2 errors 4722
>   patched    run 1  dropped 106  csi2 errors 120788
>   patched    run 3  stalled: 50 frames, then none for 60 s
>
> The errors are DPHY fatal error, SOT sync error, inter-frame short/long
> packet discarded and frame sync error. The frames that do arrive look
> normal, so this is the link and not the image.
>
> Two things to be honest about. This unit is not a clean baseline: even
> unpatched, mainline already logs thousands of CSI-2 errors per run at
> 30 fps, and the out-of-tree Surface driver sidesteps the whole area with
> a vts_boost parameter -- at its production VTS of 3448, 15 fps, I measure
> zero CSI-2 errors. And the sample is small: three runs each, one unit.
> What makes me report it anyway is that the one-line difference was
> consistent in every run, that it introduced hard stalls I never saw
> unpatched, and that going back to a build with only that line reverted
> gave 568 consecutive frames with zero CSI-2 errors.
>
> One hypothesis tried and failed, so you do not repeat it: the out-of-tree
> Surface driver notes that the vendor runs the 319.2 MHz PLL with the MIPI
> divider at 0x01 rather than 0x05. Building this patch with mipi_div
> changed to 0x01 in the 19_2_mhz_319_2_mhz entry was worse, not better --
> 3 frames in about four minutes. So the divider alone is not the missing
> piece. The vendor path also uses VTS 522, which I did not try.
>
> So either ipu-bridge's advertised link frequency is wrong for this SKU,
> or mainline's 319.2 MHz PLL entry needs more than the index fix to be
> usable. I have the machine for a few more days and can run whatever would
> help decide which.
>
> The rest of the series tests well here; I have replied to the cover letter
> with that.
>
> D. Manresa
>
> (Written with AI assistance, directed and reviewed by me.)
>
