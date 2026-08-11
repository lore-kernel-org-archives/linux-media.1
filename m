Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B341A920;
	Tue, 11 Aug 2026 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786437771; cv=none; b=Xa1bvNFeqF+Joz1MqbaemCHYZtR0Wxo3CqxQJ45KPP4LudbGV2MQkIRTB454lXK5wu8FwLmPq00+tIcixNmyDpF6eGcoYTyGUvRqUtcHDaWwtgQ/q9h/MH2hVvgbx4K/q7mT1iJovVm5UmPQ0GE9WelcSzS8FMmmOcP3XEfa5Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786437771; c=relaxed/simple;
	bh=GF2pb4J87GtzvNNouBIPxtNue45MF8Tk4K6nR9qTIjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tkr7dObyUMvCVavFfG7ZHrP26T46ByGWdD3V27D2c02GK0OvAKdfdhf6NjK+YUN7iUe9dBJGtxveIQiQi4aPT97yjdAEAc79JkIYnJaA1a861HDYKNv3RbWTEgImhP5iO1Zxy2P7WCq8+sqpmV77+2iA22wbpoo4QizA4yter7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePzg1U8D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePzg1U8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786437769; x=1817973769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GF2pb4J87GtzvNNouBIPxtNue45MF8Tk4K6nR9qTIjs=;
  b=ePzg1U8DGhJ8uaDIVGlgjjplXsUSJjjkSJledOE08FubFTliN7L2HoMz
   AjdodF/I/HuZfFg/9LCiUthZkURx3tSVFPsUfx7jhQK9wlk3kiFb6T9sa
   Pkn9BI86/GwpCMVHtx38aBnV8fvmBikV1ZQ6wnhhIrpdE+jUz4aQAxBhR
   PnKefGwuCg2rrf9GJM0qSzcL3WvssFM1q0GQC7nFTk6vNb5VrZR8/Ka6M
   Vnk3blNdW8CDta4oU13gC/w1tGSsfhUMom5GYJka3FtajlMTY/SZj5JYO
   ybXkEFvWSEUECxEQNcqMcASJqwe2DvDXYn+Dq1U2JVrMt7zHS/wyaVMwr
   A==;
X-CSE-ConnectionGUID: a1thQXdBQv6PBx1bqLYlKw==
X-CSE-MsgGUID: id/EddAtTJyDE+L3CrkEsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86724509"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86724509"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 01:42:48 -0700
X-CSE-ConnectionGUID: xWd9KMpfQCqPoT3aJ0tO+g==
X-CSE-MsgGUID: UuwPud76QZ6yVZfRsNMUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="266765848"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.215])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 01:42:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 98A6A11FC6D;
	Tue, 11 Aug 2026 11:42:44 +0300 (EEST)
Date: Tue, 11 Aug 2026 11:42:44 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?utf-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: Re: [PATCH] media: ov5640: select the MIPI lane mode from the
 endpoint lane count
Message-ID: <anrghCY5zUOICXXa@kekkonen.localdomain>
References: <20260811-ov5640-1lane-v1-v1-1-79699457ce13@gmail.com>
 <anq5HzmP33fqWYEO@kekkonen.localdomain>
 <CAPwA33LJsSr3w_Vfc6wd7VXNBW2fjrn2zaVxDGB_RfJ-FRrdHg@mail.gmail.com>
 <anrNowQWOaCkh4W1@kekkonen.localdomain>
 <CAPwA33JXkioCo0=RC_mO3ZaY-LjCJpWynB7b8chY6eP=fnpvHQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPwA33JXkioCo0=RC_mO3ZaY-LjCJpWynB7b8chY6eP=fnpvHQ@mail.gmail.com>

On Tue, Aug 11, 2026 at 03:30:40PM +0800, 楊智成 wrote:
> Hi Sakari,
> 
> > There's no need for a local variable, the above remains within 80
> > columns.
> 
> Dropped - v3 has the write exactly as you wrote it.

Ah, I think I missed 'sensor->' there. 80 isn't a hard limit though and I
wouldn't introduce local variable in this case.

Thanks!

-- 
Sakari Ailus
