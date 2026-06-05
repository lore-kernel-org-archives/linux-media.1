Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C4F3C2796
	for <linux-media@vger.kernel.org>; Fri,  5 Jun 2026 22:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780698386; cv=none; b=mxV1SeQanET0yXdQTBsDgUKv2ak9MJbvwZaL/LFseT2r0vimBBnBBrSgIZbliGxS2a1sUHP0R8xfBMWEoOfM0zVk03/FvjLtgfcy5ZJk5vVmf71GHh+BMV4WoIkffqW1AulujaW6/RyPvF7ilEwNakLfZus2tRtHmaktPZxTUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780698386; c=relaxed/simple;
	bh=h2GMTKqTQFp27x4hu27gxe9sCW/q3yD0UYGwiNKwZqQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SXhpmrr9O3wLkx0xpJy/e1Wn9DgU/MoSmleVg43vmVXC3e6ybrTHRSWFt7G3qZzn39vWZa/Mzzcss2yrpr4vkqG2SNgI3NSXrba4/rcXMsIEcO6LMF/JIkgmL0FiK3d9utLVVwoun9cdAepPW5NfEJz4mNo78wxaandMQAOmqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gonKA8Gg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gonKA8Gg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690F01F00893;
	Fri,  5 Jun 2026 22:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780698385;
	bh=PT7VBgtsNWuoeDPqp6P1v6FHnm7MoE3pEC51P30Ti6g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gonKA8Ggi9Ssi5qEnQGYFruA80pETZXluW0Up+QvUCiH0otHCI5W3Mn44mxgRoo5s
	 57RxfJY8GNMiskoyXPQuT5NdPWY0SSC1jBEPiH34cfJSCzsiyHd8MPoEzjKgv6rSNe
	 Qy7oICSnXKyUS6fa4XyfVk8Bty2oHiHav+8mHYTFXu+f4YHQFrYetxoofbUl9yqSmp
	 9HF6Q6pHvUJ7xdHpioVkRvpdBp1upwr0wf+uc8fSAqeluKX5049RwUTzH8dAKcna8m
	 SlR0w5/PIgPKJM4HrqKtPw9BiFk7n0pwmGN6mHpTIpixoyBS4gsA/K7OSRPMjj87c3
	 9VTeqvhsJmzSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 17/17] iommu/rockchip: disable fetch dte time limit
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260606-spu-rga3multicore-v1-17-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-17-3ec2b15675f7@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 22:26:25 +0000
Message-Id: <20260605222625.690F01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional application of a hardware workaround to all Rockchip=
 IOMMU versions.
--

commit 927dc2f6e4d804f46fcc9640f9c6e784b79d0d3b
Author: Simon Xue <xxm@rock-chips.com>

iommu/rockchip: disable fetch dte time limit

This commit sets bit 31 of the AUTO_GATING IOMMU register to 1 to fix an
issue where the IOMMU blocks after fetching DTE consecutively four times.
It squashes two vendor commits covering RV1126, RK3568, and RK3588 hardware.

> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 0013cf196c573..87ae036d64145 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c

[ ... ]

> @@ -948,6 +951,11 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>  			       rk_ops->mk_dtentries(rk_domain->dt_dma));
>  		rk_iommu_base_command(iommu->bases[i], RK_MMU_CMD_ZAP_CACHE);
>  		rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, RK_MMU_IRQ_MASK);
> +
> +		/* Workaround for iommu blocked, BIT(31) default to 1 */
> +		auto_gate =3D rk_iommu_read(iommu->bases[i], RK_MMU_AUTO_GATING);
> +		auto_gate |=3D DISABLE_FETCH_DTE_TIME_LIMIT;
> +		rk_iommu_write(iommu->bases[i], RK_MMU_AUTO_GATING, auto_gate);
>  	}

[Severity: High]
The commit message indicates that this issue affects new IOMMU versions
(specifically RV1126, RK3568, and RK3588) and mentions that older versions
do not have this bug.

Does this code apply the workaround unconditionally to all hardware versions
managed by the driver?

If the RK_MMU_AUTO_GATING register is unimplemented, reserved, or has a
different meaning on legacy v1 silicon (such as RK3288 or RK3399), could
reading and writing it trigger an asynchronous bus error or corrupt
undocumented hardware state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-spu-rga3mu=
lticore-v1-0-3ec2b15675f7@pengutronix.de?part=3D17
