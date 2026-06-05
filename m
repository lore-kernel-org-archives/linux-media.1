Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F719D8AC;
	Fri,  5 Jun 2026 21:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696761; cv=none; b=ew+1RNtwdJNIBJaKRlDlyq0s6kVflfE1InnV86rsP2QTH/IXHTXs+SQkm3jDOD1gvYtD9v5wUqpRp89jqOIrfh9hSeexfr1XMCzXwv8aM2bmYE7k0tXtLkjGqShjHU6EuUN9rWGLKMdJo5V6iJ+H2rTmyh01ecVoDN0QRtWVtfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696761; c=relaxed/simple;
	bh=/qPumg2Nle3zpDmRleRAgtq84tFaKpcOCbUJPuueXzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ynac9TUAhokrf4VAwu80zd/wgYB5kegDZ3TEAPxh8luJ3CK87lU/M8d/LUhLYEZ5/u5qiAAKt71WrzE+MlyTYsAMsFqZZcxvILoZ+M+DOfs0dqfRTkmvNPmclgNc1E+Rd6EpcBLcNXMtN+ByOoLZhyU/BnhRS3L2kFY1UqPl02g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FzGgOX7C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FzGgOX7C"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9B7E20EA;
	Fri,  5 Jun 2026 23:58:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780696732;
	bh=/qPumg2Nle3zpDmRleRAgtq84tFaKpcOCbUJPuueXzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzGgOX7C31YQORfusB+iVgGAG8sjKkhBW+dswFB6T4ajhopyaSLsE9vcRjdEVceVR
	 wU3NktAOQpS77Q1KwsHw9RKaTYcy4VoPqAf0Zqd/jIxLVLvvu6wtH9d5Ov2j9j239q
	 rFXC3qpa3eKdLh+qvWuAZkiA+F+OMMJFcMf7DZmk=
Date: Sat, 6 Jun 2026 00:59:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: media: Add macros for video interface
 devices
Message-ID: <20260605215915.GA160511@killaraus.ideasonboard.com>
References: <20260605150309.2451456-1-kieran.bingham@ideasonboard.com>
 <20260605151353.GB4350@killaraus.ideasonboard.com>
 <aiNBXzmezUX9fB6_@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiNBXzmezUX9fB6_@valkosipuli.retiisi.eu>

On Sat, Jun 06, 2026 at 12:36:31AM +0300, Sakari Ailus wrote:
> Hi Laurent, Kieran,
> 
> On Fri, Jun 05, 2026 at 06:13:53PM +0300, Laurent Pinchart wrote:
> > CC'ing Sakari.
> 
> Thanks for cc'ing me.
> 
> > On Fri, Jun 05, 2026 at 04:03:08PM +0100, Kieran Bingham wrote:
> > > Add a new dt-bindings/media/video-interface-devices.h header that
> > > defines macros corresponding to the orientation enumeration types from
> > > media/video-interface-devices.yaml.
> > > 
> > > This allows avoiding hardcoded constants in device tree sources.
> > > 
> > > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > ---
> > >  include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++

A mention of the header in video-interface-devices.yaml would be useful,
the same way we mention video-interfaces.h in video-interfaces.yaml.
Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > >  1 file changed, 13 insertions(+)
> > >  create mode 100644 include/dt-bindings/media/video-interface-devices.h
> > > 
> > > diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
> > > new file mode 100644
> > > index 000000000000..d2340b457292
> > > --- /dev/null
> > > +++ b/include/dt-bindings/media/video-interface-devices.h
> > > @@ -0,0 +1,13 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> > > +/*
> > > + * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> > > +#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
> > > +
> > > +#define MEDIA_ORIENTATION_FRONT		0
> > > +#define MEDIA_ORIENTATION_BACK		1
> > > +#define MEDIA_ORIENTATION_EXTERNAL	2
> > > +
> > > +#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Laurent Pinchart
