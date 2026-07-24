Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2605F3E8C56
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 12:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784897055; cv=pass; b=gT2ghAdinBVTLP7MbTN2BgL+/ZT8oWeVE3SjlyELVYGST71kCr0bTsCjaOMgRrkcQPjV2gMEy3rXV7Z2WxYxNCoZQ9QpXLZ4oqrc0PiiHpkmaFrEuIlSkhhVsbVcR5tiafenoK2UH/0rtZM8hLdhCMRvL/K9YgrcR2RT038g7lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784897055; c=relaxed/simple;
	bh=E5JHc8HLuoo7DhyKVoM/oTbX8SZtTMnPKN+K2+UHJEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rULb6eck0dJuWs/jB+Dhn866tHwQvX3p7p94J7EhRpJ8kvBu3fRAti/qw+RxRZ4EuGH0G44vAgpBayd29Y3933iQtpo5yILYwTenDeKIxNZb/jRoFRgEfm3ZRRkfzgVCLCpg3/AhP91w1/wHAwsfiH/uRpxMwM14b4dKSxuCp2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gr44gRZ2; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gr44gRZ2"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e7c6ec9dbso26010985a.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 05:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784897053; cv=none;
        d=google.com; s=arc-20260327;
        b=R9kDvtrA42zi3pQ4meTrdFryS7Wj0c/IOo1841XFjatPvpttl9uwFaKxew0Ee8uDEb
         qy0gmL3L17yUXxEXM05GEJR//r4voZzBUn9Xc5kuXc6UKnmKwRO5Z9IA2k67nOmh+xBf
         qCwXvsj/9KUV5e9cmTSIzfj/TDmjwZK+L8q92RplKBmjKPOaeptEN4E7x0TgLWWrT/9j
         Fp6luLU9MHcA00wyqKOT8LXk/nXruMZIo+hFVZ99fovLyRzfGe3kgHmu9nAajsqx48Ps
         WTn004Jew1Mqb1A7IdYpToWi8w6LuYYHl7UkT9qVuxzXJzQsNRDHq2mMsqSHckUCJOWq
         5t4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        fh=4OlWBH0T5yFN9wIQ4cPFHV6PfPZLq7YHU7aRDh8RH2s=;
        b=nFzMyv+vdmWaf3zlr6hpyzSxhFRG4y3MD2A0Jscqw2wiL3Lm2IFvJq2bT9otPazrvW
         dmavTVOTXwQdGDyyzKhxTe5PW7ISsF+YsE+qSMDmW3bIy41wvK3JYGm0ExppG72TvC7k
         n52kHFZoAymXyhZBz0auHmjyKpsfyf79+utpmepQAvuwYK2NfPYIh4T13IWrs+uSujLf
         9MG0Cco8PQi9zptrBgH5s08yY0S94Sdi1DOHKx+3qffVUwlKGOlqRtVXDCqtQmo+8h7o
         6pyrdnMHTDnsfC6HICB7508Z7v5me9CdjPK4o63WgtqdL1IVk7BlHAIGx2WrLCqCH5TG
         l5NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784897053; x=1785501853; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        b=gr44gRZ2OGBFeO6t1eNpYReLN5M4U5Xw1uc3O7siESuKX3HeLHUI0bqL+XU5wsY4Yx
         T6xk3BtvWHZUrqRFkrsfhawqzh3cI+gaOlzgI5pNRYA7AtG5DGsIv1nlBuLoCE3HL9KS
         QJsWoE7A1wbKhvrEaU7bm0sKttZ9cMl88tGiNcLRxqzTgO268rT3G6TpKruVgqbv9P2A
         QoSwY7UUaQGZLKmUCsImWEnSRU5CX1SS6PuDG+ATdgh1hsAjbVsxFXNw2944erxif/HL
         DgyM1xoUhIJkG7gzexSIe9kPS9o/lNfxml0aREmDI319oxmPgiGaD3RWEzCflJ8N2yyw
         wvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784897053; x=1785501853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aC2psv7ALiBxeuXZI5bTG7C7BxKxDQncU75RPTVHyag=;
        b=IuQxeV+2KmCvX26lh6Eot/d2DaFhuqoSZCjFGLKRNxNk5ULpBvUWYMsuTvfAYqHW4M
         JZo9H7p6/CxcYyD/373miz5wXbxhzoxgwAQQ/iXQT8EhzJ224fFkTMutO+SB2pjUKEsL
         qxiMZeH4CiqKCMhcdLkbBIXUF54+yzEzLNguceyxVDcrE+pCDtBDRcm4oFLrjiJJOtNi
         6itK5yS9+fzUvLfKpcu/cT7JjQf9YY+HZxb5hBUtYABNVHGd1u81GRar3lZDpcxzaymq
         Cden6YM7heKk9PQQ7+LjRASFQvnH9uGIRJeUk1hPhL+JejJoHELmiRLC9Wm+2gcJhaoG
         HtXA==
