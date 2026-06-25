Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87871D47AC;
	Thu, 25 Jun 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782368933; cv=none; b=QvvDSxRvN/c09Mu918nM1aYQInOTwtL318F6XLd4ompGDifk1xjOe3GtXXW26X8DlsWIGTEPwKL3dNdwlnqjzpwtJNgiimUFF7WKSaorNLcWpPbbdVgoe6X2tQc06cGRJlhU5lPxgpDLcSUgpCTbtmL2PBWTgeiKQcjoyDMxt4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782368933; c=relaxed/simple;
	bh=ackho+X1RsxpSynpbvJ6wawHVFxc7e5qW2lb+VFrdzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eImzx5BL8F4qpXCLvIR4qAFTadMH7JKoC3OipMWKZ8Bre/dNyhVYph1ysJ4M3IJF/POLEjx+THZumK8voHWWy5rh35spVvfxYTRfKS4ol8za5tgT+SspVmWgKS1YalSFMaOTG8Tur9z7sqjoZiwW9I30DokwUanaG5K0QnlxQLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fg6BC8co; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fg6BC8co"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC5D1F000E9;
	Thu, 25 Jun 2026 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782368932;
	bh=p7HNIXy0yS9fIOHY7kjeZItIikOpAOo6Lfo/NHE/T5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fg6BC8coU5E95/Mh5DqDAWknpZO2AklIJPThPdg82BRVS8KGklSx7NDtxtQAvl87f
	 G23Fok8UmFnoFuTcL11Esui6YeMmkw2yCfigJbDMjM5pkLpRS+4W3akzi8JV9qP6ve
	 ue26x8VpOzvns1dNWkFW6uT6sw/IAZ75fhzLjifvVehpeosjy60F40p9l/T+xaw+ir
	 5xJt4KcULI4kiFio0pkV3eYbzfky6dsnxtOugwx3DXN9b2f6cnxokHnbgL5DAGZJrm
	 xrAy/8g6QeJoCPhx63RnOMfhQ6ordHCgNZW2JjoClkZNER1SJvwh33+6Yc2UgdlIPM
	 ez4R5H+CCwpvQ==
Date: Thu, 25 Jun 2026 08:28:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: Conor Dooley <conor@kernel.org>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-imx@nxp.com" <linux-imx@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "jackson.lee" <jackson.lee@chipsnmedia.com>, 
	"lafley.kim" <lafley.kim@chipsnmedia.com>, "marek.vasut@mailbox.org" <marek.vasut@mailbox.org>
Subject: Re: [PATCH v6 2/9] dt-bindings: media: nxp: Add Wave6 video codec
 device
Message-ID: <20260625-artificial-coot-of-climate-efbecd@quoll>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-3-nas.chung@chipsnmedia.com>
 <20260624-junkyard-sensuous-fcd43189b593@spud>
 <SL2P216MB2441BB9DC91CCBE494F2B45BFBEC2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SL2P216MB2441BB9DC91CCBE494F2B45BFBEC2@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>

On Thu, Jun 25, 2026 at 01:43:33AM +0000, Nas Chung wrote:
> >> +  sram:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      phandle to the SRAM node used to store reference data, reducing DMA
> >> +      memory bandwidth.
> >> +
> >> +  iommus:
> >> +    maxItems: 1
> >> +
> >> +  "#cooling-cells":
> >> +    const: 2
> >> +
> >> +  "#address-cells":
> >> +    const: 2
> >> +
> >> +  "#size-cells":
> >> +    const: 2
> >> +
> >> +  ranges: true
> >> +
> >> +patternProperties:
> >> +  "^interface@[0-9a-f]+$":
> >
> >I have to wonder if this interface business is required at all.
> >Why can this not go into the parent, with each region fetchable via
> >reg-names, interrupt-names and iommu-names?
> 
> Thanks for your feedback.
> 
> I did try the flat model, but the blocker is the IOMMU.
> 
> The control region and four interface regions are independent DMA requesters
> with distinct stream IDs, and each interface can be assigned to a different VM,
> driving the video core with its own isolated memory.
> 
> If all stream IDs are listed under the parent's iommus, they bind to a
> single device and share one domain, so the isolation is lost.
> This is the main reason I added the interface nodes.

Feels similar to issue Qualcomm has. I rejected such subnodes and
Qualcomm came with a solution in DMA IOMMU code, but that solution was
rejected by DMA folks:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

I don't have proper arguments to convince DMA folks, thus I agree for
Qualcomm for the subnodes. It should be fine here as well, in such case.

Best regards,
Krzysztof

