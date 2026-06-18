Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283013F58FB;
	Thu, 18 Jun 2026 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787777; cv=none; b=bnVk/AKOL9gPpAmUxiFhWw4s64Lwu21fdfUi/aKuC3YgKV3ljEd76K+UpV/jbOos4+++w6UUZborBnyG1bgd2nN++BAdy42I68fQUVHifZlCVKI5HRxjSN1OUyUgcOJzCC94IRijOj/lANFgZrhdc9/FCLALbsmxjU37GiCrXww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787777; c=relaxed/simple;
	bh=mUOxq2QSI+QiZ9gtSguefXJDYNxU4EynqEApu6Ci8RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+huzI2feOvCnAS4yx620bT3refQJ8YWOI71uZRmqyi0e8Nz1zGXlir9ivuzpnKGThhRzBglxUDYbSjdRVjs0b8RqKCqF4lwMGo7PRJL6IC41fdJGH4Sm9Npaor3vR6Dk90RR9KFd4guRfgQSogoT0vPKPIq4otWIO1Ebw9iFbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pwJKoTuM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pwJKoTuM"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E18BF4DC;
	Thu, 18 Jun 2026 15:02:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781787740;
	bh=mUOxq2QSI+QiZ9gtSguefXJDYNxU4EynqEApu6Ci8RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwJKoTuMimw/cnCoQj4RVAu4/W701kxNh7GQZoCtbgKlGoI0RTrFDDLBzcAQaoJQ1
	 SFNCNEDMIhAJW+F/djs7t21dQoCR8lJ9OwvTPKvHvAKm1eurovXQ3yVKut9hEA3ZCr
	 D+ImAraZrPOBSw+mOthiAzo/3FVmvkXCyS5GQDHY=
Date: Thu, 18 Jun 2026 16:02:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
Message-ID: <20260618130253.GF3345533@killaraus.ideasonboard.com>
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
 <ajPay8NJ233yuCLJ@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajPay8NJ233yuCLJ@kekkonen.localdomain>

On Thu, Jun 18, 2026 at 02:47:23PM +0300, Sakari Ailus wrote:
> Hi Elgin,
> 
> On Fri, Apr 24, 2026 at 02:55:47PM +0530, Elgin Perumbilly wrote:
> > From: Tarang Raval <tarang.raval@siliconsignals.io>
> > 
> > Add crop support to os02g10 by implementing .set_selection() and
> > storing the crop rectangle in subdev state.
> > 
> > Initialize the default crop to the active area, make set_fmt() use the
> > current crop, and update the output format when the crop size changes.
> > Also program the sensor window from the active crop/format state instead
> > of using the fixed supported_modes entry.
> > 
> > This allows userspace to configure the sensor crop window explicitly.
> 
> Please wait for the Common Raw Sensor Model patches to be merged before
> adding this -- we don't have an established way to configure cropping
> before that. Some drivers might do something but it's all a bit haphazard.

Does it mean we should wait for the raw sensor model to merge this
driver ?

Many existing drivers configure analog crop the same way, through the
crop selection rectangle on the source pad. Is there harm in doing so
already ? I wouldn't enable binning and skipping yet, that I agree with.

-- 
Regards,

Laurent Pinchart
