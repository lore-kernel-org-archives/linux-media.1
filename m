Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774F0441021;
	Tue, 28 Jul 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785245651; cv=none; b=nbIfViaSWE0PXQjMyiVTAMrCAikDsuHcRL/XpGPcW6uGkqmtB7pDYR5PnKRVnt70a1I4SkKBDiU4OZjUlCdixqPq9l4t3j55jnNioL1Bp4oSHS0ohTIFAZtPqleqliBLLMtSC/AhLng84PyM2VTeuMM8G0gGsYJku9+7OJSK2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785245651; c=relaxed/simple;
	bh=B+agX6fAsy+VUlNfvlUip6Z5eFGk2YU4wRWlNUvl+yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlQC7T28uN9Dy0ZU0VOW1FuhVUZQNgO+nNHu8pi4O2spXC63VxJqMZh2QJJUEVgDcFZHZT7PGqSLCv8ML3mWm1qfLn3fg5bZJKuWs9OKtpAUASSW3aE7XU1zAu8g0EgovFrbzFVGNq22e1NoQdUEd7JDqn4k4QikVlPhpw/rMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLEENEwt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLEENEwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785245648; x=1816781648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B+agX6fAsy+VUlNfvlUip6Z5eFGk2YU4wRWlNUvl+yM=;
  b=iLEENEwtpSpu7+FRnycJ5zwDCcUSoA7z8xX728Be2l0sAa/2eo87h3HE
   b571ZI4yV3KerSr2Vuf8ItJb9Rbp6sWDbhwmIlmW+YtChFZeh6DMF9UAe
   VlNzmjhsyFlFfHSF/YqeFo8hGdHl5rhadu4pLmdJaQdvHmzCsdGReE+Od
   EqwMWsGoT6OyRQAuWbKkdFGXB7cE+gr0FZab+NRaaB9E+GPJplaunyZSp
   heim2v2QdaGhNWbprHpLyFae8+ImWarUQyVGQSJ4rxLGMTSl2HSnsctT+
   XKj7dLyqgosbiWCxoRyrWL7OubKnPjk7BGfA7JtyHcr3inJ7u8hiXwFTG
   A==;
X-CSE-ConnectionGUID: a+BjpeDwSTaFfN7Wp/OmJA==
X-CSE-MsgGUID: N5uZZj1LSsaIm8OeSbWV+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="84954502"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="84954502"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 06:34:06 -0700
X-CSE-ConnectionGUID: /Sxn2VWGRRCWQ+OByghgMQ==
X-CSE-MsgGUID: XoTqzaAASCqw5smrA7kXLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="264711936"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 06:34:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A0422121BFD;
	Tue, 28 Jul 2026 16:34:03 +0300 (EEST)
Date: Tue, 28 Jul 2026 16:34:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "shaikh.kamal" <shaikhkamal2012@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: media: fix spelling errors
Message-ID: <amivy2PF7EXVXglr@kekkonen.localdomain>
References: <20260726065407.20766-1-shaikhkamal2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726065407.20766-1-shaikhkamal2012@gmail.com>

Hi,

Please use Documentation: prefix for patches under Documentation/.

On Sun, Jul 26, 2026 at 12:24:07PM +0530, shaikh.kamal wrote:
> Fix spelling errors reported by codespell:
> 
>   thare -> there  (vidioc-subdev-g-routing.rst)
>   stuct -> struct (legacy_dvb_video.rst)
> 
> No functional change.
> 
> Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>

Does this conform to the spelling of your name? Just confirming.

It needs to match From: nonetheless.

> ---
>  Documentation/userspace-api/media/dvb/legacy_dvb_video.rst      | 2 +-
>  .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> index b9fd5cadae24..71d044605315 100644
> --- a/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> +++ b/Documentation/userspace-api/media/dvb/legacy_dvb_video.rst
> @@ -344,7 +344,7 @@ Variables
>  
>      -  ..
>  
> -       -  :rspan:`5` ``stuct play``
> +       -  :rspan:`5` ``struct play``
>  
>         -  :rspan:`4` ``__s32 speed``
>  
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> index 6f66ca38589e..164cf0ad3593 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> @@ -67,7 +67,7 @@ subdevice routing table. This may be smaller or larger than the value of
>  drivers may adjust the requested routing table.
>  
>  The kernel can return a ``num_routes`` value larger than ``len_routes`` from
> -both ioctls. This indicates thare are more routes in the routing table than fits
> +both ioctls. This indicates there are more routes in the routing table than fits
>  the ``routes`` array. In this case, the ``routes`` array is filled by the kernel
>  with the first ``len_routes`` entries of the subdevice routing table. This is
>  not considered to be an error, and the ioctl call succeeds. If the applications

-- 
Regards,

Sakari Ailus
