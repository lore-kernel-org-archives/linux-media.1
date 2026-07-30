Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2763BBFD5;
	Thu, 30 Jul 2026 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396771; cv=none; b=PbLNTSrOb3TFnc2Be85YJJF4NTn2URiyNyYc9ZJPOfCIdnwkVqi8AWj7PFlcvixR+V4gvOEY+KI4t2WNrKV5NF/iDt6imUwXEBB3vvY3wEBQTMAIbdld0qJwKAx5JwCrFczqstxXkL12ksFqFwwBhzpekibIU+QBgu0FMiBFuuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396771; c=relaxed/simple;
	bh=1GIZMPZ8T2jK1zK4M6RH1Ba83cV29UEe9azN6m1lk1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAcZsYiI6+wR36yH8awCVoAel35Hv+y7NQ5TUR7243yAWOyfmedknzW2MrxqngF8I307NuqxlWR3sRKqxiYP9qRQitbPUfSI2Yzw5vDMzPWh9Y/3A36rixCsPe1TwWx+E5ZlY8HL1EDiQImWW/x7UJAxP2BkmMj6SUfvqB5Vesc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXWDNJUw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXWDNJUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785396769; x=1816932769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1GIZMPZ8T2jK1zK4M6RH1Ba83cV29UEe9azN6m1lk1A=;
  b=kXWDNJUwU1Aszwrzud1N0XGIZG/ZEOOsYWGHZfOXmq6xFJjT76egbfhI
   6gyzDefNYdb06C+c+RgFh+mkeCgG8WVtrGy6K+i02xE7oY6GEF5E4F1QH
   NbqYw0Zb4IZwbosntx3A5pfu1g7JaTZ+xZBNLX/imxswqp3L9JxgbTZ2e
   1/8CtHfsCQwz6LRsB4//mK92zhuhJKQIa8I0875U8pIzua/c3oWjiZRb3
   jRMEkHyXNlwlnUWfm/h7q3WUaPPz0SncWd6JMspxS9AOAXwkWe2tR/F/6
   JqGs+7+7kygbPMry8Vghy1IDTzoI1qe3ALw/LiBt+crPhi2qaZh6sbwIT
   w==;
X-CSE-ConnectionGUID: s79F8RofSZiZkRWo/+84xg==
X-CSE-MsgGUID: SuyiAiLpRKKrSD9kFJ+fxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88548212"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="88548212"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 00:32:48 -0700
X-CSE-ConnectionGUID: bNDmIjKcRHCcqx4zkVYLjQ==
X-CSE-MsgGUID: LlZTETvkQ8uZaTrNXUkJxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="258452661"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.137])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 00:32:46 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5A773121C09;
	Thu, 30 Jul 2026 10:32:45 +0300 (EEST)
Date: Thu, 30 Jul 2026 10:32:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] media: ipu-bridge: Request non-continuous clock
 for ov5693 on IPU6
Message-ID: <amr-HbyocAh4lHSO@kekkonen.localdomain>
References: <20260717132021.18034-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-1-fernandorimoli11@gmail.com>
 <20260720163819.104130-5-fernandorimoli11@gmail.com>
 <13d6659f-4b51-4041-8aff-70b991ac306e@ideasonboard.com>
 <20260720235018.11077-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720235018.11077-1-fernandorimoli11@gmail.com>

Hi Fernando,

On Tue, Jul 21, 2026 at 01:50:17AM +0200, Fernando Rimoli wrote:
> Hi Dan,
> 
> Thanks for the reviews on 1-3.
> 
> You're right that keying on both the PCI ID and the sensor is a bit awkward. My
> reasoning for scoping it that tightly was caution rather than a known IPU3
> failure: I only have IPU6 hardware (Surface Pro 9), so I couldn't confirm that
> gating the ov5693's clock lane is safe on the IPU3 CSI-2 receiver, and I didn't
> want to risk regressing the existing cio2 + ov5693 users (the INT33BE Surface
> Pro/Book devices) that work today with the free-running default.

Please limit the line length to around 75.

> 
> For what it's worth, from the receiver side IPU3 looks agnostic to the flag:
> ipu3-cio2 only consumes bus.mipi_csi2.num_data_lanes from the parsed endpoint
> and programs its D-PHY Rx timing (clk_termen/clk_settle) the same way regardless
> of V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK, it never looks at that flag. So the open
> question is purely sensor-side: whether the ov5693 idling its clock lane in LP11
> (bit 5) upsets the cio2 D-PHY's lock. I can't answer that without IPU3 hardware.

The support for non-contiguous clock isn't mandatory on either side
(whereas free-running clock is and should always "just work") so as a whole
this is weird. But as we know the sensor works with IPU6 with non-continous
clock, that's what I guess we'll just have to do then.

> 
> If your test tomorrow shows cio2 + ov5693 still streams fine with
> clock-noncontinuous set, I'm happy to drop the ipu6_pci_tbl check entirely and
> just request the property for the ov5693 unconditionally in v4 which removes
> the PCI quirk and is much cleaner. (The sensor-driver side already no-ops when
> the flag is absent, so nothing else needs to change.)
> 
> If it turns out IPU3 doesn't like it, then the PCI gate is doing real work and
> I'd keep it, but I can add a comment making that rationale explicit.
> 
> Either way I'll respin once we know. Thanks a lot for offering to test on IPU3,
> that's the one platform I can't cover.

How about adding PCI IDs (for matching the particualr IPU) and flags to
struct ipu_sensor_config? I have a feeling we'll need this elsewhere, too.

Then e.g.

#define IPU_SENSOR_CONFIG_MATCH_FL(_HID, _ID, _FLAGS, _NR, ...)	\
	(const struct ipu_sensor_config) {			\
		.hid = _HID,					\
		.pci_id = _ID,					\
		.flags = IPU_BR_FL_##_FLAGS,			\
		.nr_link_freqs = _NR,				\
		.link_freqs = { __VA_ARGS__ }			\
	}

#define IPU_SENSOR_CONFIG(_HID, _ID, ...) \
	IPU_SENSOR_CONFIG_MATCH_FL(_HID, 0, 0, _NR, ...)

Where _ID is the IPU PCI product ID and flags is e.g.

#define IPU_BR_FL_CSI2_CLK_NONCONTINUOUS		BIT(0)

You could also switch to dynamically assigning the property index so
there's no need to rely on a particular device having a list of link
frequencies. See NEXT_PROPERTY() macro in drivers/acpi/mipi-disco-img.c .
That should go to a separate patch, like adding the above mechanism.

-- 
Kind regards,

Sakari Ailus
