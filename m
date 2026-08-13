Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F33F58CA;
	Thu, 13 Aug 2026 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786652054; cv=none; b=rHdwfZ6r7fX5yNTzPrjIaaNQ3lv1G5wldeW6BlfxSHIF8pPP/5wDovnRRG8IdiAFtbkY8X38RRJgaF8fz5eyRwo9yzOc45aytoRh9Cr/5octpbXMSyLbjBv5PqbrMFAGj3RHMrNYys4Pl3UlBxAZQ68w22Mb9FVkuQeLjv5wsNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786652054; c=relaxed/simple;
	bh=r4910BkcK42st2IVUo6/i5/kM7Pbnx5CFbbtpgSRnhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahrVTJ/jFAReoEz2P5yVPoZvJwJqJqv6A1ekHsMKlO4aNiIEMYkiwtQfxMZTo+JU//4lQ9Gezpr7QRx3N5aM5k+NoByULFqn9iNKfzD8E2yQ7EK8vFdv1AKwGYuKlcbARRl+9I0Htb1TpnkbK8R+9sbKWmoElMhBkC7NWlQWW/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CDndoeMM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CDndoeMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786652053; x=1818188053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r4910BkcK42st2IVUo6/i5/kM7Pbnx5CFbbtpgSRnhQ=;
  b=CDndoeMMnha40HwJ49eNK2yIh3HB1LpDjS4bq1ZRJI7jhID7AF+LufRO
   F0HXH77jtE0yO1E+k3TX/AEdiVNyOEBM6t7qskmmt0VZV7On7kcRpzF98
   Wm8GlQpSflgaL9/D3D7RL6A8Jyr1hI1S2+peyqq7QbyJN/16vJND5qbVK
   GGvzilcBNOYd9YljXB3lSgNXlvRBg9kZkhADxE0ioE+B9QT7k1Tje2hAV
   gnDAdJkQZnarXOjX0vdhkMUl2HTlheW9mUeF8mK9Oz4D7GsCvOgKLgTgR
   7q7yqgpowMUy44RCzwiAHNBL39Vp5OzWpi6VzxxtfcwoHGZzna+ic5FK+
   Q==;
X-CSE-ConnectionGUID: ZK+r8621Tf6ZkKPaxGim+Q==
X-CSE-MsgGUID: Yj735fwTRYuDQK+DE/DMFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74774345"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="74774345"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:14:12 -0700
X-CSE-ConnectionGUID: nLhvjLDTRXix9qMQlqHgdQ==
X-CSE-MsgGUID: VOqSNKPjQEaE3zLz+Q0RpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="269222354"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.129])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:14:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AFDD4121BF3;
	Thu, 13 Aug 2026 23:14:09 +0300 (EEST)
Date: Thu, 13 Aug 2026 23:14:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Vaishnav Achath <vaishnav.a@ti.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@linux.dev>,
	"Kumar, Udit" <u-kumar1@ti.com>
Subject: Re: [PATCH] media: i2c: imx219: Implement .get_frame_desc()
Message-ID: <an4lkcWsB0rPFOw9@kekkonen.localdomain>
References: <20260813-imx219-frame-desc-v1-1-2a22488a0535@kernel.org>
 <892b7261-16b3-40f7-ae31-af9bb483a27a@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892b7261-16b3-40f7-ae31-af9bb483a27a@ti.com>

Hi Yamike, Mattijs,

On Thu, Aug 13, 2026 at 09:12:03PM +0530, Yemike Abhilash Chandra wrote:
> Hi Mattijs,
> Thanks for the patch.
> 
> On 13/08/26 20:41, Mattijs Korpershoek wrote:
> > From: Vaishnav Achath <vaishnav.a@ti.com>
> > 
> > The next subdev in the media graph may want to enquire information such
> > as bus format, virtual channel, bus data type to route the stream from
> > this sensor correctly.
> > 
> > Add support for sharing this information using the .get_frame_desc()
> > callback.
> > 
> > Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> > Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
> > ---
> 
> FYI, similar variant of this is already posted by Tomi recently [1].
> 
> On that patch, quoting Sakari [2]:
> 
> "I've been recently working on
> <URL:https://lore.kernel.org/linux-media/20260518164318.3367888-1-sakari.ailus@linux.intel.com/>.
> In other words, drivers that have a single stream don't need this. We could
> probably extend that further by making use of the routing information but I
> think that should be left for later."
> 
> I don't really know the status of that series. I will let Sakari to comment.

Good question. I think it'd be nice to have it merged. Laurent's opinion
was the frame descriptors should be part of sub-device state. I don't
really disagree, but moving them there is again an overhaul of that
patchset. If the set isn't merged in the near future, we'll see a large
number of driver specific implementations of both different frame
descriptor functions in sensor drivers as well as receiver drivers
preparing for sensor drivers not supporting get_frame_desc().

The current implementation has issues especially in cases where frame
descriptor has dependencies to upstream frame descriptors. There aren't
many drivers that do that though, but in these cases it has potential for
re-requesting the same frame descriptors rather many times. I wonder if
that's something that could be addressed later though.

-- 
Kind regards,

Sakari Ailus
