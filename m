Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9323833BBC5
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 22:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784501434; cv=none; b=MHmJYffsgHUPIEGKEEmemrnplbIXJQCj5J6FVw8TeRoOKuAjDb5a2ne+YECJK01IGshZUsouOBw+u8AWxL8jCkF9BjB/iqbVYcj7MXsX8E2jhFjgM9LN0zDFwwoJSAXkX302IPcVGmTyCbjs0sXHRyzqaiSqgjZOqKsHv7ojcIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784501434; c=relaxed/simple;
	bh=0kKbd7PRrYC1eR4rqYrz6x6/P2JSkU+t3CsNSRZlyjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqh03B4refphp2+WWDcGn2JE7PIw2XPf6UlshAqyoz5wQG77OniBVoIAPnKJBaMb7Fw3ZOD1RzXMX2PVgjHqBsEOPC44uM8BY9rH9MAxQL5l3OUAIyRzeDDQ/kyF4hKqw5U0QSRme/SUvsCPPtjLrke+0UGp528sidb1m93PiS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGUM7S3Z; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGUM7S3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784501433; x=1816037433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0kKbd7PRrYC1eR4rqYrz6x6/P2JSkU+t3CsNSRZlyjI=;
  b=jGUM7S3ZzEn9+lsOXwRzOrNrYLZZwDDfblDdNCj7lJL78SHtAMAT+kzS
   CvWgncPB9ueBtFLj9DWDRIjF2dlqXk424p5c2qxVQeZlEZQJuA1HbAFq9
   wCbSaT3UD6rqj/SA9yzJG+u9YmE+UMrXm9zgdBbczYPZi5hACxk2H2mm1
   FdDEDp+pHhkqMsC8qnLAjSLFlH+Ptek3wKnU5wxmZmhvLfhu6oWpHeKkF
   dYbeCey5Fjvc1y1k4T4roGliRtijokjRxWiwAuC+A07MpVvxAeIYVIIRm
   6aQWn3NMDjcyu9SFjinAZpNEkM48Dhz8sN+7ztyg6HUUf6VtUbhsHXT9u
   g==;
X-CSE-ConnectionGUID: KuYNXBnySEyw14PwY5RHPQ==
X-CSE-MsgGUID: 9KX8dLkHRVGd5S8DuheUMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85182788"
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="85182788"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:50:32 -0700
X-CSE-ConnectionGUID: WDJX05qkSludu5gIjSUhrQ==
X-CSE-MsgGUID: R5LIJQ8zTuCPDcWRTOaAAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,173,1779174000"; 
   d="scan'208";a="256726038"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.73])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 15:50:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F367E11F996;
	Mon, 20 Jul 2026 01:50:33 +0300 (EEST)
Date: Mon, 20 Jul 2026 01:50:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH 03/19] media: pci: ipu6: drop calls to
 vb2_video_unregister_device and vb2_queue_release
Message-ID: <al1UufYvdF9tU0wx@kekkonen.localdomain>
References: <cover.1784276382.git.hverkuil+cisco@kernel.org>
 <86049ec7dfa6f3119e7eb61b708703170a92a25d.1784276382.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86049ec7dfa6f3119e7eb61b708703170a92a25d.1784276382.git.hverkuil+cisco@kernel.org>

On Fri, Jul 17, 2026 at 10:19:26AM +0200, Hans Verkuil wrote:
> Both the calls to vb2_video_unregister_device and vb2_queue_release
> are not needed: drop these. The video device was never registered,
> so there is also no need for any cleanup.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
