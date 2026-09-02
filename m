Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2948CD5B
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 12:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350434; cv=none; b=Ji6Jb4h7fmpmT6gGnnZR4RCCZpEWY1vI6Kj54yjt74IPcFkMKkYUKHr47jIBq0ez/W+LFiyP+ksJLEVX7Mbpzejn7FLAZgWhs/0e8FON6PTW7OM8I43MR6fOp98t8E0fSKu0tBGxasPMomi34t5r+4aBwNt3LlbE6UCcFwIGULs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350434; c=relaxed/simple;
	bh=Mn69PH6qcptMySrNp0lBX45wj+FOduxJhOmGT6Sy3Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMgG+BqQ3AuDZZWrA9LKXbzQpbqt7nX6X/PmfA8yVJbitSlkhE1tFyJ3VAaCTUzmczzAcp90VH2UcCLLCzOTDfyGzxTkpqJPdH/vRaky9DtOcWPNsho2hnDNzt0wqJTRA9K3S2WREJfYTOaHUl/O3uUmylW9UstzpieW/+tuYgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRueTSy+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRueTSy+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788350428; x=1819886428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mn69PH6qcptMySrNp0lBX45wj+FOduxJhOmGT6Sy3Ik=;
  b=TRueTSy+7XNJSo7Hh0D60gPWCzRjC7rHxmxWgBlWXcw2/hqSfPq76qRd
   I+9XOaOU9yOvTocweTnooNbgPVpXJPIf3gn0hgwwqveL7Y7byD3Y51vkY
   WSsbJOV9nJZywLv6HMOHucxJE1YbQm91JGlJ1DKI2Aad/Io0JBPLJv4jv
   0pbZmu40s5HYl+8T5ufS6lsj28N54OspEp4SG/KiZdQGwoymPnpAMyU2k
   mo+esJKWtLoh/f6PoTcpo7fc9zSnRlVENkoTqJtCZsrXClD6JXQjbC/lY
   Jla4lt7M7E3NYpiOBHaIO8cnAkF4h1u1tj3tl6TPp7ULlQVzrpI1dC+1C
   A==;
X-CSE-ConnectionGUID: EVMFaIeZTYOahY4/rOoLxQ==
X-CSE-MsgGUID: MPMgPF9gQN61L78CU4AUTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88929101"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88929101"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:00:21 -0700
X-CSE-ConnectionGUID: 5DwrgcV9TYy7wycEn61kYg==
X-CSE-MsgGUID: BboLmqO0SqO2tQnwVbBmNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="307604159"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 05:00:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3697712150E;
	Wed, 02 Sep 2026 15:00:13 +0300 (EEST)
Date: Wed, 2 Sep 2026 15:00:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>
Subject: Re: [PATCH v3 03/29] media: v4l2-subdev: Prepare for changes in
 getting frame descriptors
Message-ID: <apgPzfbXwuTzOWFJ@kekkonen.localdomain>
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com>
 <20260824121451.3348583-4-sakari.ailus@linux.intel.com>
 <CAD++jLkwEpCx-Y5iRuR9Dy9gKaCAx+pRtL_K=0PhXoRXSk2O4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLkwEpCx-Y5iRuR9Dy9gKaCAx+pRtL_K=0PhXoRXSk2O4Q@mail.gmail.com>

On Mon, Aug 31, 2026 at 02:44:44PM +0200, Linus Walleij wrote:
> Hi Sakari,
> 
> I missed this:
> 
> On Mon, Aug 24, 2026 at 2:14 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> 
> > +       if (v4l2_subdev_has_op(sd, pad, get_frame_desc)) {
> > +               unsigned int type = desc->type;
> 
> That's an enum according to the header.
> 
> enum v4l2_mbus_frame_desc_type expected_type = desc->type;

I'll use that for v4.

-- 
Sakari Ailus
