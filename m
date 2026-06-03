Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5706339B4BB
	for <linux-media@vger.kernel.org>; Wed,  3 Jun 2026 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470883; cv=none; b=He5ziibbwwcpnwtVEOvxJSzAUwyvP4EG0dFx3ckMO5lA5fhRgj4eSUYDNBZalsJiCFtrwJ3jJns4T+t3eonae32lWZJ2VnnFE+DVZ/YahL9A5fdljDqxH4JG0VSb1Y4xs+zM6lCpF3jxSsiVYFOHRcovzrcG3lax9/me0EJTpQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470883; c=relaxed/simple;
	bh=VV38plcIiV8vFJZ/Rr+Qzopz2lBGeQTN39/f3QYjxpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j1DXnOb9Ic3CNP6OG2f09jzWAl3GgCpI1rq/E9nZbtI6vKqxlsm7yqgKWDqSVmfZ8aVXxFevG4jct/TdNiOPibIBulvCebEaEpzrbO42/By6e+rljfF48lRxl7GYmna5IreNV1YpO7DXBZOAnGkBFm8YM5oNLKdHgXkLG6GhgJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBpLq34l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBpLq34l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4B01F00893;
	Wed,  3 Jun 2026 07:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470881;
	bh=G5NXo18arKeA/7hNeyGmXhxRxD3wh86ykUY5nrpGFHI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aBpLq34lVIZ+HzNgiud/rBzwFr/TUyH7gFBD0OGenRRCSGkGxK+CRiAfPu4l1ah4C
	 Txr83/0V4eAsO8uI0vajQxlZWZ6g3y9X5ct2OMn6zHmpI6JeUzsuIRgUmP/reMPuzp
	 qlco6wRbpmoEHxmXiiv7AK40jSvnTimv9rBoUOxMK//xKTfFyFZAhoF1zuQQLNZq9e
	 VfBQmPzgda5swuaWmIW7ot/Vz2ZVBKT/yZt1vBfjVIk3+uRqqpkqhRMkPhySPdvfVP
	 c/KGNk8TjtFde8/P0MDmme8an7dby+FcLQkSZ2dzujC/J6IlnpXuqVbXMg6tgptyJY
	 WbAZuFLNW917w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 02/12] media: microchip-isc: fix WB offset and gain
 register field masking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Balakrishnan Sambath" <balakrishnan.s@microchip.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260603-microchip-isc-fixes-v6-2-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-2-8c3d7474a768@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:14:40 +0000
Message-Id: <20260603071441.5B4B01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsafe hardware register access and data race in AWB control handl=
er
--

commit d6eb051b7d19bbd8b11d5cebc7ab4ed5ebef07c8
Author: Balakrishnan Sambath <balakrishnan.s@microchip.com>

media: microchip-isc: fix WB offset and gain register field masking

ISC_WB_O_* and ISC_WB_G_* pack two 13-bit fields per register. Sign
extension from negative offsets corrupts the upper field. Mask both
fields to 13 bits before packing.

> diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driv=
ers/media/platform/microchip/microchip-isc-base.c
> index a7cdc743fda71..45b94f1e89d86 100644
> --- a/drivers/media/platform/microchip/microchip-isc-base.c
> +++ b/drivers/media/platform/microchip/microchip-isc-base.c
> @@ -61,18 +61,23 @@ static inline void isc_update_awb_ctrls(struct isc_de=
vice *isc)
> =20
>  	/* In here we set our actual hw pipeline config */
> =20
> +	/*
> +	 * Mask offset fields to 13 bits. Sign extension of negative s32
> +	 * values would otherwise corrupt the adjacent field.
> +	 */
>  	regmap_write(isc->regmap, ISC_WB_O_RGR,
> -		     ((ctrls->offset[ISC_HIS_CFG_MODE_R])) |
> -		     ((ctrls->offset[ISC_HIS_CFG_MODE_GR]) << 16));
> +		     ((u32)ctrls->offset[ISC_HIS_CFG_MODE_R] & GENMASK(12, 0)) |
> +		     (((u32)ctrls->offset[ISC_HIS_CFG_MODE_GR] & GENMASK(12, 0)) << 16=
));
>  	regmap_write(isc->regmap, ISC_WB_O_BGB,
> -		     ((ctrls->offset[ISC_HIS_CFG_MODE_B])) |
> -		     ((ctrls->offset[ISC_HIS_CFG_MODE_GB]) << 16));
> +		     ((u32)ctrls->offset[ISC_HIS_CFG_MODE_B] & GENMASK(12, 0)) |
> +		     (((u32)ctrls->offset[ISC_HIS_CFG_MODE_GB] & GENMASK(12, 0)) << 16=
));
> +	/* Gains are 13-bit unsigned fields [12:0] and [28:16] */
>  	regmap_write(isc->regmap, ISC_WB_G_RGR,
> -		     ctrls->gain[ISC_HIS_CFG_MODE_R] |
> -		     (ctrls->gain[ISC_HIS_CFG_MODE_GR] << 16));
> +		     (ctrls->gain[ISC_HIS_CFG_MODE_R] & GENMASK(12, 0)) |
> +		     ((ctrls->gain[ISC_HIS_CFG_MODE_GR] & GENMASK(12, 0)) << 16));
>  	regmap_write(isc->regmap, ISC_WB_G_BGB,
> -		     ctrls->gain[ISC_HIS_CFG_MODE_B] |
> -		     (ctrls->gain[ISC_HIS_CFG_MODE_GB] << 16));
> +		     (ctrls->gain[ISC_HIS_CFG_MODE_B] & GENMASK(12, 0)) |
> +		     ((ctrls->gain[ISC_HIS_CFG_MODE_GB] & GENMASK(12, 0)) << 16));
>  }

[Severity: High]
This isn't a bug introduced by this patch, but looking at how this function
is called, can this cause a bus fault if the device is suspended?

When userspace modifies an AWB control, isc_s_awb_ctrl() is executed and
calls isc_update_awb_ctrls() unconditionally:

drivers/media/platform/microchip/microchip-isc-base.c:isc_s_awb_ctrl() {
        ...
        if (ctrl->cluster[ISC_CTRL_GB_OFF]->is_new)
                ctrls->offset[ISC_HIS_CFG_MODE_GB] =3D isc->gb_off_ctrl->va=
l;

        isc_update_awb_ctrls(isc);

        mutex_lock(&isc->awb_mutex);
        ...
}

This happens outside of any vb2_is_streaming() check and without pm runtime
protection like pm_runtime_resume_and_get(), which means we might access
MMIO registers while the AHB clock is disabled.

Additionally, this call is made without holding the awb_lock. Does this
create a data race with isc_awb_work() that would allow concurrent register
updates to tear the hardware pipeline configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-microchip-=
isc-fixes-v6-0-8c3d7474a768@microchip.com?part=3D2
