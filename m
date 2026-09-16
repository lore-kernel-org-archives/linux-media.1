Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03E419E992
	for <linux-media@vger.kernel.org>; Wed, 16 Sep 2026 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574992; cv=none; b=HX1g4zelatrAD8i8ruzKHy37GG+tLwK1YyEyyYKkFJtqESKD0CYoWyolFQvZR+snzj6NF97pDzQTQWA9/hweqHEYqCGqusLjxFGWwL89Q+o+tSsNYiICjcVP4yO0LAvEWiRQ3lQcQrllFgZWbUfTmph5HzgOyafLWVuLAO3BYQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574992; c=relaxed/simple;
	bh=irhDwE87NapkXSwA7MDc8GPXF/aOoSIbrXPyCz1Nlq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7fjEswE7rs45blyvIamXR2eSyhnf2qNst9Qyre4onPdvhRisVmenANscx9ZUumFg3CCYCl6vMtszmPi+R8Gf/0D9qPISQN75R9dmkASMkYE5ZqZHjDAb6uRPZwCvZp6c1GGqvceX6PFPdd4oWTuf8bl7rmAAEKEQYMtzIBYK84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwqRFA7D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwqRFA7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789574986; x=1821110986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=irhDwE87NapkXSwA7MDc8GPXF/aOoSIbrXPyCz1Nlq0=;
  b=PwqRFA7DdjsZZg9ykLCoDrjnYa+fRbABbeDFltOOaN+Wgw8t1NRwMVEc
   zdE2wspVMJxcA0s93bO9xxuXXEmqxhV3lPVGkpHyuXjPXMe9K2jV78JHA
   zC848/9Z2gWDHvrru43QRbm4GQGzZkyppmTZMj2hRdBzGLcxrDRxLaAv9
   RraoFdDflc+f4/A4eqyUFeNgBkQbfKFp7BNDDhpsDVBSc+AYmEn0PIfkw
   zFyOC+pSD8qyGssjUREw+1JmaW+vFkDxGloCxs+gAWQghYYBVkCZDGWS9
   gs1RrC4pdF4O61cvxTd3K+xXTMba7bt2+fQ12vb269xrlPBGJCPOrMqhj
   g==;
X-CSE-ConnectionGUID: oz5x5e+MTSWVxv+2gRuAtA==
X-CSE-MsgGUID: BiXVQ/GST2a9wR9dtrhtbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100553184"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100553184"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 09:09:42 -0700
X-CSE-ConnectionGUID: RN4Rg+A9RpSww/9YmaPRUQ==
X-CSE-MsgGUID: Ny18UlIZTKiiKCwLMQXFng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276928229"
Received: from aschende-mobl.amr.corp.intel.com (HELO alaakso-desk) ([10.125.108.234])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 09:09:39 -0700
Date: Wed, 16 Sep 2026 19:09:35 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: Re: [PATCH 16/21] media: ipu6: Bridge the gap between streams in
 V4L2 and IPU6 firmware
Message-ID: <aqq_P3pGvZCwqkMQ@alaakso-desk>
References: <20260914205358.735307-1-sakari.ailus@linux.intel.com>
 <20260914205358.735307-17-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914205358.735307-17-sakari.ailus@linux.intel.com>

Hi Sakari,
On Mon, Sep 14, 2026 at 11:53:53PM +0300, Sakari Ailus wrote:
> The stream concept of the IPU6 firmware is aligned with that of the CSI-2,
> effectively meaning that a stream equals to a CSI-2 virtual channel. Only
> start streaming once all streams on a given virtual channel have been
> started, and stop streaming once first one of them has been stopped.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> index e75ae5f5f939..1e29d0acddb3 100644
> --- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> @@ -157,16 +157,18 @@ static void ipu7_fw_isys_put_resp(struct ipu6_isys *isys)
>  }
>  
>  static int ipu7_isys_fw_pin_cfg(struct ipu6_isys_video *av,
> -				struct ipu7_fw_isys_stream_cfg *cfg)
> +				struct ipu6_isys_stream *stream,
> +				struct media_pad *src_pad,
> +				struct v4l2_mbus_frame_desc_entry *entry,
> +				void *__cfg)
>  {
> -	struct media_pad *src_pad = media_pad_remote_pad_first(&av->pad);
>  	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(src_pad->entity);
>  	struct v4l2_subdev_state *state = v4l2_subdev_get_locked_active_state(sd);
> +	struct ipu7_fw_isys_stream_cfg *cfg = __cfg;
>  	struct ipu7_fw_isys_input_pin *input_pin;
>  	struct ipu7_fw_isys_output_pin *output_pin;
> -	struct ipu6_isys_stream *stream = av->stream;
>  	struct ipu6_isys_queue *aq = &av->aq;
> -	struct v4l2_mbus_framefmt fmt;
> +	struct v4l2_mbus_framefmt *fmt;
>  	const struct ipu6_isys_pixelformat *pfmt =
>  		ipu6_isys_get_isys_format(ipu6_isys_get_format(av), 0);
>  	int input_pins = cfg->nof_input_pins++;
> @@ -174,11 +176,12 @@ static int ipu7_isys_fw_pin_cfg(struct ipu6_isys_video *av,
>  	u32 src_stream;
>  
>  	src_stream = __ipu6_isys_get_src_stream_by_src_pad(state, src_pad->index);
> -	fmt = *v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
> +	fmt = v4l2_subdev_state_get_format(state, src_pad->index, src_stream);
>  
>  	input_pin = &cfg->input_pins[input_pins];
> -	input_pin->input_res.width = fmt.width;
> -	input_pin->input_res.height = fmt.height;
> +	input_pin->input_res.width = fmt->width;
> +	input_pin->input_res.height = fmt->height;
> +	input_pin->dt = entry->bus.csi2.dt;
>  	input_pin->dt = av->dt;

Old path for dt should be removed for ipu7 too.

>  	input_pin->disable_mipi_unpacking = 0;
>  	if (pfmt->bpp == pfmt->bpp_packed && pfmt->bpp % BITS_PER_BYTE)
