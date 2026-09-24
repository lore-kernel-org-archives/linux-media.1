Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE50B41DED5
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 10:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245246; cv=none; b=bQpjpxKjK49FDv/NrJqdf+2mEi/fRR6I2KM0HKFdlT8Sg4EjOmhZUs2Hyt96pwJnYv5Z0EARbCFm/M6M6eeaOMU9DCKlqbZ0UoGQw11qjqkmwjCRl0Deqj8O4JOEGGfLMo72BZE1ZZbVf4p68cptfq9qi2nardukOcEI0VFKtBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245246; c=relaxed/simple;
	bh=ELMMF+/oopbzpANQoSi9od0Q3YvEuAblI+8iFV84GCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etEbkjQx3StUIPvEWZq83KMLYPYF0FB3Lo550jZozBjRAqA3vWVHRbdB+y7CkfRhnTHbDD+M9b2Ss97es04z12aAjoTWU2WAzEp6pNNnzs9nbr5MKQcmzcYyc2+hv8hQPdegNeyf03fYee2EP/bLuilcVw1foHIIl8oFgN/AfLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZUgyhAr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZUgyhAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790245242; x=1821781242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ELMMF+/oopbzpANQoSi9od0Q3YvEuAblI+8iFV84GCA=;
  b=EZUgyhArqb+Ys9b7nIePnj0Wa4zAVBY/RbB61oJq2c0/Rwjd8OQ2Bc+0
   4HNSl35AXg2ftTxaobNvphDrprSqFBaauKhwgOpkVR4L4BijYvkrls62D
   WAjr5Be6qkMl47zO4HIQzORACDt8VvJs1+gF0GHLgPACTcC3Ivr1uklxj
   9r8qPo93hJ3Zd8R80o0EZvwcsxp1FXJk3M3jVzW56Xcfh3Cjxjfrk39fa
   ZA8ZGaYNzr11UZJy/aYi+vhZYr7lUgXn3Rqco+y9tTFnGwH8WWDTBnKxH
   ClUAX/AdUreRDB5R4RkyaFKqsIKeNL9r9w5NPPTplaUY6L4QfXDYLRMph
   Q==;
X-CSE-ConnectionGUID: f6ccsqHoTZmHzCaDbTxW2A==
X-CSE-MsgGUID: 2GQxOg9JQSSTfbQXu4S5MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="102370207"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="102370207"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 03:20:39 -0700
X-CSE-ConnectionGUID: AnkKEFeKTfqrcR54fc6j0g==
X-CSE-MsgGUID: VQBSAzkQSLeKBrbqbt1IsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273122193"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.155])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 03:20:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 35A1B11F9B7;
	Thu, 24 Sep 2026 13:20:37 +0300 (EEST)
Date: Thu, 24 Sep 2026 13:20:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com,
	mehdi.djait@linux.intel.com, ong.hock.yu@intel.com,
	khai.wen.ng@intel.com, antti.laakso@linux.intel.com,
	manik.bajpai@intel.com, divyamani.tripathi@intel.com
Subject: Re: [PATCH v3 09/21] media: ipu6: Start streaming once all streams
 have started, stop when not
Message-ID: <arT5dbaH5cWB6-Ul@kekkonen.localdomain>
References: <20260922120538.896684-1-sakari.ailus@linux.intel.com>
 <20260922120538.896684-10-sakari.ailus@linux.intel.com>
 <179017526193.315162.9897874972042062382@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179017526193.315162.9897874972042062382@gmail.com>

Hi Nicola,

On Wed, Sep 23, 2026 at 04:54:21PM +0200, Nicola Fiorillo wrote:
> Hi Sakari,
> 
> On Tue, Sep 22, 2026 at 03:05:26PM +0300, Sakari Ailus wrote:
> > +static int ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
> > +					   struct v4l2_subdev_state *state,
> > +					   u32 pad, u8 *vc, bool enable)
> 
> Thanks for picking up the return value and the inner loop key; both
> read correctly to me in v3.
> 
> One question on the loop, again from reading only:
> 
> > +		struct media_pad *video_pad =
> > +			media_pad_remote_pad_first(&asd->sd.entity.pads[route->source_pad]);
> > +		struct ipu6_isys_video *av =
> > +			container_of_const(video_pad, struct ipu6_isys_video,
> > +					   pad);
> > +
> > +		streams_enabled++;
> > +		if (av->streaming || (enable && pad == route->source_pad))
> 
> The CSI-2 source pad to video node links are created with no flags in
> isys_csi2_create_media_links(), so they are neither immutable nor
> enabled by default, and media_pad_remote_pad_first() returns NULL for a
> pad whose link is disabled. With two active routes on the same virtual
> channel, say one per source pad, and only one of the two video node
> links enabled, streaming on the enabled node reaches the other route
> here, and av->streaming is read through a pointer derived from NULL.
> 
> That does not need anything unusual: it is the multi-stream setup this
> series prepares for, with one of the two outputs simply not in use.
> Even without the oops, that route could never start streaming, so it
> would hold back the first one forever.
> 
> Unless something earlier already rejects such a configuration and I
> have missed it, skipping those routes would seem to cover both:
> 
> 		if (!video_pad)
> 			continue;

Right, indeed that's possible. I'll add the check.

-- 
Regards,

Sakari Ailus
