Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794046581;
	b=TCLFwYYUk+WUl94fz4nog5o0CyG6HhdNekUh+RYLL5KXNCdnGJlZVZzCevwLRV06cK38
	 SFEXPy4lJ0nMpsV/Bn5w1Sv8MiW4iTqn9AsYbNIWvDbdu33oNglc+d9Ytj0khFO/5v17c
	 8uV9F66SKHnDiWhNMfRchmcZTo4RVsoH4UsJG2TX+9lmU/mjMSPwY4ETtFPPyVC2sig0o
	 O6c4mMT536bjk8MOGnPccMfSZCi+EPOCst3XjOfpBN/9AhKoIFenuyqdsl199sCZ2RY0X
	 nqwq19Ag5bM1U8EdGWI3M6W9ZRO8ez4+8gFEAgLy26BgosIauNCQB+rFJsOraNA0Nww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
	b=of1HyqbgTUDnVsiF7ayfeAPwz4tBAez654u2rIS7Q7gX/KsAQpktln/OAjdP7q34DjN0
	 KfWrxeUcVbPAEW3hLXuoxm3zKpuhaRgsP0dZ806WRMejI/l6920OtK9JGeDLOfSp8nsaN
	 0EzjtaAMZWi5NwkYjW76K0EOl5HRPg1DeH8TdDKmpQZyxM8d0mDNHPBj+lM2uGSdf2vxY
	 5cfYzf/DNLzeZTMICoidgy0PIisyPMNPsyBGW7QeLo9V8pQ94KrepDCefNGWtFqcouu1J
	 o9828F+BPgdEJdoCy20HSUBfuEQ9tA9h4TuLulU4+auTC0oU/9+g2WxXaNpPoIXRtcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/rgyOv7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD36606A32C
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 10:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD36606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/rgyOv7
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b306bbff8eso10976717b3.3
        for <linux-media@vger.kernel.org>; Sat, 07 Nov 2026 02:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794046580; cv=none;
        d=google.com; s=arc-20260327;
        b=WILAgLbXgeTJ9MzIfVye8xWB+L4uSorNZq0LdBKzGZ5OTg2LRLQDELLvczS92m+0nq
         T6idqq7IYgxM9EyAuYrTiNBI9YgLIfbXKs6D/G0iHkhmoQwpf+JhF97m1JaKj/DFqd+B
         W2nx+8/AoqWsD1V8ZUfy/Id3JQ9TvCSlml0LuVU/jNUC2Y5DedpaJwSv1fOnHCNQPzOx
         otgle9cO4+xorz47lrmrIopU3twM2d07I4Wcsg1iN4zKmISMihaebKDqGRuPBPnZqc6r
         UphyitO4sqhvjFOUjJLF6/QLH4lsYDc/1UipUb0IOQ+qg0ysw9kCsXPKO7JatO4+pjmu
         /0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        fh=ICanc37Z5yQsx9YjZOuPVeVjn0VnGXutNBWHjRIdTdE=;
        b=AiGkBP97Eq8VRVStF0f2sMaAXm7INAajymWU/3QP+fPp4DlQHgQ+ks5lsPM9TIl0W2
         /Rp/A+IckHz4mTn8c6OIdNCeSMeBEyixJ5Oi2ji6qLUEwOw2EeXeKO6zPMXmhg5vyD2/
         436znVXn4VtCJVxfOXzD77A6T+QQoKS/lBrwCXrD0QSP29v8OPPww5uzoa8Ft/wRVmjB
         ed3R/ffy5j+hnP2grBZmVlupYcq4AqlifxHhmQn2kYjozCKYRzRMWYimKKqUj1YAItAh
         Yxio91/GMIDtDUp0quospj/Zw1/tpDPZN4qC/XYhpn7NtZYpzd+o4LBVn74K72tvxlyT
         nt1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046580; x=1794651380; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        b=e/rgyOv7rFiYubkj7ia7wUAH1Z/153ARimvVm4yKP14CRR4nDhDwUiuERCKRbOd4zE
         ZDmWtn+b+vAz4ylq9BL86ZLvtJsnHGFYTKqbzvRwLr0u0CT45W5JVwBVAtlY8SvjI6Sj
         ZCt2mKMEFw8eApyfRFoYGDQAkuIq2Kvt/qzHBVOUmAN0+FYUYKcMY+Xs6rfib1+avwqF
         NHBlDuncErFAUgaR+ncJJ+BqJ2kAo+yXSNTWwWp9MxbZqF/jai/m0mxDrXcvvgiK9i0H
         7iMyc8db+tR1Eph9yeb3ysIu0bxF7SPlvDmWEyZTq+oW7BSb6UeAdurq756pHTKp2KKY
         Xpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046580; x=1794651380;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Txc3E1PcXQlFNp7c7FiKp/5yHJpupSAoBNaMzkRlDf0=;
        b=GFGilWw8vo03Kg6cbq2MxetNEStpjhFxTzmBtO34sC5x2q4CHYdBnVtpY+CP8+Yynu
         6CBrme2JttSKNluOfqf881IYbQTGw1EG9kRnL4cS16H2mwQtURmdwoMUDV8KhasaWIHU
         KaEwhJmmE96Q/5lvOXx6ag8AtaxVXRpMv1GiAqb5bw5HwKiAaKEGQvHQXbVXwp5aB9LO
         5190Owow7BdPT+TTvlRZ8+/S1bk+FMKB9hIIKXLafKZdUBbRWvpqunMtSEEKtVfQoWYc
         n7FMJdNxPYFYX0vLDWm//Hiq16pXvqgUs6SysoP16pszO0l+woZJ9RMz6VGSa7WBDBQi
         3k3A==
