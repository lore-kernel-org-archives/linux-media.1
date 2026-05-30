Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C512C3A8734
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780139424; cv=none; b=OfAmw9SQJHemUm+oT5MREHN5w2pj2qQiUg5C9QT8yqFENIaTim6KPldIbOPikZJCj+2LgKLj6fWoA/KUl4cmahggAHh3wmTBhV9wv8EKilyXvtpBsHikrdFl2k+f92r5PqbLn2e1OME1by0Ej0KLiNBQ8eQrStz8C0n5goQxeTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780139424; c=relaxed/simple;
	bh=tqYFsiyiOTI3wib+NAngYkKunkiI4TSEPNfrzQ7CWi8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dmme6IYYEDdZuH4vC6bYz69ntYUNuoTsA6eh+0RC2JVTmn2yrossdBLMrg/YV89a5teRhOne3/3UjpOfA1JGw7omoeOHirNmOfWZpOMLHtdomnHKELGCnZPUJw+rjpGnwQxp9NzWpAqm3SseP8G7cd3dlvZ57VFf9G5YeAY54fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3YU0GSJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3YU0GSJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6D71F00893;
	Sat, 30 May 2026 11:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780139423;
	bh=cRidFqpaHYJwIgtkoGwGJAGfQh466yyG3vrix1ctLvE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E3YU0GSJ3vEJvpjuF5qE+6zz37Ya7Iow9ybJp/xzhEmwl9kfzFYOf31VH4x+/IBoU
	 LCyEjPNSAbr76mYhj0JD2sXlb3dCj6HGrvUMuJaXwleK8NZ3UfThPxbwswAaafWV9K
	 xAtBCf/ZyajOpXzjbD7fA8pqUsOWy9b0apnb79FplU0XnAXkcSsCOAxT3ASat7NhYk
	 6PsDOE7iV/TIBKkBCusupxNMht7LI4dboY9BnLJXsTpGAdIlHH5jGtY4Z8a8teMSmO
	 DGLD2yY6ZgyCR3PSz4Xtm2YbVlV9RKfieGaFmdXVMeGAW/5lpxIscdMLQhQPyE/n0p
	 9ywOSZnbbsmZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/8] media: meson: vdec: Configure DMA mask and
 segment size in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: linux-media@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260530094326.11892-7-linux.amoon@gmail.com>
References: <20260530094326.11892-7-linux.amoon@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 11:10:22 +0000
Message-Id: <20260530111022.9C6D71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Applying a 64-bit DMA mask causes silent physical address trun=
cation and memory corruption, as the hardware and driver only support 32-bi=
t addresses.

Pre-existing issues:
- [High] The vdec driver stores a raw pointer to the `meson_canvas` device =
without linking the devices or holding a reference, leading to a Use-After-=
Free if the canvas provider unbinds.
--

commit 895ef453d9c75df04fd40367102f8eafce76e013
Author: Anand Moon <linux.amoon@gmail.com>

media: meson: vdec: Configure DMA mask and segment size in probe

The vdec probe routine did not set explicit DMA constraints, leaving the
driver dependent on platform defaults. This could cause allocation failures
or fragmented buffer handling on systems with stricter DMA limits. This
change configures a 64-bit DMA mask and sets the maximum contiguous segment
size to UINT_MAX.

Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel=
.org/

> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/me=
dia/meson/vdec/vdec.c
> index 4884ee04b3529..f99335effe176 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -1064,6 +1064,15 @@ static int vdec_probe(struct platform_device *pdev)
>  	if (IS_ERR(core->canvas))
>  		return PTR_ERR(core->canvas);

[Severity: High]
This isn't a bug introduced by this patch, but can we experience a
use-after-free here if the canvas provider unbinds?

Looking at meson_canvas_get(), the reference to the provider device is
dropped immediately before returning the internal canvas pointer:

drivers/soc/amlogic/meson-canvas.c:meson_canvas_get() {
    ...
    put_device(&canvas_pdev->dev);
    return canvas;
}

Since the vdec driver stores this pointer in core->canvas but does not
establish a device link or hold a module reference, what prevents the
canvas memory from being freed by devres while the vdec driver is still
using it?

> =20
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));

[Severity: Critical]
Will setting a 64-bit DMA mask cause silent physical address truncation?

The Meson VDEC hardware natively uses 32-bit registers for DMA addresses,
and the driver's helper functions strictly accept 32-bit values:

drivers/staging/media/meson/vdec/vdec_helpers.h:
void amvdec_write_dos(struct amvdec_core *core, u32 reg, u32 val);

If the DMA API allocates memory buffers at physical addresses above 4GB,
their 64-bit addresses will be implicitly truncated to 32 bits when passed
to the hardware registers.

Can this lead to the hardware reading or writing to incorrect physical
memory locations in the lower 4GB?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to set DMA mask\n");
> +
> +	ret =3D vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to set DMA max segment size\n");
> +
>  	of_id =3D of_match_node(vdec_dt_match, dev->of_node);
>  	core->platform =3D of_id->data;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530094326.1189=
2-1-linux.amoon@gmail.com?part=3D6
