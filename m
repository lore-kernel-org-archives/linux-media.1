Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716584CB8D3
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 11:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544617; cv=none; b=WeywS+vtlSDEzcW6IzJlXcHKIWo8RmlnCnDfrQW8eZBybBPjY6hYPS1ipfwIAGE0RA0kOYcwKYd7ylcZ1NRMKKOMGfNMGS011YYyD0NGcROePjJw+DBYUD11lsXrXT3liPDFob3e/9eOAXEtgyRpuljvUeMgg+rBJc8qCB1UKmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544617; c=relaxed/simple;
	bh=c1+oUDKKUo3Sd8tOrlqn7Wa4oUs1wkRtJ33C2W6B9oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTcTuwMu4pCQItplbY+MQs23H5KXtax5MxV74zQwo1tyIh88G6Xv9FkoqfvW7aSnfpw2zhelCatxNaDGuKl0e7J0YWTey5i1rCvWFtmDihcW6kkDApqeLUZXz0elnCkdUq8PL0rIIjR8MtyuUymsDF90cR+fdRuho4NXASZvEmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kAosDATR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kAosDATR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791544600; x=1823080600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c1+oUDKKUo3Sd8tOrlqn7Wa4oUs1wkRtJ33C2W6B9oY=;
  b=kAosDATRkdgWmJd8OzMAShmZYBUfWyArNNG+aUcbUVgnzHaGHCyft3oT
   2LgOYvUHh8ma/uKEa7jEQgZTtod98VoRvqYDSGzoM34E5PBgXsjp0YBHr
   ZTtjui3fCGc3fVigvUYVVSmpb/rEWvAWhwOdHfKOVuTuJFHdfMYFTS5OS
   eekpRhmOc+m5mNLLVmpdPWOHWDYo1wKn04SUF7b8MVtsdfTEyMsN+t0Fs
   G1DK0DmVbr9QOqC++UGjRtClq0Hls3phtIikPrA82aZ0/bqmDS2zI/I4i
   ZUURm23JJWDqQYGFUo+w5Gt2E46up6VMgKZ02MxPrb/+Ym3FI8njIE/rX
   A==;
X-CSE-ConnectionGUID: e0JjLLgFT1qdFgeJ8Fos8A==
X-CSE-MsgGUID: McDFhuH2RAKhS7ebBPrMvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="357608"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="357608"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:16:39 -0700
X-CSE-ConnectionGUID: jSlfEYv5QVSUuz/SoOitng==
X-CSE-MsgGUID: L5kAdckUTseARKaQw7BdVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="230938"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:16:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4C576121BA6;
	Fri, 09 Oct 2026 14:16:38 +0300 (EEST)
Date: Fri, 9 Oct 2026 14:16:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	"Bajpai, Manik" <manik.bajpai@intel.com>,
	Divyamani Tripathi <divyamani.tripathi@intel.com>,
	"Sapre, Sarang" <sarang.sapre@intel.com>,
	"Yao, Hao" <hao.yao@intel.com>
Subject: Re: [PATCH 3/5] media: ipu6: Prevent starting streaming if ISYS
 needs reset
Message-ID: <asjNFg2lrkhnih8I@kekkonen.localdomain>
References: <20261008085247.798156-1-sakari.ailus@linux.intel.com>
 <20261008085247.798156-4-sakari.ailus@linux.intel.com>
 <asjI-C0a13tS567g@alaakso-desk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asjI-C0a13tS567g@alaakso-desk>

Hi Antti,

Thanks for the review.

On Fri, Oct 09, 2026 at 01:59:04PM +0300, Antti Laakso wrote:
> On Thu, Oct 08, 2026 at 11:52:45AM +0300, Sakari Ailus wrote:
> > Fail starting streaming whenever ISYS needs to be reset to resume normal
> > operation.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > index 6596833e95d4..978acbd72e63 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> > @@ -481,6 +481,11 @@ static int start_streaming(struct vb2_queue *q, unsigned int count)
> >  		av->vdev.name, ipu6_isys_get_frame_width(av),
> >  		ipu6_isys_get_frame_height(av), pfmt->css_pixelformat);
> >  
> > +	scoped_guard(mutex, &av->isys->mutex) {
> > +		if (av->isys->need_reset)
> > +			return -EIO;
> 
> Shouldn't this goto out_return_buffers path as well?

Yes, I'll fix that for v2.

> 
> > +	}
> > +
> >  	remote_pad = media_pad_remote_pad_unique(&av->pad);
> >  	if (IS_ERR(remote_pad)) {
> >  		dev_dbg(dev, "failed to get remote pad\n");

-- 
Regards,

Sakari Ailus
