Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C4403B11
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 10:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408475; cv=pass; b=BbacNQ6Inmz/9ONo3U8R/tzjoXqCZOnCBeEP0QMMrmYEnUjmoFd/YPT9MO1jMvAscoL98WFBe9Kr3Wxd3wm+HuSQ1ubJeyWmqTM1MchGxINHYcSn6pXlbYQuOR9LEz2qfEuG6yHYDEfWtLzd5GheWuZoMl6qFFwK4SDsAnZFW7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408475; c=relaxed/simple;
	bh=QWHUlfXnzDKC4Rqmu9EtejXt1Ib7/6596iuWwy2rcFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f5fTivEcdrXFSe9fTBJKW13SPE/bYNoPF/NkF+K34KejWQ5fXGvbu/UHb2RGkCZp07VWSBDWfgGuK4B1krsb4E6+mqLKo4+ro4s/TLrF9wgUhCmGfvUH1kWfUlJG0GjTgsC03ONKN5XPkeQIZmRJVLfJ9uOEBolOGby/9NPmNOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6nwxVFc; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6nwxVFc"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-80cebd41372so29858057b3.3
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 03:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785408473; cv=none;
        d=google.com; s=arc-20260327;
        b=H+FWPaZD5mWt319+4dzjnI3UnG9AAYxgRSECS/zC3LTdMV5RotQB/t3Ht8OxSjpLfD
         OUNq+YTtDTWSd5wu6ls+ATCLXjafEiU39nlgvH6SljI1ute3D7lORMiBRK0IZFsHJTQr
         c6B+OHMOgakfjTwU5GUMFDXqcwRvl9sQFFKQOzVM9VMUrCW9jGmnpNXPpT/BxITMfU3v
         40UQK0P4BzJHktGRrNwhIJlVsSQSSk693rO8uU+IqwOD4Hx01pX5fG1vb3OGnQ6JOdGJ
         budaPBN/4/mcSUfcvXSE4dtY1iE602dVbI1IdS4LbBV2/9MWVi5gpw1oZG/f86NnRNwm
         hWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QWHUlfXnzDKC4Rqmu9EtejXt1Ib7/6596iuWwy2rcFs=;
        fh=xD0fezrCxD9R5oKokNibCB4QPLWer4VTWkd7mHJXMi8=;
        b=JMwAklPcepzHMyiGHNVR0CQ29D8n8rSZNyFQ+g4J7leZpzsbI/56nIzVjjNyc273ob
         OGx3LNoo44KVYCXnXSlP7zXtGvejoNowFod7ml7oJViYXY8pRFSdlP1Ewk72bH40gck+
         Xd04COulw5LLi1e03UjZtxyqKNx0q4GQuuv8eOIFGQmjl8r0ofz+xT0qrJZRpMwAQ10I
         15RRN95A1CFUbXv88a91s/XlM49x3NOy5cuPkNTLimUoUBoa4PeipqF4wBUj9plZCWH2
         8qftL99OxyV+Zd4XIOk3eAUqUIsZPpqOsFGUvtTrZqwxX9riEcAeOAAX/hhfWnhRazJg
         mZYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785408473; x=1786013273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QWHUlfXnzDKC4Rqmu9EtejXt1Ib7/6596iuWwy2rcFs=;
        b=i6nwxVFcs8hcMlD7ZP9nfVHmbVS81E1CeapOg1F2erTHIkWAsCfKxCL0mHSqPoaTtI
         qBxsbggh6plVnzNfOd8fRQ/b9vQfaoNWNQYPjIUxAw0ZJhLgIK5xtIkwLXCziteAP/z1
         ragEiyhsgR4JnMODkv8+AIPpZsh0HilzezZmY+5bGWqDaq6YHvBG2vE+J/MPUXtdUyeu
         E4l1aV1W0buopw8/rI2ajGbp6Up5VbSxCzPsRfkldkwGfY//lOJQIwOFQ3CdlwhR7+0r
         gH1QFj1svX4XKVsEMq2/+NysfK1d1c3m37RxeM47hI8I6sqpVW8b1gRud3sjdpVYDaKc
         2nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408473; x=1786013273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWHUlfXnzDKC4Rqmu9EtejXt1Ib7/6596iuWwy2rcFs=;
        b=bq49zFwEXGH99za4kr6PFSL55cJQUQyB7Nm5h9iZUMI/Em8o6cfGrkVwNqvVITA43e
         cPFIesWvxZefHKzl68aFn13z10W+g74cFrOjzPPaqDEQ1yhgPsa2qShMYO/8TYQTiBgK
         FTlU8Zt9VsoG43h0iw2Umo1hG4AftUnv4nCU7q73mSyT+hOJ/3ZORlr8HKd7tfdOmomd
         TLQrmeG84GShF2nseclXR/hCMuUKQ1Nuvn+Uynq588oxV7VbNBicVURmEz2PJ0EyA0Ke
         RFnTd4i+zgJ7iDBrO5NEcJZkgndfiBYx2pfwbQIF0c8xVAz9TIZkQTuafpgly3VD72Ud
         2guQ==
