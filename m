Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C92025B090
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705654; cv=none; b=W8K2MEypEUpy6I2QaIe3k2c/JCAaVe9OFLYOghGA38jM36e63DNv3mXqACnwHbmGpKCDVsZtyBoxbkd4SuEeXLroAEfjnNHr5AkZV/6MMHatpx1OHJ7E6OEffppxNyjVKURYbBebwYSm8rFTWBhPMbUM5vNxogNBr8Yk9FjENXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705654; c=relaxed/simple;
	bh=o9ZeKwZHD/pRpVPS5dgW27NUdPAW2RySWxdg4ZmTF9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgFIGlqvYNQs/4q0DeZerEGRaZkSnfoZUjhtmp1BXsXWNtPC2FJN9dnvxeNr8snGvQacTlNMfonnkjTMvKLDOkK33+KuNiwfiGArJeIdfroRfd0QTxFBIV/3nUeh9XYXUtIiEQub61k43qI1hsTqyDVzVn5sJfgTWKkUk2hRQRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifFWkGQk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifFWkGQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778705653; x=1810241653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o9ZeKwZHD/pRpVPS5dgW27NUdPAW2RySWxdg4ZmTF9o=;
  b=ifFWkGQk3ObksJyTH45Y+nkeKcjKKZ62+GEprAfCOwhg2ZZuAXMcScuh
   9j/tiisvnOvJG/o4/flJexWNWg5Kv8oTSGdOpItzfA+7cg6BAwv7ixXxo
   /ToTgSstHHdk7zyLehPu7nKWMWPcGTFkDKwN5RBJpqLtM3JvzotQYHh9G
   rtClebvOM/zlrBipzUx3jfI3xt+1pp/OrqBPMPlwlISZygOvVOqCZ6EG7
   PKatJwcOsV0w8nLKKXGWs6X1LxSVgJYK5eKlydzFGaRNdZgpP9OSxHjNR
   QQiJ6VWGwAFSazS3PBBzc2lmnTzlGjbLlq2bdgFhBDNdX8NnBkFyc2N1l
   w==;
X-CSE-ConnectionGUID: iFo47idQSn+EUgxIZd6A1g==
X-CSE-MsgGUID: QrYX4xEwTpGAwiGUeImhfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="105101417"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="105101417"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:54:12 -0700
X-CSE-ConnectionGUID: fvx8CdOLT26yyPnSSq9g4g==
X-CSE-MsgGUID: TbYV2iKyTRaS0dTRPxY5eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="243176136"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:54:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 45108121C9E;
	Wed, 13 May 2026 23:54:09 +0300 (EEST)
Date: Wed, 13 May 2026 23:54:09 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 01/17] media: v4l2-common: Add mipi_csi2_dt_for_mbus()
Message-ID: <agTk8YL_OC7lwHLq@kekkonen.localdomain>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-2-sakari.ailus@linux.intel.com>
 <agTjDhLt3in_apjf@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agTjDhLt3in_apjf@lizhi-Precision-Tower-5810>

Hi Frank,

On Wed, May 13, 2026 at 04:46:06PM -0400, Frank Li wrote:
> On Wed, May 13, 2026 at 01:43:42PM +0300, Sakari Ailus wrote:
> > Add mipi_csi2_dt_for_mbus() for obtaining the MIPI CSI-2 data type (DT)
> > for a given Media bus pixel code.
> 
> Thanks, I worked similar version before.
> https://lore.kernel.org/linux-media/aP+isGnWmJ4tLXcs@lizhi-Precision-Tower-5810/
> 
> strange, I have not find updated one, I remember I posted.
> we may need more information, such as bpp.

Ah, I remember this, too! I'd prefer your patch in fact, but it needs some
cleanup first. I'd be interested in seeing the lost updated version of it.
:-)

-- 
Kind regards,

Sakari Ailus
