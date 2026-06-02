Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36B21B191
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780407589; cv=none; b=KfjIPy7Wq1r+AhXx7VAFKHQTlAqrdTddyxWPFx5Of+8GHViWOYRuqMAPgQHrsnz+Ey7YwBN11Cmo5t/dkW5xeXao6uthY5HGbLm+fbK8mv4Fem7hrPQbSQUFFSuop3AL20H+ukZjvZT5D9KJ14/G6tNbvMJrZsTvxHB/QDm4nXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780407589; c=relaxed/simple;
	bh=Ty6NEWpQk6gEC0kvftdpoCpZckNK5SL2CtR6Lao1iPI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lo5YyESJqf6gLS7IfqRR6j8Hy75A0TwmuPFvRjOx9+rvOSj5WHv66qNaCCbyD8yBx6wR4zymERKhyb9gu3YlXn72Zud24bk5o0rpFpDxT+Wj9KV7mXnb4fAFwWPtyBEpdue3/prC03sm6mFiDOJ+F42i61K8qEQs+BjXhTOx7i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXa4+j+0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXa4+j+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABDF1F00898;
	Tue,  2 Jun 2026 13:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780407587;
	bh=cC81pZMK1s68vV6MYLdgWX+Rs3lmKgjQvn2RrTHZTf0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXa4+j+0TR0kKtYowGz9ctIkUilPPHVqbtXralAklHVtU3ktpWsJ2vnoT+hqwc3zU
	 M2AJWrOiLf8hnUPn/jNGmvnxHui0CX4Js3cFfrgeeeBtZTr46XLqvJyVWfubcrpSec
	 yhI1M9RanpYSyaLzS+OBStzO6LJnnXlDtpEHkMFR5lrosI7odTwJS9cpGd5x463FTT
	 wZ1v/m0NWZVFL8uDtx8N8YdMdwln5ubwkuY59nxIMMUjLi3wU04DSEwcWP0oxlTEs+
	 nlc34uI6EtE2iEAJLS9L8SDCGu1P9K3AwUooj82792Yre2fNUNRGBOE1c8eDdD+C8W
	 6RM6yAg38ExMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/13] media: stm32: dcmipp: instantiate & link
 stm32mp25 subdevs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alain Volmat" <alain.volmat@foss.st.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-13-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-13-3c76b5f93157@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:39:47 +0000
Message-Id: <20260602133947.BABDF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Removing the ENABLED flag from the default link between dcmipp_inp=
ut and dcmipp_dump_postproc breaks existing userspace applications.
--

commit 3794e6b46e60dac386934ce0ec55d3958f228d85
Author: Alain Volmat <alain.volmat@foss.st.com>

media: stm32: dcmipp: instantiate & link stm32mp25 subdevs

Add topology of the two pixel pipes (main & aux) of the stm32mp25.
This also changes the link from dcmipp_input to not be immutable and
enabled by default to allow proper pipeline validation when a pipeline
is not being used.

> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b=
/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c

[ ... ]

> @@ -91,13 +96,46 @@ static const struct dcmipp_ent_config stm32mp25_ent_c=
onfig[] =3D {

[ ... ]

>  static const struct dcmipp_ent_link stm32mp25_ent_links[] =3D {
> -	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
> -			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> +	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0, 0),

[Severity: High]
Will removing the MEDIA_LNK_FL_ENABLED flag here break existing userspace
applications?

Prior to this commit, the stm32mp25 topology exposed an active, immutable
link between the input and the dump byteproc. This allowed applications like
simple v4l2-ctl scripts to stream directly from the dump video node without
requiring explicit Media Controller link configuration.

By changing the link flags to 0 (mutable and disabled), the link is
disconnected by default. If userspace does not explicitly enable the link
via media-ctl, VIDIOC_STREAMON will fail with -EPIPE because pipeline
validation will find no active path from the sensor source.

Would it be better to just remove MEDIA_LNK_FL_IMMUTABLE but retain
MEDIA_LNK_FL_ENABLED?

This would allow legacy applications to continue working out-of-the-box,
while still permitting new applications to explicitly disable the dump
link to avoid format validation errors when configuring the new main or
aux pipes.

>  	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
>  			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> +	DCMIPP_ENT_LINK(ID_INPUT,	2, ID_MAIN_ISP,  0, 0),

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-stm32-dcmi=
pp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com?part=3D13
