Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783798;
	b=iA7/cGeiuhN8PdNG/ZFf3ewkgHnWcieOYo8+Cb6WNTjMxwj5WGAxY/b/jFyafLT/GsNm
	 GrXK1W84n4+Qr8aSrOYgW+KAgiOVtiGRFCR6GiHa6Y6QlK5myWD2GmvrwKIH6qwA45rUR
	 SwCYwd4MNyfq4T9wcHeHIHhnlVVKvTddaxmYUUU2bw8VpQ5XNo72Uq/Ty6M8aCfZp7pZC
	 r1xTJXs/7YqitY5gpAOdqOK/1227Dkqy2TVgfnZR3Sle3LGt84qsp8UQPDFRi+IgBH5gj
	 CwciSg3euxXqxmDkG4PHkFs89rDB1ZU+eGQnHCFvSQV/m5ssYK4BBKQhmviysnNmgSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783798;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MkH4cutE4IChIOyYA5AS0pM5uFXn9KIjzHwhJQeQB1g=;
	b=w6A95dY9qeyxIY31k1PQhCU3JYd/f8y5mRfaa+H93fOOGAKcr1EwzX2hYccd5H67p7YO
	 uOhxiyLJZkKhmaVb1Iu8gREJ5l9VWQIUC6WiFwp8VYv7pRGgDZKStAXOVsyfOoOa95CKp
	 yJf50US4GruhSX34LKsiUd46787ckdrDuaEjq6s5N5898ezu1zD8x22rbgwD52S8x0CtM
	 mpMoTkaHnSKO5YXlrdd5HiYHNhTZ5kAx8xsMGMh5twXbrPROLkMGUoiMgcJfx2meoG4pg
	 81BNlrmKX8R9BC1NGtjuhkffe1C+e2txaOwYt2JtLQIZ9+qMkUx26JnA48PRvHln5PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PZi2c991;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219F3606A326;
	Fri, 27 Nov 2026 12:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219F3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=PZi2c991
Received: from killaraus.ideasonboard.com (KD106184139166.ec-userreverse.dion.ne.jp [106.184.139.166])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6728C51;
	Fri, 27 Nov 2026 13:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795783640;
	bh=TayXOaD0uXmQU39zGKKH5UkKxy9hM8l1AXof85x25nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZi2c991ZtpqtpdUjVLrnQvyGk9BFNjRzjBD3W/1qXZyZ6uh5T5RP1qM/CnGlRmsI
	 bSYkuh0wWv2k4vnAOCvVRtiCRcfcUdzNjZ+boxKfRDVsJF1aMino/Z/lZj7MJ8SUVh
	 sY6rzpwzvLWrFQMHXscrw7T+lWqvBdHGpzuxTJ30=
Date: Fri, 27 Nov 2026 21:49:51 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Nayden Kanchev <nayden.kanchev@arm.com>,
	Konstantin Babin <konstantin.babin@arm.com>,
	Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com,
	kieran.bingham@ideasonboard.com, dan.scally@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 02/24] dt-bindings: media: Add bindings for Arm Mali-C720
Message-ID: <20261127124951.GC85756@killaraus.ideasonboard.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-2-0cb9bde1bd30@arm.com>
 <179559671799.14607.10622707622371448283.b4-reply@b4>
 <0543d134-04d3-4e51-acd1-4fc39a0e522b@arm.com>
 <4e8ecbe0-35bd-41d0-8546-4d99832e662b@kernel.org>
 <9bb113e7-f88f-4616-b20a-74065cd755cf@arm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9bb113e7-f88f-4616-b20a-74065cd755cf@arm.com>

On Fri, Nov 27, 2026 at 12:32:32PM +0000, Anthony McGivern wrote:
> On 26/11/2026 15:12, Krzysztof Kozlowski wrote:
> > On 26/11/2026 15:55, Anthony McGivern wrote:
> >>>> +
> >>>> +  interrupts:
> >>>> +    minItems: 1
> >>>
> >>> Why is this flexible?
> >>
> >> The ISP has two interrupts - Main and fault. Currently the driver only
> > 
> > If only writing bindings covered exactly such example. :/
> > 
> > Hardware has two, so you need here to.
> 
> Ok, understood on the part about driver support being independent here,
> I should clarify what I meant to say. This fault interrupt is only
> required for safety applications, and as such some integrations can
> leave this interrupt physically unconnected.
> 
> That being said, it looks like in such case the device tree entry can
> use 'interrupts-extended' and set the phandle to <0> for those cases.
> So I will remove minItems here and for 'interrupt-names'.
> Apologies for the confusion on my side.

If SoC can integrate the ISP without the fault interrupt being wired to
the interrupt controller, then "minItems: 1" is correct.

> As a side note, there are some extra signals for a system timer clock
> and video output ports that should be added to these bindings also.
> I will address these in V2.
> 
> >> uses the main interrupt, though we may wish to enable the fault
> >> interrupt in the future to detect errors on HW side. I will update
> >> this in V2 to use descriptions for each interrupt.
> >>
> >>>> +    items:
> >>>> +      - description: ISP main interrupt
> >>>> +      - description: ISP fault interrupt
> >>>> +
> >>>> +  interrupt-names:
> >>>> +    minItems: 1
> > 
> > And please drop minItems here as well
> 
> Agreed
> 
> >>>> +    items:
> >>>> +      - const: isp
> >>>> +      - const: fault
> >>>> +

-- 
Regards,

Laurent Pinchart
