Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA3380FEA
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780547887; cv=none; b=i86ijLqsZqv73AKH1h2jIk7KFczcM0bZt29HvcgH3DCMb1ahoGRo7TiOx4JxwOSwc0ClBAjBP44dwnVeIFjZeDa7HnOHS9hM/WcZoPmhHe+GEO9RUJSW8K0K4jECivvoV90QaBFwjSE4DC4ANmOC/4hJ1Vn7kt5Tt93e7L0D+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780547887; c=relaxed/simple;
	bh=Vk3KBoetC6/ZBfZ4nYj5LrVGnaFP2gpo+DKwhiFFHIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KXCUUQO27wdhOZODN6Gt5M0ZWwfr1MMdRPFOR8UzMyD0FR8dHmnAvpFl7FUEAqfFl5wU/7NPj56pkn+jx1fyoQr7K6TPHsnb2CczC5exHJhVXcysnSb6OhNElwPQksFi9YP1NhaXSCDu//0yfOyoHoHoVPGiS+alBfGlljYemGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6+4YcwY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6+4YcwY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BC51F00893;
	Thu,  4 Jun 2026 04:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780547886;
	bh=U2PHUE8iIMGkEI8omXSNHfc4r4Olr7/tKDYnRd+FRKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a6+4YcwY+qDyBsQGZ1yQliM3mjbl72b2Rp6GAa/fdSUz9aszkN6R2jhIKevvs9lGD
	 2/FvO9FS8PElp0axK3CAHI4UFgCwtyaq1DxKK9K/WIJy+u7HF7rJX7n277hS6sdn0W
	 7ulV6A3Pu5pDrXA2AFHjfWFkCx/jTOy/E6GahAu4/MrqANpD8GL6Yq3xMKVFIPInMA
	 yOu7olTs/oJk6/Jam+NxWs8FwimLI2aGUcOsCtpxaEyl9w6rWKyd8RW3Si52xnYA6o
	 vSeqR5OMzDTyfCEYIKkW3G/FXoA6+4PGF8kc9ry+tVPl4FHtVBxDgYLV8NKGY9TM9m
	 3g89GNNt3PcfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: qcom: iris: handle runtime PM resume failure in
 core deinit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hungyu Lin" <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260604042804.40899-1-dennylin0707@gmail.com>
References: <20260604042804.40899-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 04:38:05 +0000
Message-Id: <20260604043806.46BC51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Returning early when pm_runtime_resume_and_get() fails skips criti=
cal software teardown, leading to DMA memory leaks, TrustZone resource leak=
s, and state machine corruption.
--

commit 8dfed661c7987b309b6408296f5d14cf1983d0aa
Author: Hungyu Lin <dennylin0707@gmail.com>

media: qcom: iris: handle runtime PM resume failure in core deinit

This commit adds a return value check for pm_runtime_resume_and_get() in
iris_core_deinit(). If the runtime PM resume fails, it returns early to
avoid accessing hardware resources and prevent unbalanced runtime PM
references.

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index e6141012cd3dd..a1a95ef353e57 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -12,7 +12,11 @@
> =20
>  void iris_core_deinit(struct iris_core *core)
>  {
> -	pm_runtime_resume_and_get(core->dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(core->dev);
> +	if (ret)
> +		return;

[Severity: High]
Does returning early here when pm_runtime_resume_and_get() fails skip criti=
cal
software teardown?

If the early return is taken in iris_core_deinit() in
drivers/media/platform/qcom/iris/iris_core.c, the function bypasses
iris_hfi_queues_deinit(), which appears to leak the DMA memory allocated
for the interface queues. It also skips iris_fw_unload(), potentially leavi=
ng
the PAS in an authenticated state in TrustZone.

Finally, the early return fails to transition core->state to IRIS_CORE_DEIN=
IT.
During error recovery, if the state is left as IRIS_CORE_ERROR, could this
cause the subsequent iris_core_init() to fail instantly with -EINVAL,
permanently breaking the device state machine until a driver reload?

> =20
>  	mutex_lock(&core->lock);
>  	if (core->state !=3D IRIS_CORE_DEINIT) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604042804.4089=
9-1-dennylin0707@gmail.com?part=3D1
