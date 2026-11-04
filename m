Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782501;
	b=NVQsvG9A2s6e/9XTd+6Zx2J7LxtdvKaLKxsDIPY7TEJdRnziK0XvNeRhvzJBhmaERUQi
	 dc84fRVOGbPqqALgX676vStAt+Bhy+aUQhBGbKHSJVD0bnYCg8Oqt6ngO2jG6kr3MOmst
	 Y9M0i9ZJWvP552Vt7wwnElRNrG1xmSmPYlBUfuJ7Jx8WXrfvQOZ+LvMUmWUpMevSxMXOw
	 x9uEIX83yZC0jVeIG79VXjz2rPwfm0rer7DmDkTbfm0ksh6f64NV928HngZP/0ZT3pV/F
	 FD2EHGufYxkBez3Dzmdf6XeE3sR8dTPhihiCXanq/Jaf9ZFPk+o9BXrOx1Qzjzotfag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782501;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=xrorufp9f2BwtYd+6SNWRFCnpUSOdqI305o+LM/1Ijg=;
	b=RCfwlI4y4zvzXfnYhpzAcT/pApYsSqk6bOXlnypqr2OPduRZUJo/Rxg/goe7ot827F4N
	 x9dlhAQ4PInhFMS0k3+J6eDGEfgUr4EZZmcRi0Zvz+spYtlxO+gFYhifyXrfptTUD94Aq
	 mt/heRsv5qWCe4nvt4Ze0HRhhP/YMrfhiEJCKE1y38BhjnKFLxFpW6lBZA/7kwg4kIJzY
	 OvVrHmCB3o44F5dwJulqoF9qDyDe1Xlm5dTfZ8mIsZqZkuOVY6ot0Rw0cGfQ2LxAafUHN
	 OATG5sYCwcR7ywtCCYUETnFwoSf2CSKPvs+id5W5Uo6ifuUqclq/kPbD7v0WuWHHucg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c4sJ+Tes;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFBF606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 08:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CFBF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c4sJ+Tes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793782501; x=1825318501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0UHZ7naUwerfFESRA53Gbhz8vHkhBMuTdWDGyBLYbck=;
  b=c4sJ+TesFP+hubtzG+9+2FSmd5YzhBNSpawriY5WAknWA3eLpbL4AtVh
   w3jmbbv1z34HWvUNvcYuEyUkSRyBGDNAWVBkfJ2+51Zn8uDUt0vW9sqHM
   cU+/uRbkF+fwYeoG0Zug9o6PkZSDJ9p5Zv9pvu57IHI8EPTU7Fb5FBiUo
   jfUHAzb+X4UzhfnQQQv5dHejwnF+ugQrMw0HOFFVUwN6OumdydpuY31fw
   iVjw+PYP5dHcLfsQdzudsz3cCK+fyfmL2W5zzAlcU6V1JG+KxSUcBm+LT
   k32ezB+t9CoBrTZablw1C+GIroGuJuTYC9P6VsYJHUfyFxhBEVoeoBhWs
   A==;
X-CSE-ConnectionGUID: 6jk2dZW6QBG9IqCtGwsFoQ==
X-CSE-MsgGUID: 4Xc16/q8S0us8eQ5bO55wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2429349"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2429349"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:55:00 -0800
X-CSE-ConnectionGUID: lbhlx68+QqSMqr7HrVqPug==
X-CSE-MsgGUID: X7FjGb1EScGdj53tClSWrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6683753"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 00:54:56 -0800
Date: Wed, 4 Nov 2026 10:54:54 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 12/12] media: ipu6: Enable IPU4P PCI device
Message-ID: <aury3n59VFnmKprr@ashevche-desk.local>
References: <-VmuiglzUKRQZr-LsGrxgUOui_lD6A5MFZSUaqydvel67SrRKztah31JBIbpXna3-DHv20o_UoRPGoRRaM8JylV21MwjO-VMYJk-TuSCD34=@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <-VmuiglzUKRQZr-LsGrxgUOui_lD6A5MFZSUaqydvel67SrRKztah31JBIbpXna3-DHv20o_UoRPGoRRaM8JylV21MwjO-VMYJk-TuSCD34=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Oct 31, 2026 at 12:39:09PM +0000, Ruslan Bay wrote:
> Add IPU4P to the PCI device ID table now that the required MMU,
> buttress, firmware, ISYS and CSI PHY support is in place.

...

>  	help
> -	  This is the driver for 6th, 7th and 8th Gen Intel Image
> -	  Processing Units, found in Intel SoCs since Tiger lake and used
> -	  for capturing images and video from camera sensors.
> +	  This is the driver for Intel IPU4P, IPU6, IPU7 and IPU8 image
> +	  processing units, used for capturing images and video from camera
> +	  sensors.

Make the text user-friendly, almost nobody understands this cryptic text. It's
unuseful. On top it's inflexible to the further possible expansion. Compare to:

	  This is the driver for Intel image processing units,
	  used for capturing images and video from camera sensors
	  on the following devices:
	  - Ice Lake, ... Lake (IPU4P)
	  - Tiger Lake, ... Lake (...)
	  - ... Lake (...)

As you may see the user who is going to buy a laptop may have a clue
of the Ice Lake and other code names and zero understanding what the heck
IPUxxx means.

-- 
With Best Regards,
Andy Shevchenko


