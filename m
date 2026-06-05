Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FDF282F1A
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698219; cv=none; b=CwM6pDeyvFZoHfBstVOyzjgYvgMr0Hs0iiBv03JB7ZalK3+AKek8ZW/UXH+knMccGQ+Mn8a1+sJ1pFg02FZUCfuRaDTfTBmcuYEOJcBLLSg6H3YKWspeA6Cgo1o2LlnfS78arrqVcXkzdEqeSWCeyxov5v/5C+xiI9MTFKZZI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698219; c=relaxed/simple;
	bh=wusjwhqtQVmUxTyzVY85g51wWpN46LHRK4OHqwRQNv8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JIGhX9nXMpDON3GTRNuej6ZpRbErWQbfoWKwHw5DX9yBVVXDh6xzu77AQktyoZhMsTMO9DZIfi1S046/nyTce8l45HBwk3ZkNYa5OoqmlwQqo+8RCPS0WhU5OL7oCIa2Er6UBuKRGrG0nvGcdVbOxldnCi1H9iESzTCFl5NY9LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqgYn6YJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqgYn6YJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E041F00893;
	Fri,  5 Jun 2026 22:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698218;
	bh=tG/EFw7SZEO3pLqm4ppnFtGDSirtpfZWbTgWMPeKtaY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iqgYn6YJYbl7C6+8EOyjILn9q/aK+MkJHUTnZnk3w/VPS5RMCWY0yrvKLoDUpeNTe
	 6Be35NfxHFD/XOPaqgOXSQlnQVt1saWi4ISxIfQnso/Mm9kc1315PBt6COBB8YxDlq
	 O7sveG6bVNux/6avIp/eyn1yrkDM1lg9jhHQ0Olw7+ZDHSbuo8b1XZsM8zeSwP1l8U
	 1yHwWF0HozOSQu+Zu4HAbt12TSJewuchCy3OFKkGLPC2JNkqf8eJcZcDZbaDoyHxG/
	 vF5yNW7aoB4/ommgi7eHou2CCAnBdZ7CPEiTVNzLzh4VTrkdsMCdHWaYPXyvGvcPFt
	 BTnzJRTAYzLGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/17] media: rockchip: rga: move rockchip_rga
 allocation to master probe
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-10-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-10-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:23:37 +0000
Message-Id: <20260605222338.37E041F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing IS_ERR() check on the `match` pointer after `component_mat=
ch_add_release()` can lead to a kernel panic.
--

commit 7be0968d7d9ce3f1b58fa4c450d0c7a606ff6014
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: move rockchip_rga allocation to master probe

Move the rockchip_rga struct allocation to the master component probe
function in preparation of enabling all cores. This also adjusts the
allocation to use the actual number of cores found in the of tree
instead of being fixed to one core.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 178f45b8da940..11912bf5b6906 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c

[ ... ]

> @@ -985,6 +977,7 @@ static int rga_probe(struct platform_device *pdev)
>  		of_node_get(core_node);
>  		component_match_add_release(dev, &match, component_release_of,
>  					    component_compare_of, core_node);
> +		num_cores++;
> =20
>  		/*
>  		 * As multi core is not implemented yet,
> @@ -1000,6 +993,19 @@ static int rga_probe(struct platform_device *pdev)
>  			dev, -ENODEV,
>  			"no matching available component devices found\n");

[Severity: High]
If component_match_add_release() fails to allocate memory internally, it can
update the match pointer to ERR_PTR(-ENOMEM).

Since this code only checks if (!match), the error pointer bypasses the che=
ck
and is passed into component_master_add_with_match() at the end of rga_prob=
e().

Could this lead to an invalid page fault when component_master_add_with_mat=
ch()
unconditionally dereferences the match pointer?

> +	rga =3D devm_kzalloc(dev, sizeof(*rga) + num_cores * sizeof(*rga->cores=
), GFP_KERNEL);
> +	if (!rga)
> +		return -ENOMEM;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D10
