Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2F2F7EE1;
	Fri, 31 Jul 2026 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508327; cv=none; b=Ar3fO4o78xeoxQtevShtng3cx03jqD7J6H7nJrfzmfbCN9ezSaHFJPzD2QpdwUd+Vi2LlRI5V0Yzu/epopGyA4pWDAbG2tuQWHELmszTfYo5+T+8RX4ZwdUAwK0dgLQCgbwpIZ56LIzPtEGRAApMLqArFPjli+gzY5Nt804+FkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508327; c=relaxed/simple;
	bh=T5RhjFZzgEButpOEGJDjcZHiIdh+pcSEWjHBSncMAxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l40RJPLpzH78CNtf0Mk6qvgtc2kbSUeUTckEKEHsjuGWrJkHXM3NPzxwyon3BfUnhTHowhcAj4STqiLotGXZeIGtyXB7nm3RaIsrT+wkKg2F3LPZa4IIDdmsZH6c1DxJDK2M/sJPyXIenZ9ihVMyt8tg+DZXrbB+4+jWc0NyYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A67lDIFN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A67lDIFN"
Received: from ideasonboard.com (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95EB522E;
	Fri, 31 Jul 2026 16:30:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785508255;
	bh=T5RhjFZzgEButpOEGJDjcZHiIdh+pcSEWjHBSncMAxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A67lDIFNxlBpP/U53pNEY4vzUEeGAFeckqoI2tIrXOYlQYGfNf3or9HtcqlBRLdJB
	 CA5IW7IfpWwqttEpz3MvCDjo1j2T9f/dxWs7YlomU4C4VVYjV2TkKMpmy35qfTgbH7
	 XlOqVmv0x+eIA1VU3hocCi59qU1+5pGbIl/mPftA=
Date: Fri, 31 Jul 2026 16:31:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Message-ID: <amyxp_U9V1y4gSJ3@zed>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
 <20260727-mira220-v10-1-8825794e6095@ideasonboard.com>
 <amjAKhNIt0_UIZqt@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amjAKhNIt0_UIZqt@kekkonen.localdomain>

Hi Sakari

On Tue, Jul 28, 2026 at 05:43:54PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Jul 27, 2026 at 10:56:30AM +0200, Jacopo Mondi wrote:
> > From: Philippe Baetens <philippebaetens@gmail.com>
> >
> > Add bindings for the AMSOSRAM Mira220 image sensor.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> >
> > ---
> > v8->v9:
> > - Make link-frequencies required
> >
> > v7->v8:
> > - Add Conor's tag
> >
> > v5->v6:
> > - sashiko: use 'unevaluatedProperties: false' at the top level to allow
> >   properties from video-interface-devices.yaml
> >
> > v4->v5:
> > - reflow description to 80 cols and drop |-
> > - remove 'reg' description
> > - remove 'anyOf' from data-lanes
> > - remove 'link-frequencies' from required properties
> > - remove 'clock-continuous: true' as we already allow all properties
> >   from 'video-interfaces.yaml'
> > - remove tabs from the example
> > ---
> >  .../devicetree/bindings/media/i2c/ams,mira220.yaml | 102 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 ++
> >  2 files changed, 109 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> > new file mode 100644
> > index 000000000000..fa6fec0072ef
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> > @@ -0,0 +1,102 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: AMS 2.2 MP NIR enhanced global shutter image sensor
> > +
> > +maintainers:
> > +  - Philippe Baetens <philippebaetens@gmail.com>
> > +
> > +description:
> > +  2.2 MP NIR enhanced global shutter image sensor designed for 2D and 3D
> > +  consumer and industrial machine vision applications. Due to its small size,
> > +  configurability and high sensitivity both in visual as well as NIR, the
> > +  Mira220 is well suited for 2D and 3D applications, which include Active Stereo
> > +  Vision, Structured Light Vision for Robotics and AR/VR.
> > +
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: ams,mira220
>
> I haven't read the discussion on all versions of the set, but this way
> you'll have to power on the device to fully recognise it, further meaning
> the possible hardwired privacy LED will be lit at that time. Maybe it's not
> an issue. You'd likely have it with a CCS sensor, too...

Yes, we run-time identify the sensor.

I don't think it's an issue, and it ends up being one, we can add a
compatible for the mono or ir variants and use this one a the generic
fallback ?

>
> --
> Regards,
>
> Sakari Ailus
