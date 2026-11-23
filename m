Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435585;
	b=aTRnIVO4jUhRPV7hkyQpPTaG8icESeTRs1pqw2yUd4aMZKv9mZOq6MkyMyY4L97KLoRD
	 K8BcUwf32BXXS3WLtGm5KES/GbVCGdAcLPGVLTI7Aql+nnVTrc+4+2M8Rib7iaI1jPpEe
	 enhIZlaG2VdsIWDVx4HMthhrRMC61X9wpgWf9/eDF9VceyDpQcV5tg3wbrO9MPbIDQRxo
	 lvLTbNiO+qngTC0SNXKwpH4ibtUT5RXvX06hm2ZiIk6CuqveS85gH1gJIPyh5j5nxVEIO
	 zgVofrn8QT6dk8/t9XbXys8voPaP/DCD6uvRe/Q78BvokMI+aBi6O05k3iRwKyrAQAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435585;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=wp2LW+gePtaEkZpfKwS0PRlwSpjDuK9HvNParTH6MT0=;
	b=ZHX9pAKu6f3ZtdfUxGHSkh4ENmxggB+sSr4hRhug5zkCvByEFF0uI77yTXhN5ExNg7ej
	 U3b6FRUkF84q20SPQIxRDiW4/UWH4cB0/3OZN0jX3aRHbtps5Uqqvd3IRJnEfBdr/UOHH
	 eu74ahnmviDyPm5RqVu3wwVvUIOrFaygZuJjwRE06NE6Cbi0ug89CV6FCxbYQFHS+Jr/Z
	 YiQy/Nv7+0MhipzrwcUIAq1ebiD2FRP0JM/pptsyJ9VszunZh4HM3D+/bEtAGnLhBLPHs
	 lKCltrmVj4NbRRcPBA3qf576fw9VnMSFTkvGedyES6JPG2ecXixY24h4fGYvCzDJaMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OcMe5SQ4;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C9606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 12:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OcMe5SQ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795435585; x=1826971585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FtT3Pu820qFG1QWLljht4auqUXlJnFiShJlmGio0GDI=;
  b=OcMe5SQ4v2ch7vuHs4VR56FSQwO4jH4sE5xyNAyGC1ubZNz75wG2Q33x
   coSBvwgasc5ju20qXFXCenxpQz/6yxi6nNFhrOg5wN/M+iuCAhpUGtdCQ
   LEBzUmPVW8d9RHHnS9ZabvtcQJOxb6PaRB9m3qF/WctOdI8TNX+HUUSKi
   EhNVrUx4tP7JNJ/RELDQCw15hQJznOFtKRbuiQOWkpvgkPjcf2w55BbuX
   4mQThO6KGV/CaZRwPBt0yEEY4pqHW0C8n5AN09Hz07na5JzrVtFYIFFjL
   SrSzwlwR/Diod4bHEyYjrsfjK+eoJGYisgRkCytOAl0AYlB87azbvYdgv
   g==;
X-CSE-ConnectionGUID: txjI0B8vQr6T2kXU3sqHlQ==
X-CSE-MsgGUID: NilZ7mplTJOuBjyzsHzQiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4214828"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4214828"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:06:24 -0800
X-CSE-ConnectionGUID: J6AvQR8qSLSG2cvSYHko3A==
X-CSE-MsgGUID: rryfH3a2Tx24bwBpTGRopw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="12985354"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:06:22 -0800
Date: Mon, 23 Nov 2026 14:06:20 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: vunny.sodhi@intel.com
Cc: linux-drivers-review@eclists.intel.com, linux-media@vger.kernel.org
Subject: Re: [linux-drivers-review] [PATCH 3/3] media: i2c: maxim-serdes:
 resolve V4L2_FIELD_ANY in set_fmt
Message-ID: <awQsPG5Axc4fGETE@ashevche-desk.local>
References: <20261122234313.327866-1-vunny.sodhi@intel.com>
 <20261122234313.327866-4-vunny.sodhi@intel.com>
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
In-Reply-To: <20261122234313.327866-4-vunny.sodhi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 23, 2026 at 07:43:13AM +0800, vunny.sodhi@intel.com wrote:
> 
> max_ser_set_fmt() and max_des_set_fmt() store the requested format as
> is. When userspace leaves the field unset,

Is it legit setup?

> V4L2_FIELD_ANY ends up in the pad state, while the sensor reports
> V4L2_FIELD_NONE. Link validation then fails with -EPIPE:
> 
>   v4l2_subdev_link_validate_default: field does not match (source 1, sink 0)
> 
> V4L2_FIELD_ANY is not a valid active field, so resolve it to
> V4L2_FIELD_NONE as done for the default formats.

From this I don't see anything wrong. User wanted something, but hasn't
provided it correctly. They got what they asked for, no?

(Seems like commit message lacks of the explanation.)

-- 
With Best Regards,
Andy Shevchenko


