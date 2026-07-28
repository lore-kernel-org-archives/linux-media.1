Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A0645348A;
	Tue, 28 Jul 2026 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249841; cv=none; b=HsPY3aMZAdIxMcEskCIfTVWm27EXaMNmc/NABoMviCeI1cqabVBXk5YvoncPAOcxyvaekrM4gDtLEiAEFHtUfd9v7IxsCu4e5h7z6xgfyX2gpaKj91QJKWDXtK6QNYdhmj5wHvbJJGNkKUnYQIfES9OyGg6WaKd7UpXSKYYbnIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249841; c=relaxed/simple;
	bh=YWQNWevA4HX4T4faPfwmY/KTdxQZTQLcbyHno4CQs2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J01Psbo7kf3NVincbNeVFmWv0DSpsc0WCidb+GLYM+CX9yLgsIH5bF9YgKeNTYmqN3izTxu+q0UfXCiV42uCvenDnfL37khFABnl9X3d36bhU5ByPgkdKh0HDxiR9uAOrApxpFoFJQUe15qrSCx6fls0BcJooIP8hicecxpdWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hINOR36T; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hINOR36T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785249839; x=1816785839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YWQNWevA4HX4T4faPfwmY/KTdxQZTQLcbyHno4CQs2o=;
  b=hINOR36TIiadQ7GkEPNXY7pi6QfyB5ey0xYgMoCni4+en4hhLS2+tJf/
   n/pu5eIlzFC2qbgxfUlewKzvpLBRuSxabxEQ4mW5zyEAKy0jsUQx+76KW
   z6duPphFTJjKFQIeVruhsaBwAa3BLpUjPaPrrYPgzL52NO2DQjw6FpAJj
   6m675jTjz1DdVYSf9R7bdaN2hYznlPZ/WI+HQfVbV9yrf1/y5dvUae32J
   LhpaAAXqXNQMB23ucIxHSDv2TzJ0oypy/IzszXrtvf33oDrc6iMRDjPYl
   GhoMpwd1A5SnXujGXIEXqU9XMZExCvnYj3M2udhXM+9pyPXuH14NfMNJ2
   g==;
X-CSE-ConnectionGUID: 1gXOZlrpQAa9WSbkw7mP8Q==
X-CSE-MsgGUID: C8uqWJm6STGrJ7mm2nTpxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85954316"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85954316"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:43:58 -0700
X-CSE-ConnectionGUID: +DuOp/ZmSgCZ2nNjj6og9Q==
X-CSE-MsgGUID: C21xIU8dQWeIG0HuTFLrdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="289676016"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 07:43:55 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 807A5121BF9;
	Tue, 28 Jul 2026 17:43:54 +0300 (EEST)
Date: Tue, 28 Jul 2026 17:43:54 +0300
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
Message-ID: <amjAKhNIt0_UIZqt@kekkonen.localdomain>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
 <20260727-mira220-v10-1-8825794e6095@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-mira220-v10-1-8825794e6095@ideasonboard.com>

Hi Jacopo,

On Mon, Jul 27, 2026 at 10:56:30AM +0200, Jacopo Mondi wrote:
> From: Philippe Baetens <philippebaetens@gmail.com>
> 
> Add bindings for the AMSOSRAM Mira220 image sensor.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> ---
> v8->v9:
> - Make link-frequencies required
> 
> v7->v8:
> - Add Conor's tag
> 
> v5->v6:
> - sashiko: use 'unevaluatedProperties: false' at the top level to allow
>   properties from video-interface-devices.yaml
> 
> v4->v5:
> - reflow description to 80 cols and drop |-
> - remove 'reg' description
> - remove 'anyOf' from data-lanes
> - remove 'link-frequencies' from required properties
> - remove 'clock-continuous: true' as we already allow all properties
>   from 'video-interfaces.yaml'
> - remove tabs from the example
> ---
>  .../devicetree/bindings/media/i2c/ams,mira220.yaml | 102 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 109 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> new file mode 100644
> index 000000000000..fa6fec0072ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ams,mira220.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ams,mira220.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AMS 2.2 MP NIR enhanced global shutter image sensor
> +
> +maintainers:
> +  - Philippe Baetens <philippebaetens@gmail.com>
> +
> +description:
> +  2.2 MP NIR enhanced global shutter image sensor designed for 2D and 3D
> +  consumer and industrial machine vision applications. Due to its small size,
> +  configurability and high sensitivity both in visual as well as NIR, the
> +  Mira220 is well suited for 2D and 3D applications, which include Active Stereo
> +  Vision, Structured Light Vision for Robotics and AR/VR.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ams,mira220

I haven't read the discussion on all versions of the set, but this way
you'll have to power on the device to fully recognise it, further meaning
the possible hardwired privacy LED will be lit at that time. Maybe it's not
an issue. You'd likely have it with a CCS sensor, too...

-- 
Regards,

Sakari Ailus
