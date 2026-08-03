Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BF53793B4;
	Mon,  3 Aug 2026 10:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752392; cv=none; b=L4xCgC2eyAUrpCR3JOXmKu06BaL8/eHyWY+rWMPL4lTe4YGl7Q7e36dQgpF+VgImoUOrVNkuHD0G6JQIOoFSeQxeyqd3j+r1ExYg92oIaY/RoCcWCgjRbA6dWoJWnx/rAmSnZXkWGjTvKEmp1wHjW2rlxvmR9OSwXucYct4/ZYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752392; c=relaxed/simple;
	bh=P7+9NEZEolGLBJWTRVVQEhiL6fFr+MxVJ6oQuFEPmsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=air1Rjkc3vHXZP5iqkhY88qzp7NZ+zIQWWS7GLzp/zkNMLU7bPOeTKb4cTdKg0hs8sEjMKvgqZ9mzoaQmI5VoaJ++wp7F6FN09qBaLI7mkLcb+uGkUPO/PY5vYQKzDkN84Nl5XzCerPAZC+bKs0w2XvXjKGDCEwd2PDmNYJ5QQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZnR1ePJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZnR1ePJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785752390; x=1817288390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P7+9NEZEolGLBJWTRVVQEhiL6fFr+MxVJ6oQuFEPmsw=;
  b=XZnR1ePJAsj/0RUO3Sat2q3G8dEwfnc26uvCtpUsQbL5I6D3qYboom+9
   0rumG7w3IBGUE6IhmZli38L3UlXmM6lXQxnpGtHw79OMXem2tHn3e2MEM
   uelb75FbjThd97fy4zsXLixVKeRtobcXoNBMgREHyqDcIGvQX+sL/tFC6
   sNVfTzh9MaVFgrZZu7Km9ObrXneWPnegZfWAIDvxxzbOsiWQ1lO6DVK/h
   wqmobM2M3JzGWBNNXMCuFG0xxgkuEJktCr7qdi2aa33KSP8bkqpXGJjsk
   QX9dbueOAjhs3049JTvXtAoqIuAesuwdkjNO2MepvIBoIgU/kEN7FcqPc
   w==;
X-CSE-ConnectionGUID: lG1jgPStTgqczeSDGAa8GQ==
X-CSE-MsgGUID: GJf2He3gQmW4XRyZKoB0Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86295943"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86295943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 03:19:50 -0700
X-CSE-ConnectionGUID: sKBiBi7dT5ieVfNtdFFvRA==
X-CSE-MsgGUID: /tLcJC6eTeePip6WyCc2Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="259384628"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.14])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 03:19:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 29BC01205B0;
	Mon, 03 Aug 2026 13:19:51 +0300 (EEST)
Date: Mon, 3 Aug 2026 13:19:51 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: media: i2c: Add mira220 image sensor
Message-ID: <anBrR6tkEQ3aYLyj@kekkonen.localdomain>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
 <20260727-mira220-v10-1-8825794e6095@ideasonboard.com>
 <amjAKhNIt0_UIZqt@kekkonen.localdomain>
 <amyxp_U9V1y4gSJ3@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amyxp_U9V1y4gSJ3@zed>

On Fri, Jul 31, 2026 at 04:31:58PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Tue, Jul 28, 2026 at 05:43:54PM +0300, Sakari Ailus wrote:
> > Hi Jacopo,
> >
> > On Mon, Jul 27, 2026 at 10:56:30AM +0200, Jacopo Mondi wrote:
> > > From: Philippe Baetens <philippebaetens@gmail.com>
> > >
> > > Add bindings for the AMSOSRAM Mira220 image sensor.
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > >
> > > ---
> > > v8->v9:
> > > - Make link-frequencies required
> > >
> > > v7->v8:
> > > - Add Conor's tag
> > >
> > > v5->v6:
> > > - sashiko: use 'unevaluatedProperties: false' at the top level to allow
> > >   properties from video-interface-devices.yaml
> > >
> > > v4->v5:
> > > - reflow description to 80 cols and drop |-
> > > - remove 'reg' description
> > > - remove 'anyOf' from data-lanes
> > > - remove 'link-frequencies' from required properties
> > > - remove 'clock-continuous: true' as we already allow all properties
> > >   from 'video-interfaces.yaml'
> > > - remove tabs from the example
> > > ---
> > >  .../devicetree/bindings/media/i2c/ams,mira220.yaml | 102 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   7 ++
> > >  2 files changed, 109 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> > > new file mode 100644
> > > index 000000000000..fa6fec0072ef
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> > > @@ -0,0 +1,102 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: AMS 2.2 MP NIR enhanced global shutter image sensor
> > > +
> > > +maintainers:
> > > +  - Philippe Baetens <philippebaetens@gmail.com>
> > > +
> > > +description:
> > > +  2.2 MP NIR enhanced global shutter image sensor designed for 2D and 3D
> > > +  consumer and industrial machine vision applications. Due to its small size,
> > > +  configurability and high sensitivity both in visual as well as NIR, the
> > > +  Mira220 is well suited for 2D and 3D applications, which include Active Stereo
> > > +  Vision, Structured Light Vision for Robotics and AR/VR.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: ams,mira220
> >
> > I haven't read the discussion on all versions of the set, but this way
> > you'll have to power on the device to fully recognise it, further meaning
> > the possible hardwired privacy LED will be lit at that time. Maybe it's not
> > an issue. You'd likely have it with a CCS sensor, too...
> 
> Yes, we run-time identify the sensor.
> 
> I don't think it's an issue, and it ends up being one, we can add a
> compatible for the mono or ir variants and use this one a the generic
> fallback ?

Sounds good to me.

-- 
Sakari Ailus