X-Forwarded-Encrypted: i=1; AHgh+RqEszQtfzWD3UpqEwMXWaEQl+zLQqz7Rix+gytLaPLeTMk8VZjVFybczB2E5+in66x9zxCMJSH07PIQWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YydnKAgpaZt4DqLXgPo6+sKwtpfkEIVy7NlwkRn6sX1WK0rcwNV
	J8hSPFcq3KCSsFeGNPH3XacIu+8z7/Ugdi3ES4zocHFPNYh5pMfJTORvKKX09CwIsle+R11wt8v
	4DC/7FIKacZGnL+rnWJOi79EttGIXQ9k=
X-Gm-Gg: AR+sD12zdv9BVSXJ8ubVbFwbjzrOqor/GeiQGvZSZUtd2ltQgAHyzx1L3iskcyQtZ7S
	DYawa2+87t2Yek5qSmAY3LtdVvYUIeGsBt4ITlqW3ydml0Kp5ktZUYVCnrigAlcbSxsqav2Xi5S
	GgF2lCO7sYXdXc3XjS8P+UmdUp0epwhl7klF+X/NNdu0mdXtupogO21opL6GO6QYM0+AHbOkww7
	VsYVts/jC/IXLoVUv7MoAkfMp+JMETke75xj/1ZcwQR3wTdb/7iL2RI8E2BJRUMoDPqR4HZYF6a
	3WWUhv9detjKAZxMYpPaotyXIC0MTM/iAaYyyoa0Ah5kVEmTXHyB
X-Received: by 2002:a05:620a:6cca:b0:92e:cac7:96fc with SMTP id
 af79cd13be357-9310388efd2mr749905085a.24.1784897052712; Fri, 24 Jul 2026
 05:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724111548.2109-1-tharitt97@gmail.com> <193a0d2b4f7c33163cb6aee56ceee0bf5cb6c11c.camel@pengutronix.de>
In-Reply-To: <193a0d2b4f7c33163cb6aee56ceee0bf5cb6c11c.camel@pengutronix.de>
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
Date: Fri, 24 Jul 2026 19:44:00 +0700
X-Gm-Features: AUfX_mxLzK4lEzDdIm63lfvgUd6SAd7_Ys3EmQdE2d3UhBcu1j4jPRBGqdfCOww
Message-ID: <CACak8wN-Y=oDbEVbou+RetS9X-Lca_MZHSY2NJFaGWR3LoVBKQ@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: release runtime resources when device_run fails
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Hans Verkuil <hverkuil@kernel.org>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
	me@brighamcampbell.com, jkoolstra@xs4all.nl
Content-Type: text/plain; charset="UTF-8"

> But right below this, you are still letting
>
>         if (ctx->codec_ops->run(ctx))
>                 goto err_cancel_job;
>
> without disabling the clocks.
>
> >
> > @@ -191,8 +192,12 @@ static void device_run(void *priv)
> >
> >       return;
> >
> > +err_disable_clock:
> > +     clk_bulk_disable(vpu->variant->num_clocks, ctx->dev->clocks);
>
> You have added vpu = ctx->dev, why not use vpu->clocks as second
> parameter?
>
> > +err_pm_put_autosuspend:
> > +     pm_runtime_put_autosuspend(vpu->dev);
> >  err_cancel_job:
> > -     hantro_job_finish_no_pm(ctx->dev, ctx, VB2_BUF_STATE_ERROR);
> > +     hantro_job_finish_no_pm(vpu, ctx, VB2_BUF_STATE_ERROR);
>
> Why are you changing ctx->dev to vpu here, but not in the other
> function calls in device_run(), e.g. pm_runtime_resume_and_get() and
> clk_bulk_enable() above?
>
> regards
> Philipp

Hi Philipp,

This is embarrassing. I did notice this, made a local change and
forgot to re-run git add.
I will fix this asap and send a v2.

Best,
Tharit