X-Forwarded-Encrypted: i=1; AHgh+RrC70xtj6a1QuC+Q2ENY8aABGUBFzcdPcsh2tLcg9JwB+DylqRX6Nxwj5SNfgR1V6rvivmZL8kZJq6ECQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUTpWZVEmyp8oSsfTaT9loKAVLhfElEb4UQDIn5cZvzykBkmj6
	PyCOru6ir3kiGKAWkRu9cmIbEXgTFpS0Zk/IcYi68S4TzNPrpt9gCdBjxwlCuK7A/ER+XrjEvoq
	jQt38rVkSBw0hKESHikLQQ8J7/OGK0/Y=
X-Gm-Gg: AR+sD11YTwdk39fLwRVDcBZaobJNCQhjpMHGI30xiuuFmM+OsmkHiZsGBkMH0meUSDY
	99VeJ2F8YACNluyxrQkPEpFSpNqr8ZcqE23X0gSIAQc7zwpIhV3HbMiV9Xv/ctTw2JsQ50pvEqx
	FfB4vd1KM3hyiD52uQt0b7jzryKagJacL/6nfEFxp0Z+vzPBXR4Hwsp1Pe/zOSr4Gq4HsjjjbjM
	THHMUyRhGw44H30+Lvo1DVxwKWE0MGjFwhVufJPsxgTzgIzMJVnM091Xi3d/L0apv7fqF2yZhl9
	z9rwqmuMn51xO3/PuhgvmH90KdoWDRyFo9DyCShYWQnl2KUtHtRaZjjexBT0OXeNGTjioEaUK3p
	BJw==
X-Received: by 2002:a05:690c:650b:b0:81e:d792:a019 with SMTP id
 00721157ae682-81fb8956a93mr12118247b3.6.1785408472874; Thu, 30 Jul 2026
 03:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727112239.812159-1-congnt264@gmail.com> <amjkCL_nSJk6VRSL@kekkonen.localdomain>
In-Reply-To: <amjkCL_nSJk6VRSL@kekkonen.localdomain>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Thu, 30 Jul 2026 17:47:40 +0700
X-Gm-Features: AUfX_mwwFt2EUDelZdyCyCIVnc_Pld_oIBKNyCCIjfjES1prCoawe-ms2lIKKYs
Message-ID: <CAJpJ=Gt3wjc9oAUKA-r=4XxjgiB6cPnBGBbsopnSCJ357qcgyg@mail.gmail.com>
Subject: Re: [PATCH] media: staging/ipu7: fix async notifier leak on init error
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch, thanks. You're right: isys_register_devices() registers the
notifier via isys_notifier_init(), and if isys_fw_log_init() later fails,
out_cleanup only calls isys_unregister_devices(), which never unregisters
or cleans up the notifier. The remove path already does this correctly
(isys_notifier_cleanup() followed by isys_unregister_devices()).

As it's a distinct, pre-existing bug I've sent it as a separate patch
rather than folding it into this one:
https://lore.kernel.org/linux-staging/20260730103754.1480367-1-congnt264@gm=
ail.com/

I kept this patch (the init-error leak fix) unchanged.


On Wed, Jul 29, 2026 at 12:17=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Cong,
>
> Thanks for the patch.
>
> On Mon, Jul 27, 2026 at 06:22:39PM +0700, Cong Nguyen wrote:
> > isys_notifier_init() initialises a v4l2 async notifier and then, for
> > each CSI-2 port, adds a remote sensor subdev to the notifier's
> > waiting_list via v4l2_async_nf_add_fwnode_remote(), which allocates a
> > sensor_async_sd descriptor and takes a fwnode reference.
> >
> > If parsing or adding a later port fails, the code jumps to the
> > "err_parse" label, which only drops the current endpoint fwnode
> > reference and returns, without calling v4l2_async_nf_cleanup(). Any
> > descriptors already added to the notifier for earlier ports are
> > therefore leaked, and the caller's error path does not clean up the
> > notifier either.
> >
> > Call v4l2_async_nf_cleanup() on the error path, matching the cleanup
> > already performed when v4l2_async_nf_register() fails. This is safe as
> > the notifier is always initialised before the loop is entered.
> >
> > Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device=
 driver")
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
>
> The patch is fine, but there's another issue there, see
> <URL:https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/me=
ssage/G5DTPKTRTWM5PBTFQJP2HI7T324FZF5D/>.
>
> Feel free to post a patch for that, too.
>
> --
> Kind regards,
>
> Sakari Ailus
