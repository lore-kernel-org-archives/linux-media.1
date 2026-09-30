Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D060A3F6C3D
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790755743; cv=pass; b=ZYE5TZBp3qXiVbQdjFZYgoBCTUQIazlHyg3kuSGVo23DCKkc5nezEnuV0E6RCgZJU5xJppgKukHxLA5KyZ0mqy2nL+J0CUlEOQFIosNkQjrxT81Qcj/kLnobN6ewwkUFLEHbVHJqvz+lWaqrUZZ9KMXLSE8orm7zD+5snEmKf9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790755743; c=relaxed/simple;
	bh=Ua5adEZtlqnMlrIx6uIYpTDBwzg5izAaOt7YDygf/hM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MykJXjUfozzI+iM7OmSuMkCZPK/TZD9wZlMMCxHX148Fqm4CzpQibH/xqvs3kVJJpQuLR9hA6uwKhjSeN8h83VBxZANI1TYZB3DdlXwC6CwyXJMgkExGffMdMzVVe1LNQXfGqwcwKyUJhTyD9DeAENRI7XbIYLdH9lVYkOlikVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=VCaaQooW; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="VCaaQooW"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D2F9C2004B4;
	Wed, 30 Sep 2026 10:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790755732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxgZI/hrtWwdgM7IweHp++LjfA2SP+nF0BIv8kWKn3Q=;
	b=VCaaQooWO7O56/c72Q9t+9BFxHfNDdToGLv1Yh2T8S/Q9VFoHagQ5ChpHGJb3WpR62ULfZ
	krfnPLcVY/4jLoN1SJnb2cJqC4NTwnXMpNmpfRMxhknhMmX7/pzm5lR1N+sMW/Qg4M0UbT
	RdO0xNdvaRLx4x8E6/dpa6Ng/QMtt/BlPhIVlZS82o6tmA56vBXxWyV2CPQD5qEyMahSEr
	3CfgmSV2M2jUwKZPMZ9mQPTYNGKCYtfjkI9koHGcv5TlowUt0J5hBBPQOavG+2an7/sHpC
	+8GBa4umg2SeN63PXVlI01d8twFc4kwFBNlE7296agCKri0jaPbN8mHeav9+Fg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790755732; a=rsa-sha256;
	cv=none;
	b=axoTdeqA3DuRCj8V17Z039WWM/tMfozG4c6m8pRutC75paGZ2tqj9enOB5WAf04I52rZ6d
	JaP2zg/Zwv/gcAPuKyYNNmtNQBURIZaZJrKf0MVcnq9dB7BrTa7B6NslSiHmpRBTSTMZTG
	Orfg4m5GX1nlsRB+PHpbFZKE86zG2jEgUbcrioEPvK8cIH58/9dHznUoWeB9jg4ZVtQbSo
	s6e/5NZKbbndGJDINEWZ/pUB1oGIh9WNxBQpfc01qhTeyoYBPlP7g+2zNmzXIEJbHht13y
	c7Q5K3zr7swuQk7pFaS+YT+peM0k4xxzhodoCEmgDVowiBDij1aE/P871Kc0Ow==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790755732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxgZI/hrtWwdgM7IweHp++LjfA2SP+nF0BIv8kWKn3Q=;
	b=LRDjNVxW0HTruQeMUHkLcx21GgHTJ6t/wzpBiBil4eanDIFaw6cgjRWukgXSvhmx8IJ1YC
	LYS+ZwGtaccElJrxp+wPPMh9qNS8XinA6gDgDa7ECG7AxecoA3mZ11KsuVtNvTpNA8PF9H
	W7LuFzosRabXiMTb6Cx/WZuGcu0Uj+mdLUl0xkoL4hp6Eg+QF4diHx3N3zuMQ8LF7PsZmY
	OOPWQnJ4tYdrLwfpHbGcUEZoziX8RDYZ97gGMss6vG8QZa8hUDFqL923J9dUgfwdruQ6Cl
	1aBdHHaXxu1dpJ0Uenberiw2ya9Saw6hgFKgsdZTWGHhths2+/X6D8nhtS8Dkg==
Message-ID: <8f823c38ae5078e7ae1c3a004414e76bdb0dfc10.camel@pengutronix.de>
Subject: Re: [PATCH] media: coda: store context ID before error cleanup
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sang-Hoon Choi <csh0052@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
  Changyul Lee <lcy8047@gmail.com>
Date: Wed, 30 Sep 2026 10:08:52 +0200
In-Reply-To: <179075213853.3.17591166088476877916.idr-bug-26@gmail.com>
References: <179075213853.3.17591166088476877916.idr-bug-26@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mi, 2026-09-30 at 16:08 +0900, Sang-Hoon Choi wrote:
> coda_open() allocates an ID before formatting the debugfs directory
> name, but stores it in ctx->idx only after kasprintf() succeeds. If
> kasprintf() fails, the error path calls ida_free() with ctx->idx, which
> is still zero because the context was zero-initialized.
>=20
> When the allocated ID is nonzero, this releases ID 0 instead and leaves
> the allocated ID reserved.
>=20
> Store the ID in the context immediately after a successful allocation
> so every later error path releases the correct ID.
>=20
> Fixes: 649cfc2bdfee ("media: coda: fix memory corruption in case more tha=
n 32 instances are opened")
> Reported-by: Changyul Lee <lcy8047@gmail.com>
> Link: https://github.com/lcy8047/radix-tree-bug-temp/blob/main/bug_list/i=
dr-ida-xarray/premature-id-release/IDR-BUG-26-coda-release.md
> Assisted-by: Sang-Hoon Choi <csh0052@gmail.com>
> Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
> ---
> Compile-tested on x86_64 with allmodconfig and W=3D1 against mainline
> 6f8319e3e9a44dd537d17f41565a8453c560a581. No hardware runtime or fault
> injection test was performed.
>=20
>  drivers/media/platform/chips-media/coda/coda-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-common.c
> index be37ea568bfe..06b165c556f9 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c
> @@ -2617,6 +2617,7 @@ static int coda_open(struct file *file)
>  		ret =3D idx;
>  		goto err_coda_max;
>  	}
> +	ctx->idx =3D idx;
> =20
>  	name =3D kasprintf(GFP_KERNEL, "context%d", idx);
>  	if (!name) {
> @@ -2640,7 +2641,6 @@ static int coda_open(struct file *file)
>  	v4l2_fh_init(&ctx->fh, video_devdata(file));
>  	v4l2_fh_add(&ctx->fh, file);
>  	ctx->dev =3D dev;
> -	ctx->idx =3D idx;
> =20
>  	coda_dbg(1, ctx, "open instance (%p)\n", ctx);
>=20

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
