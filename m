Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430550;
	b=ZQ1fhGZrx4VQel5/VmnsLVhC1ln3ZmZUKJ/vDlOR6LdIACOkY+6959hDekNeaseMajJ2
	 Cw3ND105PkDEGNuN6mqjmBrB3UNfBtKYqJW7vr0+exny4L6+VUg9nNLybXnfqes7g3EhM
	 XHk1IgxBGWvhzzpxqC1wzJx43XnBEbb68lew72gVebCLYvQ4KDEj8x5UyvBtvJj8hO1YF
	 IinTDLUZB/3bHapVl8jsnh0/+iIHEEYoPxKQLE0hCGdy48BsxcjtzoXGnGlCTAk3cm38w
	 li3BlBEty/9Rnr4sYEdDsLWKD8iFFoWfQERFr0AhF/SFzhsise453SArj3XszyzdGjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=v3brPViDlcXh4jdBPnkLkUXXAK6Bh6m1AFJ66HSdYUc=;
	b=VM3UWcqzdPF1aWnQFAbvivJZGNixsYNvepeGknwBRx4DPUylsdQ1fDlWPTd5RCMjKuvL
	 YTdWzyFhj2uKLRsDnxGCB1aqfHGgcFuM6Tv/33tGLiPWC5/lGjtnjaMUMeCw9h4qOOnHF
	 Mpbob52kjQiBb8XA7/GXIFV5oKdvy1NgKgX07b/lNzhMJ2NzTCEzwdD/aj7RRZ3Aa9LTJ
	 JFOhPV/m4pxz38vk8fZHhlLeh4xFffHxk8cf47RbbN2yR2yFwIiGeoFP3q/cPir1USMGm
	 0ZXTUxKm0HDvEnJ6bLQrmhsdRXVAMukCRQ79KXg2PDcYhGkcSMT6dRXv5iCOmV17T2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PJs4giMK;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5211A60A2605;
	Mon, 23 Nov 2026 10:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5211A60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PJs4giMK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795430550; x=1826966550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MVSvmc3RlJ7KVv/V0gixli5mcWzR1R73vzwYA9KN5Ms=;
  b=PJs4giMKQ5ruYDQyDsKm0fvQw3Q5p4KIA1FjYpPu04lQVxdld286ZvEP
   ZH8rSnBJtY/H5Idb0E9RoE06Q96D+Crc8VfpAWNj9aKpVT6+BcvUEhWaM
   /rtbibIbgzU9cRymof/Lv+Ijwas3NI1XvsCYmSKZVW20Qag9IGGrzE6pk
   BJIqiv7MtRu0E7zAIySTmRcGklhEQLh+o6kPICh+ZL0LI0kM0jwdbRzge
   WuWc7u2srvoa/4frjH7dNns6iA9XuL+y5niHIOrKp4p5ADGdFeztBWCed
   xAeXBo7JX4/2izTVKnoEAy7bvUw3WkbiqcYGx2AXghh3W3HsR1tzE4p6L
   A==;
X-CSE-ConnectionGUID: 7icyP/QgRuGLbFczzPotnA==
X-CSE-MsgGUID: +Jenrz0oQDSm9/0tc34RNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4128709"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4128709"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:42:30 -0800
X-CSE-ConnectionGUID: 6YQIn0/YRb+pW/CrJSeADA==
X-CSE-MsgGUID: +3LNSA2PTaa6mn6nXk9uIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11683872"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 02:42:27 -0800
Date: Mon, 23 Nov 2026 12:42:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v11 14/14] media: atomisp: Preserve the capture graph
 when a lens rebinds
Message-ID: <awQYkJLnmiZe9jxg@ashevche-desk.local>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
 <e19d87138eaf283350f85ace17ee9ee4563e9423.1795267528.git.mauriziocasciano7@gmail.com>
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
In-Reply-To: <e19d87138eaf283350f85ace17ee9ee4563e9423.1795267528.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Nov 21, 2026 at 02:31:44PM +0100, Maurizio Casciano wrote:
> The root notifier completes again when the lens subdevice is rebound.
> Rebuilding the entire graph adds the original sensors a second time
> and attempts to register the capture video device again.
> 
> If the capture node already exists and the sensors are unchanged,
> register only missing subdevice nodes. Reject a changed sensor graph until
> the driver is reinitialized. The preceding V4L2 rollback fix keeps
> existing sensor nodes if new node registration fails. The X91L rebind
> trial exposed the original issue. Codex drafted the notifier change.
> 
> Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/2PUHZIDBEIGQKGXTJJOUXXJS2EOEMJGD/

Don't put unreferred Link tags.

...

>  static int atomisp_notifier_complete(struct v4l2_async_notifier *notifier)
>  {
>  	struct atomisp_device *isp = notifier_to_atomisp(notifier);
> +	unsigned int i;
>  
> -	return atomisp_register_device_nodes(isp);
> +	if (!video_is_registered(&isp->asd.video_out.vdev))
> +		return atomisp_register_device_nodes(isp);
> +
> +	/*
> +	 * Completing the lens notifier again only needs a new lens node.
> +	 * The existing graph is valid as long as its sensors are unchanged.
> +	 */

> +	for (i = 0; i < isp->input_cnt; i++) {

	for (unsigned int i = 0; i < isp->input_cnt; i++) {

> +		const struct atomisp_input_subdev *input = &isp->inputs[i];
> +
> +		if (input->csi_remote_source != isp->sensor_subdevs[input->port])
> +			return -EBUSY;
> +	}
> +
> +	return v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
>  }

-- 
With Best Regards,
Andy Shevchenko


