Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99BF485924
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 12:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165064; cv=none; b=k5S4v3fT8yzsqUJIWIY6Cmp23+ExhawDBb0TVB/Dr8PcuGzShm6zJT0wanG5JjOXNZQG1LNsa6bP9+M4gLYjnYkofJGrbD7bvyz7Si+2j9Z1cXNqmQWYR+T6kE7XH/l/u73Pbr28AGlsP7pimK4kJTfHON6bIu+gJAtBdraomYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165064; c=relaxed/simple;
	bh=ru2rdN4kCK5Nlc42ov0F8nre+hIU16qP/i8GSzwWTIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL7P0P+98HkeHnpLyk2D0Bevjo2JFXwwOeGyEGkhd8SuCZWCkQ4DaMfxJrRoSdBaASILYRjEjucG4/+iMjxDG0icqfEE7+Q1iLiMxRhuvRBpYWu3lpyNKWGjbnGV03sry40LZZFBaZLOWYLssuywsVBQnebcLbwxajPtL+RrRmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wu9P1wrr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wu9P1wrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790165061; x=1821701061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ru2rdN4kCK5Nlc42ov0F8nre+hIU16qP/i8GSzwWTIc=;
  b=Wu9P1wrrlZj5XCoiTAmxl9zDTPedySDYWUZeDOIbthkFjJbi3LbXMEnI
   r1WTX9Op71FZCt0va4tfPndLwPzQj7imLhTXuFxdQofB9gMqPwuKsLm+h
   TN61l/cA+jnFTqpoPoDj/b0w/x2yryDhDR9pFJeZmJxTNCFhKxZeYsWpB
   oPzpSEfLSrG8e/DhQ92sBEtLwdx7G2qlNlFu7nRV7SkJ7GFYTGgjwNAFd
   K9Mxy3YfDiWhtk26pNfHmYWuX5P09yf+agUZ6rFVlsoFprPFuEEedX11S
   uCkCJTQo0W5tQMe8WzdY9rkHtQxYeLNEMSm5ccp1MbIWDn0l6aXcu4UTI
   Q==;
X-CSE-ConnectionGUID: qf1bLJErRH2SGZmKKVGluw==
X-CSE-MsgGUID: VL1Ar0fKTMyrbE41IA0q5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="102207960"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="102207960"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:04:21 -0700
X-CSE-ConnectionGUID: no5VAYpPQcuNgjiS4sxDUg==
X-CSE-MsgGUID: kMM+n84eTAyxsQWc33SKyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="273760084"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO alaakso-desk) ([10.125.110.99])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:04:18 -0700
Date: Wed, 23 Sep 2026 15:04:14 +0300
From: Antti Laakso <antti.laakso@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	Nicola Fiorillo <nicfio@gmail.com>
Subject: Re: [PATCH v3 00/21] IPU6 multi-stream and metadata support
 preparation
Message-ID: <arPAPjKrkqOHYS5L@alaakso-desk>
References: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922120538.896684-1-sakari.ailus@linux.intel.com>

Hi Sakari,
On Tue, Sep 22, 2026 at 03:05:17PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> I split this set off of the metadata series as it seems it can be merged
> early. Basically, it prepares the ipu6 driver for streaming multiple
> streams from a single source, when the rest of the necessary patches are
> merged.
> 
> All the patches in the set can be found in my metadata branch. This set
> possibly depends on the metadata preparation series
> <https://lore.kernel.org/linux-media/20260914114145.574791-1-sakari.ailus@linux.intel.com/T/#t>
> I posted earlier today.
> 
> since v2:
> 
> - Fixed handling failed streamon, i.e. propagate the error in that case.
> 
> - Rework return values for ipu6_isys_csi2_streaming_change() in patch 9.
> 
> - Fix inner loop stream check in ipu6_isys_csi2_streaming_change(), in the
>   same patch.
> 
> since v1:
> 
> - Fix intra-set use of v4l2_subdev_get_frame_desc().
> 
> - Address Antti's comment on assigning dt for a pin (fw term) from struct
>   ipu6_isys_video. Remove vc and dt fields from the same struct, too; they
>   were redundant.
> 
> Sakari Ailus (21):
>   media: ipu6: Fix releasing resources at failing streamon
>   media: ipu6: Move streaming control to CSI-2 receiver driver
>   media: ipu6: Stream number on CSI-2 receiver source pads is always 0
>   media: ipu6: Rename misnamed out_free_watermark label in video init
>   media: ipu6: Always request a capture ack
>   media: ipu6: Clean up link frequency calculation
>   media: ipu6: Get watermark configuration directly from ipdata
>   media: ipu6: Collect IPU streams into CSI-2 receiver sub-device
>     context
>   media: ipu6: Start streaming once all streams have started, stop when
>     not
>   media: ipu6: Add lockdep checks for CSI-2 streaming enable and disable
>   media: ipu6: Remove nr_queues and nr_streaming fields in
>     ipu6_isys_stream
>   media: ipu6: Collect enabled stream IDs
>   media: ipu6: Avoid accessing av->streams before streaming
>   media: ipu6: Rework watermark calculation
>   media: ipu6: Rework watermark setting
>   media: ipu6: Bridge the gap between streams in V4L2 and IPU6 firmware
>   media: ipu6: Drop {get,put}_streams_opened()
>   media: ipu6: Serialise access to stream pointers by isys stream_lock
>   media: ipu6: Move firmware init/cleanup to RPM callbacks
>   media: ipu6: Don't track power status, rely on runtime PM
>   media: ipu6: Support upstream sub-devices without get_frame_desc()
> 
>  drivers/media/pci/intel/ipu6/ipu6-fw-isys.c   | 103 ++-
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c | 380 +++++++++--
>  drivers/media/pci/intel/ipu6/ipu6-isys-csi2.h |  13 +-
>  .../media/pci/intel/ipu6/ipu6-isys-queue.c    | 130 +---
>  .../media/pci/intel/ipu6/ipu6-isys-queue.h    |   2 +
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |  22 +-
>  .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   2 +
>  .../media/pci/intel/ipu6/ipu6-isys-video.c    | 642 +++++-------------
>  .../media/pci/intel/ipu6/ipu6-isys-video.h    |  61 +-
>  drivers/media/pci/intel/ipu6/ipu6-isys.c      | 212 +++---
>  drivers/media/pci/intel/ipu6/ipu6-isys.h      |  52 +-
>  drivers/media/pci/intel/ipu6/ipu7-fw-isys.c   |  78 ++-
>  12 files changed, 743 insertions(+), 954 deletions(-)
> 

Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>

> 
> base-commit: aedd77ea8168f00687c1248cdf115071e869cf93
> -- 
> 2.47.3
> 