X-Forwarded-Encrypted: i=1; AL+hErFLz0mJVkUvkG3WGXX6srXw1b5fdaJXaIlxGgm2+jNpboSzvEXS/a4GrQZFo2+HXCkbbcBOGhvMy0davg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wuQT1IQ4MFvbnXFXypayIhiPmr8zO0l1BvhwXOh6fqXnurVqC
	eevWkwV8aF0gUwDl9HozNapKnmmp5No/1PzlwO5NSL5gezcGNuiac0pqUyEG76GjjS1UBIkcUyE
	+4bWHPUY/nNUvS4rNjJrnVEiBYuf8fqw=
X-Gm-Gg: AYBFou0vSrrqO39pPTlNdS3Z8u3bRe6tFB3NNxc81DkYNopLODxGIj8EBH0iY6m5AKo
	VBolrlbX550LVN7j2+yX4JvHPYKW19j5moaWjgj+/bLm3Tui+SqASW/O+ixKCMyfGceMAaLZ+IG
	hTdillwlgNKVtaYj1NlqNBpw2gCZa0QJ9auTd7UmZuhhsuzwTxdtR0YuKB6n4HrRayxYHJioBzF
	uxV2BwRlck0C+h6ng1dKhf7P2tccg8j6miCrAcpfGpgSNwxqt8cwLCJgERZ4vUv4yiSVvXgVrwd
	jmJm+IPwppeA5umDm4yTfQ169icdVYgYBs+sGUPEKT7ldA2e/RJW3sKI5H8cOPg1aagBJz5j7o1
	JpsqmHP4Edi4cxGUxZEqJDD5EpxE94YVjwl3NpBbmxgGphn30lg7DCKWJddY=
X-Received: by 2002:a05:690c:289:b0:8b0:a252:77c6 with SMTP id
 00721157ae682-8b3418dfee1mr22332297b3.19.1794046579785; Sat, 07 Nov 2026
 02:16:19 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-hantro-remove-v1-1-d0a4678886d7@gmail.com> <0597b71f39fd945d531d3e996d982d5d3a3b9a28.camel@collabora.com>
In-Reply-To: <0597b71f39fd945d531d3e996d982d5d3a3b9a28.camel@collabora.com>
From: Sergei Khomenkov <shomenkow@gmail.com>
Date: Sat, 7 Nov 2026 12:16:08 +0200
X-Gm-Features: AclHuK8U4hp329_sClLRJdwqt0M9udYoGIyX3Gq2TqxXtvVHZa2zNAR132StXO0
Message-ID: <CADxDoMSrwDQfFD-VejUvh3shpo6BKjFWMzXUtsoK=t7=AhPATg@mail.gmail.com>
Subject: Re: [PATCH] media: verisilicon: suspend the device before
 unregistering it on remove
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Frank Li <Frank.Li@nxp.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nicolas,

> To be verified, but its not entirely logical here. My impression was that you
> want to unregister the dev entry sooner, so that it prevent newly open, and turn
> existing fh into a mode where all ioctl will fail.

That part stays first. media_device_unregister() and
hantro_remove_{dec,enc}_func() still run at the top of hantro_remove().
The patch only moves v4l2_device_unregister() and clk_bulk_unprepare()
below the runtime PM calls. v4l2_device_unregister() touches no node
here: it clears the driver data, which equals &vpu->v4l2_dev (the first
member of struct hantro_dev), and drops the device reference.

> Can you do some extra code inspection and report why you strictly need to modify
> the clock states before you unregister the device?

hantro_runtime_suspend() reads the driver data, and with power/control
at "auto" and the default 100 ms autosuspend delay remove() calls it.
The driver core resumes the device before remove(), and its put only
arms the autosuspend timer. So pm_runtime_dont_use_autosuspend()
suspends the device synchronously, the path in the 8e26d4c20ed2 trace.
With the current order the driver data is NULL by then: an unbind or
module unload oopses, after clk_bulk_unprepare() has warned
"Unpreparing enabled". (My reading of the code: with autosuspend_delay_ms
at 0 the device is already suspended when remove() runs; I did not test
that case.)

So two things are strict: runtime PM stopped before
v4l2_device_unregister(), and the clocks disabled before
clk_bulk_unprepare(). The new clk_bulk_disable() does not use the driver
data, so it only has to come before the unprepare.

I suspend through the PM core, not by hand, so that the runtime suspend,
with any genpd power-off, still runs before reset_control_assert(), as
8e26d4c20ed2 wants. I could only test on RK3026, whose VPU has no power
domain, resets or IOMMU. A run on RK3588 or i.MX8M would help.

> p.s. are you sure outside of test build, that PM can be disabled on any of the
> platform hantro driver runs ?

If you mean CONFIG_PM=n: not on Rockchip or i.MX8M, which select PM. On
sunxi, AT91 and STM32 PM is only a default (SUSPEND=y selects PM_SLEEP),
so it can be turned off, but then the driver never enables its clocks:
only hantro_runtime_resume() does. The IS_ENABLED(CONFIG_PM) test is for
such builds and COMPILE_TEST. There pm_runtime_status_suspended()
returns false, so unbind would disable clocks that were never enabled
and hit the "already disabled" WARN. I can drop it if you prefer.

The block itself is for runtime PM forbidden through sysfs
(power/control set to "on"), which root or a udev rule can do on any
platform. Then nothing suspends the device, and it is still active after
pm_runtime_disable(). I tested that case on the board. cedrus and
mali-c55 (2c9b9bcc2569) power off by hand in remove() the same way.

Thanks,
Sergei
