Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C1B37649B;
	Tue, 21 Apr 2026 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776789454; cv=none; b=bJPnzHQwYZDB/egqLtQuq0/t0bwsszSdgxXUt5+C2JVUZWT+/UqjcFUBKYFvi5qVtIZP3AtttHfVLcNZkwmST6karAJ36fLE4IOECoMGlWonWJGpluJekNN35AMcrRHkrREfNWNE6PCUiz6dWTuQS7MNaM79d78mBBIPOxzc1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776789454; c=relaxed/simple;
	bh=R5alldSDRaKVEhe2Uk1gKPGpl5wXB885qizXcCP1QO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWrTTwvwy/Cque2hjrQY2TAy52ZW9M6meO9RlJijvLJPaE1tFjRU2j59u2wYPAwHXL3HehSXAqqElr3fXDG1LDIR6+n8u0/moKxVtY64bS79aCxHCZaq6whUpX5kbTOtVXzudaVSpBOiYvhMmsVoGVZ7B49pKg8xNqCBBt7jEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8A/aIPx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8A/aIPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776789453; x=1808325453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R5alldSDRaKVEhe2Uk1gKPGpl5wXB885qizXcCP1QO8=;
  b=P8A/aIPxlRtPr2wCOHzUHsaqwvubMTD2LxpuhvlJExYekT8VM5YMrBCp
   sDVR/UlRzwOZaKGEzdEg3rUNpgb6BqcxLf8sDJiBzeFjN/7c88VgkVyYI
   LGF97J1t8kRg5gqsADoxSO20FnZuIejHT8gkjudYWMPwUuWEk2HYVckKT
   JWFRe+HC3Ee+lAmuBw3B7CvLMD1WpJZ3WeF/vcEutZy7R3dw+Zuoisp2N
   4EGl6qIpJHlkX1aqMVatGUy6FhZekHIDawnMstYIoysZJWNTphYgP/M7/
   OTk71uGRCwGTLnQb+2MhHyfoCa2ewhLRDz/qbQwePGGCk5QSoVYCvBtvS
   Q==;
X-CSE-ConnectionGUID: on1jify1SlSzpV2T+p4xZw==
X-CSE-MsgGUID: qYDmxZuZQDKWslcLCU+zjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77432051"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77432051"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:37:33 -0700
X-CSE-ConnectionGUID: mJQhu5nFSyCURevavog8Nw==
X-CSE-MsgGUID: p9hd9qiwTvWM7waqENkpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227463311"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 09:37:30 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 03999120D05;
	Tue, 21 Apr 2026 19:37:29 +0300 (EEST)
Date: Tue, 21 Apr 2026 19:37:28 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sunny Patel <nueralspacetech@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: v4l2-subdev: Removed duplicate lockdep
 assertion
Message-ID: <aeenyJ7u0o2wis4G@kekkonen.localdomain>
References: <20260406122346.GA1268443@killaraus.ideasonboard.com>
 <20260409171705.8737-1-nueralspacetech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409171705.8737-1-nueralspacetech@gmail.com>

Hi Sunny,

Thanks for the update.

Please always set the version of the patch if not the first.

On Thu, Apr 09, 2026 at 10:45:23PM +0530, Sunny Patel wrote:
> Removal is only required afte state->pads for stream_configs since
> state->pads only represents the static array so not required locking for
> it.
> 
> 

Extra newline.

> The __v4l2_subdev_state_get_interval() function has a duplicate
> lockdep_assert_held() call. Removed the redundant assertion.

Please use imperative when describing what the patch does.

> 
> Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
> ---

Please describe changes across versions, at least from the previous one.

>  drivers/media/v4l2-core/v4l2-subdev.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 32e6f60e26c7..4616e9280a28 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1843,8 +1843,6 @@ __v4l2_subdev_state_get_interval(struct v4l2_subdev_state *state,
>  	if (WARN_ON(!state))
>  		return NULL;
>  
> -	lockdep_assert_held(state->lock);
> -
>  	if (state->pads) {
>  		if (stream)
>  			return NULL;

-- 
Kind regards,

Sakari Ailus
