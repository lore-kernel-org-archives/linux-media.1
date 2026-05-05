Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217517080D;
	Tue,  5 May 2026 23:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778023836; cv=none; b=MkTKvLfA7MRM86Gq12R+A6g3FL/5sN6v8+9wYmgkdEYPo5rFclahikbCc98Xp/O3u2RnJanvABWjGyufe0VRJ/XF8B1vbSLZ5DIck3RBqYeQ7lv381P68yPVLjJILNFSXDMv4ggkzb+zTjXNE7m6t24y59rzMhkPoN7KWLoI8q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778023836; c=relaxed/simple;
	bh=jfba1FUJr5IYEQ0/wIyPjceGv4ZgR9wAsIYNOtF4tDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovokH872xDPoGCWgODSe4k/I8yK4GKv1RlkCKd2dh3xdumhfTecULyu33utmmwLu1zIS9e8A+K/5PVY6/+uXcTtHxBw/P9RevE4Ooq3wf+DwrApznTzFOYGlulHnnURoo3GKTNM53eeh/CLfA4I8olMAGnZVkraWN+QVDLr35QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EA4rmnVZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EA4rmnVZ"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABEF35B2;
	Wed,  6 May 2026 01:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778023830;
	bh=jfba1FUJr5IYEQ0/wIyPjceGv4ZgR9wAsIYNOtF4tDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EA4rmnVZscE4Ul946oD6gh/mNWHAuqlS5zWLRsfRW6rVg6xQJIcFeS+7jjh9PfoFu
	 706t6UImEStYrNK5m+9gK6/2G0a5WVOf9mJNOTek2l8TQ2IB7GJsCbDDqaRYgFVmq6
	 trqaigPq+Zo6oNav4wFJJj8Uf2adYcm3AtVKpvwY=
Date: Wed, 6 May 2026 02:30:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common
 video device properties
Message-ID: <20260505233032.GH1598374@killaraus.ideasonboard.com>
References: <20260406081330.30362-1-clamor95@gmail.com>
 <20260406081330.30362-2-clamor95@gmail.com>
 <20260416214025.GG1824072@killaraus.ideasonboard.com>
 <CAPVz0n0uEsJg94GUky8cF7LNpejfpYxY9vLCY1iv5HYoxE_WeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0uEsJg94GUky8cF7LNpejfpYxY9vLCY1iv5HYoxE_WeQ@mail.gmail.com>

On Tue, May 05, 2026 at 08:29:30AM +0300, Svyatoslav Ryhel wrote:
> пт, 17 квіт. 2026 р. о 00:40 Laurent Pinchart пише:
> > On Mon, Apr 06, 2026 at 11:13:30AM +0300, Svyatoslav Ryhel wrote:
> > > Document common video interface device properties, such as rotation and
> > > orientation.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > ---
> > >  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > index e896f4db2421..2b39614f5cbf 100644
> > > --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> > > @@ -15,6 +15,9 @@ description: |-
> > >    an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
> > >    CSI-2 connection.
> > >
> > > +allOf:
> > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > +
> > >  properties:
> > >    compatible:
> > >      enum:
> > > @@ -90,7 +93,7 @@ required:
> > >    - vaa-supply
> > >    - port
> > >
> > > -additionalProperties: false
> > > +unevaluatedProperties: false
> > >
> > >  examples:
> > >    - |
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
> 
> I am looping in Sakari since they are i2c media devices maintainer and
> this patch touches i2c camera binding (get_maintainer for some reason
> did not include them).
> 
> Hello Sakari, Rob!
> 
> This patch hangs in the LKML for quite a while, and if no one has any
> objections may it be applied?

This should normally go through Sakari's tree.

-- 
Regards,

Laurent Pinchart
