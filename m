Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45DD286409;
	Tue, 14 Jul 2026 08:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016921; cv=none; b=Kcte6J1XET8gQf3WYPGxrmpWQBWce08Azwqx+2P1fyXlyVxqrqRnL6Z5yqgGql/VFj5wa0975c5O7N4O4VdPYU1Q78pjXu4CJMT0g9FsfMlehk9jDcer2uVhRiRZEdtWJ5mFgtFbAwOF1we63XGdmiDFxsbzZ9Vwf89fgVTTEeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016921; c=relaxed/simple;
	bh=mH5ovusdX2PkuFsDOJP/5IHW9PCLk6DvxtbTbPvIkT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQYdMMPdKHnDkM6qkWg8fkgadFlLz31A+q9P/AuZAGWazgt3ZKJnHncBfix5+i+RCe1n9cvO7XVar7ZI1jUjN+fTRe+c707dPOhCbBPm5QJGmbY3r2eTfMsyE9ulP+sxCmhf6zD8DuJ70Q3GJKbNEw67xt6lHSVlKHqg/OaaPt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PzrAcsxX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PzrAcsxX"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 289DB6AF;
	Tue, 14 Jul 2026 10:14:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784016863;
	bh=mH5ovusdX2PkuFsDOJP/5IHW9PCLk6DvxtbTbPvIkT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PzrAcsxXKw6HNKl8DAAVGIKJWGnVwSjRgXAGYPC6469KkOLNYgBQmzH0SBun8PCeh
	 8I6HyFTH1zIxxj1Vg4ruIb7yQkMyNmwLhNrSHVeFjPF9DIEFeLieWVEXYdb3gNbPfU
	 EahnWAy1a8RwX3b2Pe0IMQLKrn7zoPnKCmU2L9gM=
Date: Tue, 14 Jul 2026 11:15:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>, linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Subject: Re: [PATCH 1/1] checkpatch: Deprecate V4L2 pipeline power management
 code
Message-ID: <20260714081515.GM1127719@killaraus.ideasonboard.com>
References: <20260713161327.3682-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713161327.3682-1-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Mon, Jul 13, 2026 at 07:13:27PM +0300, Sakari Ailus wrote:
> The V4L2 pipeline power management code, in particular
> v4l2_pipeline_link_notify(), v4l2_pipeline_pm_get() and
> v4l2_pipeline_pm_put() are deprecated and shall not be used in new code.
> 
> The drivers need to use the Runtime PM instead.

I'll be happy to see this API go, so we certainly need to make sure no
new drivers use it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  scripts/checkpatch.pl | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2b7a42bbdd94..a8a7374dc9c4 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -879,6 +879,9 @@ our %deprecated_apis = (
>  	"DEFINE_IDR"				=> "DEFINE_XARRAY",
>  	"idr_init"				=> "xa_init",
>  	"idr_init_base"				=> "xa_init_flags",
> +	"v4l2_pipeline_link_notify"		=> "",
> +	"v4l2_pipeline_pm_get"			=> "",
> +	"v4l2_pipeline_pm_put"			=> "",
>  );
>  
>  #Create a search pattern for all these strings to speed up a loop below

-- 
Regards,

Laurent Pinchart
