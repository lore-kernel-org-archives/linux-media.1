Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA584B672
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783167322; cv=none; b=TkhK3aolP/kGMvYA/GgnS8TVjsL/AU3N2poy7yeYBkARY9W4MWdoCXT7MPfnTVRMD4NOsUZP3Nk9nvEM3Reu8dQWWBqMFNXQ/Puo7uBj34dNeyawz8w2U4eguyhUL3YQACkR1IQV1lb2q6SlzSznsZ8FhVL38shFEiDlSfYTIFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783167322; c=relaxed/simple;
	bh=bkWiDDC34T8hEu5bjc+D5YiypGloBKYY/SCufkCq0uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4yZFsebqUu6x5gem30jZPl9gxpQHMNeiFr7qQZsbChpE6gEYttDtvRZuPc/ZAyJx2oFeuEZgCEf88q/iJ3VZPFItkWpFHqN/x8BmDE2nBof/6P3n1Ffj9mjPj0CuAZoF2eDWcJfmztn/l4Nkj2w4UwblXWpynl6CPwq78joyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D9GoMt/X; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D9GoMt/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783167321; x=1814703321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bkWiDDC34T8hEu5bjc+D5YiypGloBKYY/SCufkCq0uo=;
  b=D9GoMt/XFm54gC20cyRbv0pf1Qkbl1DE+SIsSD2ky6TuPbr5fV1mURK7
   +iL+X/R07vxVVHz1QMAt2VJjwoH05GN/RW0X4K12O+lQgsUpdo3s8fg79
   d+Be47ue0j7GtC4u2023NIJOq9A9J1Z8LJlmvdmGOVgpYXcGJK4j1wKqs
   Q/dDeN7WQUFhjDGBYYYJh/NJgcBAde74XONjWp9C/oyQVj9T8Z+ZScXFB
   o3+zq1kC97A5h3qRURxjVU7Ub5bGFKPED52u2bdi9VDqrIwqLBWWQs2VG
   f4Y1C2s4XFYsqwMziSWu9v+kBMHBtzj/U/XupDbcQcLXZM/anme6QZuXE
   Q==;
X-CSE-ConnectionGUID: AC/hKIh7T7ufRIPxQRMeew==
X-CSE-MsgGUID: 8kul9o65T+O4oyJs15eiAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83971720"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83971720"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:15:20 -0700
X-CSE-ConnectionGUID: +AH4+H8IT4qB9FI3n4xqOQ==
X-CSE-MsgGUID: Xada18xmRAyyBqg4Nv2kag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="258194617"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 05:15:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32FA0120221;
	Sat, 04 Jul 2026 15:15:13 +0300 (EEST)
Date: Sat, 4 Jul 2026 15:15:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v6 09/16] media: v4l2-subdev: Always call get_fmt() if
 set_fmt() is unavailable
Message-ID: <akj5Uc6BCloMfotp@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260701122634.1728782-9-sakari.ailus@linux.intel.com>
 <akVDYmAnEckbecpA@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akVDYmAnEckbecpA@lizhi-Precision-Tower-5810>

Hi Frank,

On Wed, Jul 01, 2026 at 12:42:10PM -0400, Frank Li wrote:
> On Wed, Jul 01, 2026 at 03:26:26PM +0300, Sakari Ailus wrote:
> > Many drivers implement set_fmt() pad op that simply returns the format
> > just as get_fmt() would do,
> 
> Does get_fmt() do actualy thing? according to naming, it should just
> fetch some information.
> 
> If only fetch information, set_fmt() can do nothing, why need call get_fmt()?

Most drivers that support a single format (largely some trivial
register-list based sensor drivers) use v4l2_subdev_get_fmt() as the
set_fmt() pad op callback. There are also drivers that omit this
altogether, making VIDIOC_SUBDEV_S_FMT return -ENOTTY. Beyond that, as the
client_info argument will be added soon to set_fmt() but not to get_fmt()
pad op, v4l2_subdev_get_fmt() can no longer be used to retrieve the format.

This patch aligns the behaviour so all drivers that support set_fmt() do
support get_fmt() as well and remove some driver code in the process while
addressing the third point above.

-- 
Regards,

Sakari Ailus
