Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E35145B11;
	Mon,  3 Aug 2026 19:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784706; cv=none; b=Kg27kTKSzpn0yo3Kco3qkSc1rdUs75u4zUH3LfUY0GXhUYRlUAWe4vnsakgCA03NNkH6rUVu4iiuvWGDvx879l7BXWRTWZSbgdgjn3pR3+AFjYPeOL1v7kvejYxQhlL1QnU1wFVnSomlUGDSXgJUioZm0ZOW83tqwBkg0LDhIeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784706; c=relaxed/simple;
	bh=q9elSZMPBUIuLRfUH95EVRw90TcgPGyA9q+ZdEGh6Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIKp9+8S+JZQ0EmBE/2u4WgCycTZ1DJFhE3hWEiv6JnU3JPX+lzEKcrXxA+xAnt09OXMAw5N7V+AeyeKtJRnESSgJDZJltN8/MSwWM1gq85n5o81YeNAZUNxDVCggSH1QxkzkMAABZm+mt7fNvn8d0xRbUi56UcIBQtcduQkGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dCPiXKP+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dCPiXKP+"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D72545B3;
	Mon,  3 Aug 2026 21:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785784633;
	bh=q9elSZMPBUIuLRfUH95EVRw90TcgPGyA9q+ZdEGh6Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dCPiXKP+8DNcoWsueXSSi6Oogxm8wAZxBUqOcBzLxBLvMKfBa9S6DqrgIwtEG/9uL
	 At0jPqmvbQkf6CzDKfFkE7RnMM/Xk/r37aSbHnvqBDOhIAVWVyyZoZd+ErqxlyhPQ7
	 6ln62lP7NNrtV+ekKAOQkD9XeGDqZvImtm+ljagM=
Date: Mon, 3 Aug 2026 22:18:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
	Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
	Kazumi.A.Sato@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
 bindings
Message-ID: <20260803191820.GC2201016@killaraus.ideasonboard.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-2-lachlan.michael@sony.com>
 <20260730-elastic-amaranth-urchin-4b8bbf@quoll>
 <20260802230344.GD1927055@killaraus.ideasonboard.com>
 <a4d585fa-ccdc-4021-b7f7-f88638a9dbe4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4d585fa-ccdc-4021-b7f7-f88638a9dbe4@kernel.org>

On Mon, Aug 03, 2026 at 08:16:10AM +0200, Krzysztof Kozlowski wrote:
> On 03/08/2026 01:03, Laurent Pinchart wrote:
> > On Thu, Jul 30, 2026 at 11:06:09AM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Jul 30, 2026 at 11:15:24AM +0900, Lachlan Michael wrote:
> >>> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> >>> with a MIPI CSI-2 output interface.
> >>>
> >>> Add device tree bindings for the sensor.
> >>>
> >>> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
> >>
> >> You need to test code before you send it, not with our infra.
> > 
> > I have provided guidance to Lachlan on how to test DT bindings (and have
> > submitted a fix to dt-schema as part of that work) before he submitted
> > this patch series. Unfortunately, we missed an issue in the
> > configuration of his development environment which resulted in the DT
> > bindings check not being run. Mistakes happen, it will work better next
> > time :-)
> > 
> >> To spare you one sending cycle:
> >>
> >> A nit, subject: drop second/last, redundant "bindings". The
> >> "dt-bindings" prefix is already stating that these are bindings.
> >> See also:
> >> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
> >>
> >>> ---
> >>>  .../bindings/media/i2c/sony,imx908.yaml       | 107 ++++++++++++++++++
> >>>  MAINTAINERS                                   |   7 ++
> >>>  2 files changed, 114 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> >>
> >> ...
> >>
> >>> +++ b/MAINTAINERS
> >>> @@ -25264,6 +25264,13 @@ T:	git git://linuxtv.org/media.git
> >>>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
> >>>  F:	drivers/media/i2c/imx415.c
> >>>  
> >>> +SONY IMX908 SENSOR DRIVER
> >>> +M:	Lachlan Michael <lachlan.michael@sony.com>
> >>> +L:	linux-media@vger.kernel.org
> >>
> >> Drop
> > 
> > Why so ?
> 
> It's just redundant and bloat. The address will ALWAYS appear through
> the subsystem maintainers entry, thus duplicating exactly the same list
> is not necessary. Many drivers make the same mistake (I fixed Samsung
> now) resulting in quite big amount of redundant data.

Good point, thanks for the explanation. I'm fine with that. I'd like
Sakari's opinion though. If he disagrees, I'll let the two of you debate
this, and Lachlan can then drop or keep the L: line based on the
conclusion :-)

-- 
Regards,

Laurent Pinchart
