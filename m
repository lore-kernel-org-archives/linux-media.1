Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420D0397698;
	Wed,  8 Apr 2026 08:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635513; cv=none; b=VzJ5LDecjBd59bEdz+GsWUfjqDmb5fmJBBm+JwizJOfaP5fqa/qDw0GZ0B2x2nTk4OZQGMaZ+w6czaOwvIyTdUuy0/HvGzVCSsJBw6utURmQa0jRuoBjEGVoEfiSL+oyjYgTzzxSjQufwn2JAQ6bIHOJpgCoirlwFVei48RYTSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635513; c=relaxed/simple;
	bh=LsoItqOaE3hAy7uN2dHO7bdB6DnI0M10PxH+jAAFVN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLZLX6iwdLyeAgU3V2IVjXHLNM+c/KJQF8Nv0LOCYt1KJdSXSKu1l/K5P5M3Irv+g2PkP6o1pvJis2ufaInXIaz6D9fFzIyioD9E/7OVeS+LOMMlVvCj2U/bTXesWowE+2aQCFe6PDSQbEOX+PEtgWBtp0/1pY9eFUWIIE+i1Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2110AsJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2110AsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775635512; x=1807171512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LsoItqOaE3hAy7uN2dHO7bdB6DnI0M10PxH+jAAFVN8=;
  b=Z2110AsJ14G98ZFurUeKE0nJEuJcNiK2iywiFjOaH3ftvslUakkhOKD/
   lLo97GbCWS2e2xwJp6UmzbdLQ7QzaSFhJYsUpdz3ughc06VJ9guWDrsCr
   NNrjDf1qkSVaHRMh/p5Q3QKDLxbO5E7VgvYaROzYoRIcyKTM/zb2PXHlr
   RhSPPFZBnH5qsL42zjx5Newy8PvHMOO16DEAbuaZgBudHeZzR2ZUMFCER
   rgjqat4quZfUo+lMdGQ31xwn6U5+YEWo48WbFmZL39cGnpWyFxuz5s3iA
   R27Xpm8xFRYecwfR/mnhqcD819jXnsyI/YhaYI/w2uI+GfGLiOSF3T46G
   w==;
X-CSE-ConnectionGUID: RDZz8Y8KTbKjZgUijnr2VA==
X-CSE-MsgGUID: YBRGaKuqSLu8537VfKvXmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="79203529"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="79203529"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 01:05:11 -0700
X-CSE-ConnectionGUID: cQSqKE2ERT6zeih3/eSOPw==
X-CSE-MsgGUID: dFTYpTEWSDeViP1x0oSaHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="228657545"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.17])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 01:05:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 058A911F8BF;
	Wed, 08 Apr 2026 11:05:22 +0300 (EEST)
Date: Wed, 8 Apr 2026 11:05:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: michael.riesch@collabora.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2:
 add rk3588 compatible
Message-ID: <adYMQlNtInGYu7Ka@kekkonen.localdomain>
References: <20260305-rk3588-csi2rx-v4-0-81c6bcfefa63@collabora.com>
 <20260305-rk3588-csi2rx-v4-1-81c6bcfefa63@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v4-1-81c6bcfefa63@collabora.com>

Hi Michael,

On Fri, Mar 27, 2026 at 12:10:00AM +0100, Michael Riesch via B4 Relay wrote:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
> the RK3568.
> Introduce a list of compatible variants and add the RK3588 variant to
> it.

Please use your editor to wrap the commit messages in the future as needed.
It became:

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568. Introduce a list of compatible variants and add the RK3588 variant
to it.

-- 
Sakari Ailus
