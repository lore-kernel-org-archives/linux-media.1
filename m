Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6D8374722;
	Fri, 29 May 2026 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780091329; cv=none; b=A3+zAZeORRkw4t6EHIqP8b1/Sm/m9llxu4YVAZchLL6fUAcGhbNl6ZTQh9tm0KaL7FcmJ7D4jkTWXet0SB0kOvJQ4HtxU1MMkXO2qeftZLMJ6FLAiq0E/nySVO2X4/gYeL68jMbeO/lYre6HKBcVmlsjnWHhv+AMvVWeNMnbFlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780091329; c=relaxed/simple;
	bh=a/S4RbpuGnYphkTlF0GnyYfumwJ+3KLmGoNSdH9MGio=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZS+nMO/vQX2MFrKaXU+LCrwr5DbmrV0xhL/wwzGJejuaItDxAa1IoG1F4sJ7eytiNkIJNgCs+toIANfSBYujFc8OoGoHu9beMogHnlOu+5rFgqn+J/I/RD0pPCx3J8aakb2UkxM5IZMiIltv8KN59WZh8pb7M4E0fPoRXLBcZaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDrtArgH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDrtArgH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7671F00893;
	Fri, 29 May 2026 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780091328;
	bh=EtxGBSR6/hYbsXE8BzvOi83Nkr+esz2G5sdenNUru0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WDrtArgHCP2Ta7Qn6nkGUjqEAdAB0Su42GeR05PEdV29Z/o42scuND3FOg2nTMbsi
	 5zbX/IwFm4W62fEok+5zBdnwyhdQOnibZAkWWRQsYeKQrBpO8V+KlrsMtkXaRpRO2Q
	 uHTJvNQvBuCfdRWO2HmFD6PCVAXI6D9GBXJYPBaQEDx48qXqW5ah3JnTejOU9VVqvV
	 0XEFXTKoF/SDtRQwK/05pcQHPSQp3OzOJLsyCcW6PvNzwwd61EfVKqvgERsRqLfPjT
	 xcR3bTlJv5D4F8dBltp8W0zUMxF+muMhInaaauTIoj4j3J8AwQr2zrrIWMf3KF1m6j
	 x0/H1uVirZ5SA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: iris: Add support for Milos (VPU v2.0)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Koskovich" <akoskovich@pm.me>
Cc: conor+dt@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-milos-iris-v2-2-7a763d7195ae@pm.me>
References: <20260529-milos-iris-v2-2-7a763d7195ae@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 21:48:47 +0000
Message-Id: <20260529214848.1F7671F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing 'mb_cycles_vsp' in platform capabilities leads to severe V=
SP hardware under-clocking.
--

commit fb28be6de0281a92b4bb987cda425cdebb0eb9c1
Author: Alexander Koskovich <akoskovich@pm.me>

media: iris: Add support for Milos (VPU v2.0)

Add support for the Milos Iris codec. This only supports the variant
found on the SM7635-AB that has half of it's pipes disabled via efuse.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/driv=
ers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6e..1690e463c8ce5 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
[ ... ]
> @@ -1317,3 +1318,108 @@ const struct iris_platform_data qcs8300_data =3D {
[ ... ]
> +const struct iris_platform_data milos_data =3D {
> +	.get_instance =3D iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops =3D iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops =3D iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size =3D iris_vpu_buf_size,
> +	.vpu_ops =3D &iris_vpu2_ops,
[ ... ]
> +	.inst_caps =3D &platform_inst_cap_milos,
[ ... ]
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_milos.h b/dri=
vers/media/platform/qcom/iris/iris_platform_milos.h
> new file mode 100644
> index 0000000000000..dacd3ad5aa7e8
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_milos.h
[ ... ]
> +static struct platform_inst_caps platform_inst_cap_milos =3D {
> +	.min_frame_width =3D 96,
> +	.max_frame_width =3D 4096,
> +	.min_frame_height =3D 96,
> +	.max_frame_height =3D 4096,
> +	.max_mbpf =3D (4096 * 2176) / 256,
> +	.mb_cycles_vpp =3D 200,
> +	.mb_cycles_fw =3D 326389,
> +	.mb_cycles_fw_vpp =3D 44156,

[Severity: High]
Does this struct unintentionally omit .mb_cycles_vsp?

Because milos_data uses iris_vpu2_ops, the platform expects .mb_cycles_vsp
to be defined for calculating the VSP hardware clock frequency in
iris_vpu2_calc_freq().

With .mb_cycles_vsp missing, it will default to 0. This causes the main
mbs_per_second factor to be multiplied by 0, leading to severe hardware
under-clocking, frame drops, and potential timeouts.

Also, should .mb_cycles_fw and .mb_cycles_fw_vpp be removed here, since they
are used exclusively by VPU v3.0+ platforms?

> +	.num_comv =3D 0,
> +	.max_frame_rate =3D MILOS_V1_MAX_FPS,
> +	.max_operating_rate =3D MILOS_V1_MAX_FPS,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-milos-iris=
-v2-0-7a763d7195ae@pm.me?part=3D2
