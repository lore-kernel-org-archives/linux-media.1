Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74F3A59A8;
	Tue, 28 Jul 2026 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785259279; cv=none; b=hRwlT2Td7uCfWWs/STJcNqRh8TOddpoBh7MFOLIHNT7Cbl1Bv6NKUahFogSY0AG4YKne3VmTmJgwHKvUo1t+WxDXhirre/E0XO0YFPSGZ/TSuX2bAQmZM4YYHHv6X5MTB3e6sK2ohnitXn9mzM0PcIR/EYfrYeGp4k1V5OU2LiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785259279; c=relaxed/simple;
	bh=x4mLpA+flPT71kpsh6CGR3R2iecaYErUkqnwQv4fUwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmZ3RJuUXYZ53inbaN1fjjYy6FYux/BJHIREr5w3lRZt9qwUN9L4uQ5KO1OINifGkixcxru/PJOyu6nKwA/4jdylE59QkxLUXfl2CiSjovJ7QLPxRD8k3Tg9SLtK/v3f4RzqAowUfJ0MVVeA4yPMyXqqRJpK5gszDZb1KgcgtwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0vsoduv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0vsoduv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785259277; x=1816795277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x4mLpA+flPT71kpsh6CGR3R2iecaYErUkqnwQv4fUwk=;
  b=I0vsoduvCcFrliDr4t7voeAx1es3PBWSSWcxQSiOAVe6hTeZlT6x4F+c
   WXafejA0hstM7G0QaPFU93aDVUKeG7WIq5pBYvBBNmeHy110i3wmkMq1y
   YYF+K/7dVhv9K2adxPQxGlpwZPwxV8Ri4dw/y8mDndwhzhkF/BENHLfYR
   W9X0CX/NgAzeVirxLz0y70TmEbnYg7H6Ol3MxOFWx7KXyXOBG2/p63e/w
   t167kVsQCk/zMk6KptXOW4bb/hP85W1b9xNXdN5xB4J3SMlT6ksGRUV5q
   7rtxp3/6U6lNNOlgXBpn+ACi6B5KR4KutnsfH4I5CMCeEkGcFMl+OK9/1
   A==;
X-CSE-ConnectionGUID: 50LSdhUNQL+W8/u1w7ABrw==
X-CSE-MsgGUID: vofr7nCPRFKZYPd4R+sgVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96513923"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="96513923"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:21:00 -0700
X-CSE-ConnectionGUID: 3N2SiV7PSn2Bf311FweHwA==
X-CSE-MsgGUID: qeo1z5+gTUWH2rXOjvavFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="259194063"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 10:20:59 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0AE60121C2B;
	Tue, 28 Jul 2026 20:20:58 +0300 (EEST)
Date: Tue, 28 Jul 2026 20:20:58 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: media: fix spelling errors
Message-ID: <amjk-tq0xFMQSKog@kekkonen.localdomain>
References: <20260728145252.9326-1-shaikhkamal2012@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728145252.9326-1-shaikhkamal2012@gmail.com>

Hi Shaikh,

On Tue, Jul 28, 2026 at 08:22:52PM +0530, Shaikh Kamaluddin wrote:
> Fix two spelling errors reported by codespell: a misspelling of
> "there" in vidioc-subdev-g-routing.rst and a misspelling of
> "struct" in legacy_dvb_video.rst.
> 
> No functional change.
> 
> Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> ---
> v2: - use Documentation: subject prefix (Sakari)
>     - use full name in From/Signed-off-by (Sakari)
>     - reword commit message so the media CI spell check doesn't
>       trip on the typo being described
> 
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
> 
> base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
> prerequisite-patch-id: 912014811782d33538ddb17f00b64c15b364425e
> prerequisite-patch-id: ccd9499245f9528a029f13653f6a670c70796caa
> prerequisite-patch-id: dd62b9e9a5a590acea801e33ebcf110932d52a12
> prerequisite-patch-id: 604c7b67fbc5678938599f8dfc11621e9d6e7bad
> prerequisite-patch-id: 76849a9365b2ef77eae25f4ee42c11f124b1ea0d
> prerequisite-patch-id: a0d7b90a4a5e251a58aa682ce414c7048eb47bc7
> prerequisite-patch-id: 0208e7fa539736cc848ac91c09d7ca825b11d8f9
> prerequisite-patch-id: 7b1377967ede9d22f77df0171f54207067158e71
> prerequisite-patch-id: e39888d68322e429ea71d6ed6d49f4295fbbe14e
> prerequisite-patch-id: 7f0dcaca727eb421484eabd62e791b96b3721874
> prerequisite-patch-id: ff5dc6989d168666264e0eae2853f348a95d99b6
> prerequisite-patch-id: 301b88e47a5d4cdc17e2152ebaf134b3f6685902

These dependencies appear to be unrelated to the patch. Can you send v3
without these?

-- 
Sakari Ailus
