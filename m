Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56553E49E3;
	Wed,  5 Aug 2026 11:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785929377; cv=none; b=OzTV93DUxINzYC70+V7wtw9hM1jOYXcxJ2+P6NPK/EmRkZschKsvyaOfT+F2gYXnABZzdXN9YI/h8wQPrmAbaZ29P15/67CrjUlFqli3Fxo/cWhDCDO/+f6Lc13pGZGC0/xM0srbXdo9Qq8RSPXaKGYarlrbTU6E7OA7NQX3BL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785929377; c=relaxed/simple;
	bh=DK+zjKj/0UzB+fr3Kw5HahNxqGU9pKfm7N0iqszc91M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMh7q6+rDxjp/h1STBZ2ul2rQy0NsRfNLrelhuA2gvRfAWK4lFj/qWCziep+nMAce370S3tqbEsk8T/YUtBBJKKOdkquBCgTPheaZJ7lesbuL/LDtebTyD1bmoKqGH9KH7M2aall15mQrgh4gvOyxyLvjKN61/eedFqNYr/0fHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jenorqWX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jenorqWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785929376; x=1817465376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=DK+zjKj/0UzB+fr3Kw5HahNxqGU9pKfm7N0iqszc91M=;
  b=jenorqWXOObmws1Nn+r2uqu6yzvTSIS2HDHeyPqJEf3flHPY6HSlsgyM
   nyEso2L2e87lGPT3dsvnIVxtcigMtKGuRxNQi57wsUpt9SwCLneJ2pu3f
   SAAqdA03xQbtezTp7mOzTlT24tEZigC6687EK8c9D5PBml2gsIrkddSxz
   ifEnWjBYZsg5tlxiCB5jSjVp0onheBY3tDPRRUItfcInnT42vwww4jlsE
   3zAlv3CUQFgoWbQkAl7s0xQN56v1BNfeb2XkdaheMmtqL1OcD01kjAPdR
   MTkBb9wztnVfy8Z4dr6nBWGJ2mDmHyBGNNoO3Ub97Q+3oAK7kqHPDJrzI
   g==;
X-CSE-ConnectionGUID: Z6zVyFyrRM2OaJww51Xcbg==
X-CSE-MsgGUID: ct+wvQTTSsCT6UhTnjRc8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86357743"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86357743"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 04:29:35 -0700
X-CSE-ConnectionGUID: LUlS227JQUuUMOmn4BKeJQ==
X-CSE-MsgGUID: iU0sqimtQCSA/vahR9H6tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="265289462"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.55])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 04:29:31 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 973E1121BFF;
	Wed, 05 Aug 2026 14:29:36 +0300 (EEST)
Date: Wed, 5 Aug 2026 14:29:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danila Tikhonov <danila@mainlining.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Vasiliy Doylov <neko@altlinux.org>,
	Achill Gilgenast <achill@achill.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
Message-ID: <anMeoKP6rUlgtKyR@kekkonen.localdomain>
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
 <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
 <anGlY_kwp_I-fRnz@kekkonen.localdomain>
 <f7cae569-0c51-41fe-92ab-f29311a22761@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7cae569-0c51-41fe-92ab-f29311a22761@mainlining.org>

Hi Danila, Griffin,

On Tue, Aug 04, 2026 at 09:27:01PM +0300, Danila Tikhonov wrote:
> Hi Sakari,
> 
> Thank you for your comment.
> 
> On 04/08/2026 11:40, Sakari Ailus wrote:
> > Hi Danila,
> > 
> > Thank you for the patch.
> > 
> > On Sat, Aug 01, 2026 at 09:04:15PM +0300, Danila Tikhonov wrote:
> > > The DW9800W uses the same chip ID and register layout as the DW9800K,
> > > but requires different default VCM frequency value.
> > Is this a real difference between the two models or what fits for the
> > attached lens? Too bad the datasheet isn't publicly available. :-(
> > 
> > At least the differing default and constraints for dongwoon,vcm-prescale
> > needs to be documented in bindings.
> I share your skepticism and have essentially the same concerns. Since I
> do not have the DW9800K datasheet, I cannot say with certainty how it
> differs from the DW9800W.

Indeed. The limits should have been added for dw9800k, too, but I guess I
missed this in review. :-\

> 
> In particular, the parameter referred to as the VCM frequency in the
> driver is used to derive the SACT value. For the DW9800W, SACT[5:0]
> defines the actuator resonance period in SAC mode and the one-step
> period in LSC mode. The datasheet gives the corresponding formulas as:
> - tVIB = 6.3 ms + SACT * 0.1 ms
> - LSC 1-step period = 252 µs + SACT * 4 µs
> 
> Therefore, the default value may differ between the DW9800K and DW9800W
> if the formulas or timing characteristics used to calculate SACT are
> different.

Griffin, would you be able to comment this?

Another matter: the comment on dw9800k says there's no device ID. So is
there a device ID that wasn't just checked earlier or is there really no
device ID?

-- 
Regards,

Sakari Ailus
