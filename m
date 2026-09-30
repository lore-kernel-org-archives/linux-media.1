Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76823451A9
	for <linux-media@vger.kernel.org>; Wed, 30 Sep 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762022; cv=none; b=GsbYiXsAkCJ8mxIYTrNaiqnZ5bbUAHNU0vJiEL/o1ACy3mz/nJE0kFMskcclrdk39F8NeTAdhvNeTMaQGKhmt5walIQjDDYZzSs5/OzqfbrzgECYhEtwXbIUo4b+gclmZSDYCMfFofyaxk6G/iEMx3sbIqUbZkHL3qZwwpeVuTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762022; c=relaxed/simple;
	bh=XqSP9cRQc6xyR82jnTKWti0ll3jSNdU5UOJuK4Vokhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M48DcVzOC0Jl6XDDFsm7CnGV/XUvWD3MaRHvJRCE5xsgp/SfRN5UAZvy/Bpjxld3RTL1x9W3SUVGbfBOEVp+DG/YNo30Cdih0qAkCYc9mAvlW+wKyZ8/SQSqcqQaicnD9rw6m8rqBhNPKljLBvIRbB15b03JfQofMlsMdjn+kpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJicEJW6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJicEJW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790762021; x=1822298021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XqSP9cRQc6xyR82jnTKWti0ll3jSNdU5UOJuK4Vokhk=;
  b=RJicEJW61+NW/KPAsiD8T5dVXuEToB9BOEEyfnWlQ4Bca0Hez3vKNlT1
   KT0/cVlxqYx/rWYn9LdkjeS/Mr0uo22984zXrRtfA72mXo3Dt/XeNWUg5
   B0EF8W7huQr4XywJkAO1yymvXMR3sDW104Tn9DqdUxlSrVFfzT9HapQZy
   /JIU1J5kjcHceB6ZMp7EsDtsboiYIxjPNeNqsHPfTU+bcTdXOCk10/pAm
   RmkyFf0B7uBVoY/A5zSG71Zzp86ny3jYwXsek/Sx9sDDwKpVjx56ew1ah
   INFIqe92LyMdQlCcKpxUKdfK3NsnF6T0FmjAZBctFD4KydjL2a6waC/3L
   w==;
X-CSE-ConnectionGUID: FPlsMcNOQCiz40jn3/ApNQ==
X-CSE-MsgGUID: BPCPPe5MS+yRMHkozPO7/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102868359"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="102868359"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:53:40 -0700
X-CSE-ConnectionGUID: uj2d1OotTsO0vgDLyXgWRw==
X-CSE-MsgGUID: +OgVN1O8QbOMV/T7rEJVOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="278987380"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO alaakso-desk) ([10.125.111.150])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 02:53:38 -0700
Date: Wed, 30 Sep 2026 12:53:34 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Sapre, Sarang" <sarang.sapre@intel.com>,
	Manik Bajpai <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>
Subject: Re: [PATCH v2 0/2] IPU6 fixes following multi-stream support
Message-ID: <arzcHg1Ull7T8vOI@alaakso-desk>
References: <20260930093709.2625661-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930093709.2625661-1-sakari.ailus@linux.intel.com>

On Wed, Sep 30, 2026 at 12:37:07PM +0300, Sakari Ailus wrote:
> Hi all,
> 
> There's a small but important fix for the ipu6 driver's ipu7 support -- on
> ipu7 streaming works only once, and apparently this is because the ISYS
> needs a power reset between streaming instances. The patch addresses
> detecting this, which got broken in the multi-stream support set.
> 
> The second patch adds a warning on needing a reset.
> 
> Addressing why the reset is needed is out of scope of this set.
> 
> since v1:
> 
> - Just print the message when setting need_reset to true.
> 
> Sakari Ailus (2):
>   media: ipu6: Reset need_reset in ISYS suspend
>   media: ipu6: Warn if the active list isn't empty when returning
>     buffers
> 
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 2 ++
>  drivers/media/pci/intel/ipu6/ipu6-isys.c       | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> 
> base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
> -- 
> 2.47.3
>

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com> 
