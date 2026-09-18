Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D4842885A
	for <linux-media@vger.kernel.org>; Fri, 18 Sep 2026 20:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789765002; cv=none; b=d4CdqlMs1/PPoX/wZvIiINhgLMZK4NLghWvwTDK2IHmE2/0/r0p0ny5fSbItihZKjYQd2+AoqPBDmqty26WimsTm3eMsXm/qm0ZrJtHyA8E4uPbZWet51cnjfy5OLbmfi5ZDs8EF874mpxO8p3w2YLsbMmdJydgZCqbVVtgiLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789765002; c=relaxed/simple;
	bh=UcF+ymJPY2ByG+ja5cUVPdvuZ6GfcFoG4+fBkuNBLkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYeC4TPU7/RDGJHQmqTWcokdvlwyBg21fTfltl59jpsaXMI9CGjLtWe4AzgZAmVSOryOkktK2E66VTrP29Ark2Z6hQPmG8xzzKmMby5ePXJj7xRn4GFYsV6OYmai4jXtTztDXUb6Ul2neNvWyHKdQpAryFmO4RrMr70Jnqi9To8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmcqE4Lc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmcqE4Lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789765000; x=1821301000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UcF+ymJPY2ByG+ja5cUVPdvuZ6GfcFoG4+fBkuNBLkU=;
  b=FmcqE4Lceye37CROaYtI55srDP2CSlJ55QKwgT9FeAvTXhGDPd0DNOfP
   EI0sRuADSZcrkP7cUjK2x7byBK0CCmx/UnSRo6hZhxUQs2DVB0V7EVjv0
   cFmiGeqsTOttiGCtCOkMfSTYvka4kCd5LboqGs1bv86woLEjDEiY1g79A
   bgq2qshgBwh5VCUayXAFw0KtF0JC7AhI0r+e9LK+3ZID3sO0OndLFxcNE
   A1u1rPLv0pGVbxJdnvh56xU3f/xCNPso4m6fNxbWAM5SCVD5F8+KVbep4
   xbBiiTKCvL3VifWm5DSdfDW71Xl/tixgJaRpwJU7Fb1+6WN5x57q44gRS
   Q==;
X-CSE-ConnectionGUID: gMOrYgTTRIOFJkkKrTLpfw==
X-CSE-MsgGUID: mtrBUCXtQJ65HjxOd3PdnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100963491"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100963491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 13:56:39 -0700
X-CSE-ConnectionGUID: Rg+Zwkl8T3yfdb17kpQ0KQ==
X-CSE-MsgGUID: cF6eGbk4RpWSb1RKgaBRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271923681"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.25])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 13:56:37 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3A3FE11F86A;
	Fri, 18 Sep 2026 23:56:34 +0300 (EEST)
Date: Fri, 18 Sep 2026 23:56:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com,
	mehdi.djait@linux.intel.com, ong.hock.yu@intel.com,
	khai.wen.ng@intel.com, antti.laakso@linux.intel.com,
	manik.bajpai@intel.com, divyamani.tripathi@intel.com
Subject: Re: [PATCH v2 09/21] media: ipu6: Start streaming once all streams
 have started, stop when not
Message-ID: <aq2lgsHkhCYuzInV@kekkonen.localdomain>
References: <20260917113923.59004-1-sakari.ailus@linux.intel.com>
 <20260917113923.59004-10-sakari.ailus@linux.intel.com>
 <178971697984.34231.15295000197727096742@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178971697984.34231.15295000197727096742@gmail.com>

Hi Nicola,

Thank you for the review.

On Fri, Sep 18, 2026 at 09:36:19AM +0200, Nicola Fiorillo wrote:
> Hi Sakari,
> 
> On Thu, Sep 17, 2026 at 02:39:11PM +0300, Sakari Ailus wrote:
> > +static bool ipu6_isys_csi2_streaming_change(struct ipu6_isys_subdev *asd,
> > +					    struct v4l2_subdev_state *state,
> > +					    u32 pad, u8 *vc, bool enable)
> 
> Four things in this function, all found by reading it. I cannot build or
> test a kernel at the moment, so please take this as review and nothing
> more; none of it is reproduced on hardware.
> 
> 1) The error return does not fit the return type.
> 
> > +	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
> > +			       remote_pad->index, &desc);
> > +	if (ret)
> > +		return ret;
> 
> The function returns bool, so a negative errno from get_frame_desc()
> becomes true, and both callers read true as "go ahead and change the
> streaming state". In ipu6_isys_csi2_enable_streams() that starts the

