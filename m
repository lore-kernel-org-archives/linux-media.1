Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125201;
	b=RO67MRTZ63WLpsEU24JTGYFYZ41YMgD/yXsXBqh3+lWPp48EzlEafaRhfciBMT1Ckahp
	 FYoAnBX7VREImlT+cGsFt3oWGNiZcw74fgGrdLQqhovY/dzvGXtiYJKBbwxW7vqdDRSGS
	 1XUaaQocCHaBwwx0d0ROZKNFeG1gicsyYuVpiT7KB2iOZozluqYVZ5vZroo3VlGapahJr
	 jlpZh4FBE4+Jtr2Dy8V/kJyVerGstfVt1CSCAMnfJTpnDhpXWW6mev7a1MWKsLGA+5aQy
	 YZsPcGZQUNLX3KYunSDNWTfMUWJHWCcGWqVJkeoYjrJKAs+8tRg3WuwwXlUVqUDP5NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125201;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zxsejDMXy3b8JN2b8ZGVshPylRw+4jYLo55cSsxUOCQ=;
	b=rUbGpcXzcFnf3UYVQORLv4hFRSDpcLqUh54Ud+KbL62Rzmc+9nI0G2RWmIaHiU6Xxns/
	 NaZb0Tn4+rFwd60eKAMOEF9vvRWIDyJHK9RVO8TEAgT4q0qYMVDljsZ9h54Rtiv5hErcj
	 uMVCn8LVbFzmXfa5qnSZRnh6rPRVgoFqPK5EXHzQXEx5kwiDLda84OahcVZ4p75lkYui4
	 r94mlVI+hdyfPPC2WoshSG9FpCEiWRkKYhOyjtjmhGDiQ3f/RCJWBQD8ziWa6i/+butMW
	 8VtwaOp58QMHPFDu5YB/cxvIi0R3CDffHiCaToFw8l0s5ayewWLB8BfzGdo1/3NP0lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="KzG6UM/v";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8328606A320;
	Thu, 19 Nov 2026 21:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8328606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KzG6UM/v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795125201; x=1826661201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MULnZxuGB+gctiBjMEdbjc6VlUOfpZ24GX4HL7Pe8sg=;
  b=KzG6UM/vVdpBo07UBS3UzUv0BsL0oIDPlmSpdX6nO1ch2S6ESNDGxlVq
   4OLF2is/KbmXpY1Skq7hZ48UW2qE0b+ZNe7yzj+iu0aEtko272Tr6CUhY
   I4eBow2Q/gkydwgzmb4htc+RLBxbx+bxel27GZ4tZX1Gt4XRI8xhtAet1
   P6M3c1GGRZCOeC+wcyQ3rcZ1iuP3G3Len3ilsKk4nvWflToJD2xgbeStD
   JZdnirDa2IePq8PhtSsac4Zvk2dsuiQvwyDW4LWbw1xOfeBtkxlSN32fT
   BuFohnKFCAoHt3cFKj4NZ5eNjoWXLc+RvNfWzgUQc2QF0DNJw621WU2MP
   A==;
X-CSE-ConnectionGUID: mjt4hf1yTqykeEdFqsYaAg==
X-CSE-MsgGUID: VxJ1LWJUQPClukc8JAtZlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4074115"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4074115"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:53:21 -0800
X-CSE-ConnectionGUID: MjNLGoo3Rqm5WDUhFt/H4A==
X-CSE-MsgGUID: DunXhLtUQbq8+ZB/qOyoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10453599"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 13:53:19 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 53A63121B5E;
	Thu, 19 Nov 2026 23:53:16 +0200 (EET)
Date: Thu, 19 Nov 2026 23:53:16 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: armandas.kvietkus@proton.me
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Message-ID: <av9vzLSureeB4j41@kekkonen.localdomain>
References: <20261117-upstream-s5k3t2-v5-0-1f7f5fde9e2a@proton.me>
 <20261117-upstream-s5k3t2-v5-2-1f7f5fde9e2a@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-upstream-s5k3t2-v5-2-1f7f5fde9e2a@proton.me>

Hi Armandas,

Thanks for the update. A few comments below...

On Tue, Nov 17, 2026 at 09:20:05PM +0100, Armandas Kvietkus via B4 Relay wrote:
> From: Armandas Kvietkus <armandas.kvietkus@proton.me>
> 
> Add a driver for the Samsung S5K3T2 20 Mpixel CMOS image sensor.
> 
> The driver supports three modes. All of them are RAW10 on four D-PHY
> lanes.
> 
>   5184x3880 at 15 fps, link frequency 448 MHz
>   2592x1940 at 60 fps, link frequency 448 MHz
>   1280x720 at 120 fps, link frequency 300 MHz
> 
> The pixel clock does not change between modes, so the pixel rate control
> is constant. The frame rate follows from the line length and the frame
> length.
> 
> The controls are exposure, analogue gain, horizontal blanking, vertical
> blanking, horizontal flip, vertical flip and test pattern. Rotation and
> orientation come from the device tree. Power is handled by runtime PM
> with autosuspend.
> 
> The register tables come from the vendor camera firmware. They were
> checked on hardware.
> 
> Tested on a Xiaomi POCO F3 with the Qualcomm CAMSS driver.

A lot of this should go to the cover letter.

> 
> Reviewed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |   10 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/s5k3t2.c | 1327 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1339 insertions(+)
> 
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index d04bd5724552..9a25d8200b65 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile

...

> +static int s5k3t2_check_hwcfg(struct s5k3t2 *s5k3t2)
> +{
> +	struct fwnode_handle *fwnode = dev_fwnode(s5k3t2->dev), *ep;
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus = {
> +			.mipi_csi2 = {
> +				.num_data_lanes = S5K3T2_DATA_LANES,
> +			},
> +		},

Does the sensor support other number of active lanes than 4? Very probably.
But this isn't reflected in DT bindings (and it should be).

> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	int ret;
> +
> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != S5K3T2_DATA_LANES) {
> +		dev_err(s5k3t2->dev, "invalid number of data lanes: %u\n",
> +			bus_cfg.bus.mipi_csi2.num_data_lanes);
> +		ret = -EINVAL;
> +		goto endpoint_free;
> +	}
> +
> +	ret = v4l2_link_freq_to_bitmap(s5k3t2->dev, bus_cfg.link_frequencies,
> +				       bus_cfg.nr_of_link_frequencies,
> +				       s5k3t2_link_freq_menu,
> +				       ARRAY_SIZE(s5k3t2_link_freq_menu),
> +				       &s5k3t2->link_freq_bitmap);
> +
> +endpoint_free:
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

-- 
Regards,

Sakari Ailus
