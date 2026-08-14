Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DF3C1419;
	Fri, 14 Aug 2026 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786737026; cv=none; b=t8m2W9Xpr3GaiDuYUUPvlLBvYn7A4KerG9R8RuPife/EXAbXbQ6hvzhOM0ymzWkqhro46Eu3l6Wgz9iXvvRm7UkY9Kk6FojKw0Bys2hdrCsVGVUftFaVBcof4TV0/Y+m8rtueCHGq2MuHbkLG1QLHX0+Kbgw64QEdXTPujfVh4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786737026; c=relaxed/simple;
	bh=ersILPzCP4c1Gmtm/0IiOKwo8eIfiku/ZO5FH94nqeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPeupnvW7jDSPi08ylUPYEcSirliSlzfVFigEyN+N+MLyI741nNXkYq0UHa1DbrixSWZ6ikyHYuY2ipftR+rZ+G63Ws09aczh4Io1eG5fWqw4qcuwH4Luo60lnzThpl1JsOxXLaedxFrw+XVH7gdAPHky7MYTNiiCvLhDdcMbkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXQNSsf2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXQNSsf2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAC61F000E9;
	Fri, 14 Aug 2026 19:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786737025;
	bh=yXMisPQDrDDM1FFKPPWcBOejo0x/kDzEd69++bzHsl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NXQNSsf2TCNQuKb0TScma0MoaFM6xG2OFBZd1fbGK0y8G0QvecruRzitLPNBiyjU+
	 FRXPWOdRQwc1MeIumZJgcGG5nGfeNLUF23b2NkZ6s+7b9US+YTt8YHb9ExQrv4wTtD
	 qZAVABanB290W/WwbwWZ3uiZnumkP45lppkeVbyWUi2upmfU+BBQCmnqdk7T7a1JUL
	 Gh7Fg8TZldtTNnwMeapnHRDDWjmxQfqAAwvwog9DEVxocdUphbPbH/uPxnpiC8DJJv
	 puHjNF0v6xujMjWlT99O2IRRpet45U6R5cF/JwPaZ0QJiAHXqXX0UzPRcKCrGhywBJ
	 F+23U8dQGOJyA==
Date: Fri, 14 Aug 2026 14:50:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-kernel@vger.kernel.org, simona.toaca@nxp.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>, daniel.baluta@gmail.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, m-chawdhry@ti.com,
	goledhruva@gmail.com, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: ti,da850-vpif: Convert to
 dt-schema
Message-ID: <178673702293.2790919.17984558270805900112.robh@kernel.org>
References: <20260813-ti-da850-vpif-v2-1-80ba62ca53d0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-ti-da850-vpif-v2-1-80ba62ca53d0@gmail.com>


On Thu, 13 Aug 2026 05:09:08 +0530, Bhargav Joshi wrote:
> Convert the Texas Instruments DA850/AM18x Video Port Interface (VPIF)
> device tree binding from text format to YAML dt-schema.
> Add power-domains property missing from text.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
> Changes in v2:
> - Removed old text binding that wasn't removed in v1
> - Link to v1: https://lore.kernel.org/r/20260813-ti-da850-vpif-v1-1-275fd0363341@gmail.com
> ---
>  .../devicetree/bindings/media/ti,da850-vpif.txt    | 106 -------------
>  .../devicetree/bindings/media/ti,da850-vpif.yaml   | 168 +++++++++++++++++++++
>  2 files changed, 168 insertions(+), 106 deletions(-)
> 

Applied, thanks!