Right; this needs to be reworked a little. I'll switch the return type to
int, I probably chose bool before I realised error handling was actually
required.

> firmware stream and then runs
> 
> 	csi2->streaming_vc |= BIT(vc);
> 
> with vc still uninitialised: *vc is assigned only at the end of the
> function, past this early return. ipu6_isys_csi2_disable_streams() does
> the mirror of it with &= ~BIT(vc). The two "return false" exits are
> fine, they make the caller skip the change; only this one carries a
> value.

vc is actually set if all goes well, so this is related to error handling.

> 
> 2) media_pad_remote_pad_unique() never returns NULL, so the guard below
>    it is dead code.

Indeed. This is where others have tripped, too. I'll fix this for v3.

I think I'll just switch to media_pad_remote_pad_first() as there's just a
single one. The check also can be removed as the MUST_CONNECT pad flag
guarantees there's an enabled link there. Let's see what smatch says...

> 
> > +		struct media_pad *video_pad =
> > +			media_pad_remote_pad_unique(&asd->sd.entity.pads[route->source_pad]);
> > +		struct ipu6_isys_video *av = !video_pad ? NULL :
> > +			container_of_const(video_pad,
> > +					   struct ipu6_isys_video, pad);
> > +
> > +		if (!av) {
> 
> It returns ERR_PTR(-ENOLINK) when no enabled link is found and
> ERR_PTR(-ENOTUNIQ) when there is more than one. !video_pad is therefore
> never true, the dev_dbg() below is unreachable, and the error pointer
> goes into container_of_const() instead -- where av->streaming, a few
> lines further down, dereferences it.
> 
> IS_ERR() is what the check wants. This same file already does it that
> way, in ipu6_isys_csi2_get_link_freq():
> 
> 	src_pad = media_pad_remote_pad_unique(...);
> 	if (IS_ERR(src_pad)) {
> 		dev_err(&csi2->isys->adev->auxdev.dev,
> 			"can't get source pad of %s (%pe)\n",
> 			csi2->asd.sd.name, src_pad);
> 		return PTR_ERR(src_pad);
> 	}
> 
> 3) The lookup on the sink pad, higher up in the same function, has no
>    check at all:
> 
> > +	struct media_pad *remote_pad =
> > +		media_pad_remote_pad_unique(&asd->sd.entity.pads[this_route->sink_pad]);
> > +	struct v4l2_subdev *remote_sd =
> > +		media_entity_to_v4l2_subdev(remote_pad->entity);
> 
> remote_pad->entity is read immediately, so the same error pointer is
> dereferenced here, with no guard to correct.

Also the MUST_CONNECT pad flag is set for the video device's pad. I'll
switch to media_pad_remote_pad_first() also here.

> 
> 4) Unless I am misreading it, the inner lookup in the loop does not
>    depend on the loop variable:
> 
> > +	for_each_active_route(&state->routing, route) {
> > +		struct v4l2_mbus_frame_desc_entry *entry = NULL;
> > +
> > +		for (unsigned int i = 0; i < desc.num_entries; i++) {
> > +			if (desc.entry[i].stream == this_entry->stream) {
> > +				entry = &desc.entry[i];
> > +				break;
> > +			}
> > +		}
> > +
> > +		if (entry->bus.csi2.vc != this_entry->bus.csi2.vc)
> > +			continue;
> 
> The search key is this_entry->stream, which does not change across
> iterations, so entry always ends up as this_entry itself and the vc
> comparison can never differ. The "continue" is never taken and every
> active route is counted, whatever its virtual channel. Going by the
> commit message, the key here was meant to be route->sink_stream.

Yes, the frame descriptor entries' streams was compared with wrong stream,
this needs to come from routing instead. There's also a check missing above
that an entry is actually found.

> 
> Finally, a note rather than a request. After the whole series,
> ipu6_isys_csi2_enable_streams() and ipu6_isys_csi2_disable_streams()
> still call media_pad_remote_pad_first() on the sink pad and dereference
> the result unchecked -- and that one does return NULL. It is what my
> [PATCH v2 1/3] touched. I have dropped that patch and I am not
> reopening the question of the scenario behind it; I mention it only
> because if the checks in 2) and 3) go in, that pointer is sitting right
> next to them.

I guess there are two things to consider here: 1) whether that pointer can
be NULL in the circumstances of this driver (shouldn't be) and 2) whether
static analysers are smart enough to determine the pointer cannot be NULL
(or that there's a bug and we've missed it's actually possible).

I'll reply to the framework patch separately.

-- 
Kind regards,

Sakari Ailus
