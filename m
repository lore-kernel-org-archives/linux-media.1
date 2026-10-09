Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE764AE129
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544295; cv=none; b=PT5xec9ZNcfyXqbo60+eVXed5QUt0FY3Dl8HuvFtoLYpTfv1ZRrtrENiBw7mnL+mdjS18gL3pLfaF8rQjIbufsSN2+/GnusFSTcPDwvOnSKVDq49Q3Y3CLtXTlosvctoIHunLjflE3JElVBom4clz/qHQjf+/Edx8Nt6B0rpYOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544295; c=relaxed/simple;
	bh=JV+5oIjzLssHddGyHOTV0tpR0+7wpUyX17lDTss5rP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIV50HNA0QnT5MIEyBq3vxUSx+eufJNh0y6ranFveXe9UAeHVK2W0n44ugSNi+ndbcl2i2T6HtFeZHYjYYkB5ZIeMaPr4W7bGR1la96LZmDOXO7M1+3s17H2qShBGrVu/XaL/lQH81X6oKUmDKlv/l1SDay8VKy3n6JQmKxjc5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSDWxAi1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSDWxAi1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791544285; x=1823080285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JV+5oIjzLssHddGyHOTV0tpR0+7wpUyX17lDTss5rP4=;
  b=CSDWxAi1s5DrwRA1lMfx3qXsjAj6FkFzQHrG/wOFpBR8N1ThFEtCha3D
   INLEtHga5qlQOI4bxUDG93nZsCg1mSrBVfw4qgu4vyqn99/iMznhvlkz4
   +KVNjVYGTwcY+J/jxW35j+mb2P141RleXwInQZv2RucFB3iVetYc3thtJ
   KscPjf7fdJ/XGJCYsZfitBf2WWexC42xE6hupNWoNM9ekwk/LvGJ/1ayU
   HE6Az8hZ3PVYIVKceNcInrphcaYcSnHWJyPX/zpFl6GBDsz5LzY8c6SFQ
   U9wkb5UThMcDwNDyvg8f1+uiHo02cohDAntTBOvCuvrcuV5S5CiGXYkbS
   w==;
X-CSE-ConnectionGUID: OHzPYq9CTmuy2glGw1rxew==
X-CSE-MsgGUID: 1ezTEWIMTsyDcsVTuPYFTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="357263"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="357263"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:11:24 -0700
X-CSE-ConnectionGUID: 5VwoVeB4TvucG695RnnCow==
X-CSE-MsgGUID: 99eGmjAqRqeg0lZiNtGu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="300245"
Received: from rpolaka-mobl.amr.corp.intel.com (HELO alaakso-desk) ([10.125.109.76])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:11:21 -0700
Date: Fri, 9 Oct 2026 14:11:17 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: Re: [PATCH 2/5] media: ipu6: Tell about not being able to obtain
 frame descriptor
Message-ID: <asjL1T0LK2F-q_GH@alaakso-desk>
References: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
 <20261008085247.798156-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008085247.798156-3-sakari.ailus@linux.intel.com>

On Thu, Oct 08, 2026 at 11:52:44AM +0300, Sakari Ailus wrote:
> Not being able to obtain a frame descriptor is a fatal error at this
> point. The frame descriptor should be stored for the duration of the
> streaming operation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> index 152545427930..3e9bfda2a8b9 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c
> @@ -749,8 +749,10 @@ static int ipu6_isys_csi2_disable_streams(struct v4l2_subdev *sd,
>  	lockdep_assert_held(&csi2->isys->stream_mutex);
>  
>  	ret = ipu6_isys_get_frame_desc(remote_sd, remote_pad->index, &desc);
> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		dev_err(sd->dev, "cannot obtain frame descriptor\n");
> +		return 0;
> +	}

According to title this is about logging the failure, but now this also
masks the error. Should this tell about the error and take the cleanup
path?

>  
>  	sink_streams =
>  		v4l2_subdev_state_xlate_streams(state, pad, CSI2_PAD_SINK,
> -- 
> 2.47.3
> 
