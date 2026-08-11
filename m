Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5233937E
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 06:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428421; cv=none; b=tgU+hIwIcghr1Ep64HEgzKAalQUXlxdPRXFPPTQ/BcA5vkkSGcq9npUaqHqPpt+vIY2a+pMZmI2CZoJbl+m77QFjqPcrip+9Y26+sGS/ItEBo3HU/RiEi0h+Q+EXxh/jY9ejq+U33GqweEe0TLA/XT6uOSQZrZM2KbtUjzLaDuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428421; c=relaxed/simple;
	bh=J45m1GVs4cF5kTrBuOIssyfpI7a+Q3R+UK6UhD6qnFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jDNoLSHh074V70jeSf5vV3EyCkMb1+k/dg/cQ03dHjXSrEG/i3/EETbcN6c+TMqxPOGOsODQOeFr446O3xqp8zpioYNNrr/ClRASZe/jnUxKXe7EADa7VX8LDUpgu3Clxugu+4u5Ngz6mr5eo/fMrlEmmQKfKgcYsvEDm/WOylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+ls97Sb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+ls97Sb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786428420; x=1817964420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=J45m1GVs4cF5kTrBuOIssyfpI7a+Q3R+UK6UhD6qnFo=;
  b=I+ls97SbUw+smntYQaI+8uCvI7F7v82+Km3LmfGIGI3NhEIj4T5fIlhA
   ldJhXAhGtZMSM0jS1xAPB79vX6aDtvYTE6Z1O1Ts5kU6D+zyLPgThZJNj
   6Ur5AoS+v/Tq9slgAT0M2MugTjchw21Y7lWNLuHAYgmaCbmgxdBldirwb
   8MtQjGkTfhuZ6gTyFmFw+B49f4k0/+tbmQNIx6ZQiKgmFOnprDqKm2UOa
   60NKSD1vdPQ2FLAWhQ4ftO0dYMppMZLUE11GuhlyxSQAhHd67nAgmbFSp
   12enL8NBYoqfKv8idVO55xaarAgQo6Xxs95HdfeJtg1H3+OZT8fAnpdHl
   w==;
X-CSE-ConnectionGUID: JbwAkGUcTm6sNAzqvt2+jw==
X-CSE-MsgGUID: ynrxTGwpS7mBRcQAL+BqlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86712300"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86712300"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 23:07:00 -0700
X-CSE-ConnectionGUID: LP4M6758QA+aIedW158T0Q==
X-CSE-MsgGUID: bYKdUsgJRwm0ylSAHtxpoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="258969441"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 23:06:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A289D11FC6D;
	Tue, 11 Aug 2026 09:06:56 +0300 (EEST)
Date: Tue, 11 Aug 2026 09:06:56 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Jos=E9_Mar=EDa_Mart=EDn?= <jmmartinf@hotmail.com>
Cc: johannes.goede@oss.qualcomm.com, dan.scally@ideasonboard.com,
	mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ipu-bridge: check all DMI entries when
 overriding sensor rotation
Message-ID: <anq8ABtFz54g_yZb@kekkonen.localdomain>
References: <VI6PPFD0A65370F3F49A1C8B719D27C50F3A3DF2@VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM>
 <anmA9lPTuP4gZ7pj@kekkonen.localdomain>
 <VI6PPFD0A65370FCF422FFAE7B31E157D08A3DE2@VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VI6PPFD0A65370FCF422FFAE7B31E157D08A3DE2@VI6PPFD0A65370F.EURP195.PROD.OUTLOOK.COM>

Hi José,

On Mon, Aug 10, 2026 at 04:30:26PM +0200, José María Martín wrote:
> A machine can have more than one sensor whose rotation needs to be
> overridden, which takes one upside_down_sensor_dmi_ids[] entry per
> sensor, all sharing the same DMI match but with different ACPI HIDs in
> driver_data.
> 
> ipu_bridge_parse_rotation() uses dmi_first_match(), which always stops
> at the first entry matching the running machine, so any further entry
> for the same machine is unreachable and only one sensor per machine can
> ever be corrected.
> 
> Walk the whole table and match every entry for the running machine
> against the sensor's ACPI HID instead.
> 
> Fixes: b75710155a82 ("media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors")
> Signed-off-by: José María Martín <jmmartinf@hotmail.com>

I'm adding Cc: stable when applying this.

-- 
Regards,

Sakari Ailus
