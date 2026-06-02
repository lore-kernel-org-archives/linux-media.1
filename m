Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B83F3E8C46
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407029; cv=none; b=WpHyAEh2a7O9DNvPvArcMhPFQkyxkcYTekoos9XWyog8TP/axk5eh1cf7hOiDhk1gFPZT4MGCsi6gkoETSPB96+QaFclm9s0k0720Fu2V4+GEcZvXrd8kWVKpPXTmoEDXa9nHrUAlWsXCSgfIzQFO4XWLYoTL+PHXz1YiZJ4CR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407029; c=relaxed/simple;
	bh=sKJyM3RYtpvuiU7LSrEbZmmJ1yRZsv3J2EqkOS2MfY4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q3fcaLqL+N5+3muqIXmHnaE2h8CRBiLka3SCPJviazgOtAjt5tTI85SLqfJ2dgXKg8X0wrIaIG30y5C87GqDfPr1gPKQ+yglvzRb0UKhlAx+zesG1Ql7wmYRbpzle6KmlPHPofG9KLhFj7JwUB+8jBBr7469J54MFt5sEfRt8EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ax4yzXCt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ax4yzXCt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C3C1F00893;
	Tue,  2 Jun 2026 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407028;
	bh=Nh73aMT2dyLK0lfwBEeJH2k25aSAVro6dXC4TCkqorw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ax4yzXCtVKK8H1c4ZDzq8ggvMIKldiH2a3iikkaQ0SY/MptLC6lUCLAA7+R3mQ2kI
	 fF2snwAG28SBzzIqVesYICUDrFFd+ECgWbRC/mEYwmlQ+DLhDI4Dfid+kbtxfiE+e5
	 QeG6Rig8kRljeoEsy0zGoy6wyEchCCjJNqcENnAiUROiGIIGFRtkMNt4w6STtBQjFB
	 qOZhHScUGqPYALvBgH3T79eqTVF0AKRAk2/W4ic/u56thq1MLfzkbcyh1QkZVc4I4o
	 AI2bBNAZShHdd+Ce4HJcTeVTEi+EoEgipFAyfPuih0BQ1mAmSMuQJodytQPfc0PwAi
	 8/u9JyrihkkBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/13] media: stm32: dcmipp: correct swap in YUYV
 data with parallel input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-5-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-5-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:30:27 +0000
Message-Id: <20260602133028.19C3C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] 16-bit parallel YUV formats (`_1X16`) are omitted from the `SWAPYU=
V` compensation, leaving their byte order corrupted.
--

commit 8b2f7ccdfb3c2124d4c63097003a5fddf9ccda9c
Author: Alain Volmat <alain.volmat@foss.st.com>

media: stm32: dcmipp: correct swap in YUYV data with parallel input

This commit introduces logic to selectively swap YUYV data in the DCMIPP
parallel input pipeline to prevent color corruption. It applies the SWAPYUV
bit for 8-bit parallel YUV formats while maintaining legacy behavior on
older hardware revisions.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc=
.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
> index 5fcd5123136f8..f61618e123224 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
[ ... ]
> @@ -451,6 +454,17 @@ static int dcmipp_byteproc_configure_scale_crop
>  	if (vprediv =3D=3D 2)
>  		val |=3D DCMIPP_P0PPCR_LSM | DCMIPP_P0PPCR_OELS;
> =20
> +	/*
> +	 * Perform a SWAP YUV if input is parallel since in this mode
> +	 * the DCMIPP will swap YUV by default
> +	 */
> +	if (byteproc->ved.dcmipp->pipe_cfg->has_swapyuv &&
> +	    (sink_fmt->code =3D=3D MEDIA_BUS_FMT_YUYV8_2X8 ||
> +	     sink_fmt->code =3D=3D MEDIA_BUS_FMT_YVYU8_2X8 ||
> +	     sink_fmt->code =3D=3D MEDIA_BUS_FMT_UYVY8_2X8 ||
> +	     sink_fmt->code =3D=3D MEDIA_BUS_FMT_VYUY8_2X8))
> +		val |=3D DCMIPP_P0PPCR_SWAPYUV;

[Severity: High]
This is a pre-existing issue and was not introduced by the patch under
review, but should 16-bit parallel YUV formats like MEDIA_BUS_FMT_YUYV8_1X16
also be included in this condition in dcmipp_byteproc_configure_scale_crop(=
)?

Since the 1X16 variants are also parallel YUV formats arriving on the
internal bus, will they be subjected to the hardware's default swap without
this SWAPYUV correction and result in corrupted output colors?

> +
>  	/* decimate using bytes and lines skipping */
>  	if (val) {
>  		reg_set(byteproc, DCMIPP_P0PPCR, val);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D5
