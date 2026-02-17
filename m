Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C082D3750
	for <linux-media@vger.kernel.org>; Tue, 17 Feb 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771317411; cv=none; b=ilqJa3E+vxIdqkAE2Tgz7G+kkMf6xv5RohaaMg5xvHNm2NSvpk9LKoknVOhUVau62Hud8AWwXTIESRDMMVtoR+hskBweDnOG82qhu85TJEgE5B8npwvNGcCETw3fLPewLHicUBkvsSrwiVjEfvNKDxqYacIlo2PSs/CVNwZIr1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771317411; c=relaxed/simple;
	bh=6IZLt2fGn62NtVQYYAPhH+ZZKGeGFpmxQYiP8YrdIBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW095BzawyiW10KiF6H2VDMWcy26radVHILHu8eQFuz/X+vJnNwjgI+0EjqKL9cBT/CY2s9PFyrOADrwXBEk1+SpZvKwgubTSbxaWmjEABGtI8O8A4XSj48lVW8X4n+w2rlPkUdi82+KWe7upyKs5kMPP/c2u+iJnhK3cM93X3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=APsNHpFX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="APsNHpFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771317409; x=1802853409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6IZLt2fGn62NtVQYYAPhH+ZZKGeGFpmxQYiP8YrdIBg=;
  b=APsNHpFXCYLtWTHoRGnPn78tzUuHDAzvuoFIxnlzQKA0LX9ADbtCErtY
   tRooHNYmY/erve/k905W0/pJDBU6UTOPyY0UIIoXuKMF4qujEq6sW9iyo
   LIYa2UJtsFin4rnfbVv5RUeZrUH4sTqS+e7JOWdqX3Uej9NbsmZVkWCyT
   EFmwltmmWPHcsmmSk7ovdAgqtJel6Dqq17KlVHIoOXaF7q4CjzqMUIqja
   ChXHbeOV1qRuJNAazXrKwwqyXMZmGZbPpCD6fXr2Ld8rVd3ej08L+7GUT
   1ouWoe2OuMQAU5jMFatUVrZM/zlx7CjGzsJuS15ZvsdVapRTbqbo7AIa7
   A==;
X-CSE-ConnectionGUID: ibD5MPRRTGOazeOBvotlHA==
X-CSE-MsgGUID: pU7yfOkRSPOpglYbN3H5HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72283422"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72283422"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:36:49 -0800
X-CSE-ConnectionGUID: 2I+lDmLfQJiAqRUrdkpu8g==
X-CSE-MsgGUID: tageMruSTHu1ouGfPEedjA==
X-ExtLoop1: 1
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.92])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:36:43 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A13E811FC4C;
	Tue, 17 Feb 2026 10:37:05 +0200 (EET)
Date: Tue, 17 Feb 2026 10:37:05 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
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
	"Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v2 09/14] media: Document enable_streams and
 disable_streams behaviour
Message-ID: <aZQosbJprwTSn9aC@kekkonen.localdomain>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-10-sakari.ailus@linux.intel.com>
 <14326b4c-be33-4f0f-9c5d-fe89786004d3@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14326b4c-be33-4f0f-9c5d-fe89786004d3@nxp.com>

Hi Mirela,

On Mon, Feb 16, 2026 at 04:03:40PM +0200, Mirela Rabulea wrote:
> Hi Sakari,
> 
> In the subject, perhaps use improve documentation...as some documentation
> already exists. Other than that,
> 
> Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

Thanks.

I think this needs to be documented elsewhere, too. Generally there's
little documentation on things like this so far.

-- 
Sakari Ailus
