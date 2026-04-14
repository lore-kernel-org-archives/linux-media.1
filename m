Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3E93B6BE8;
	Tue, 14 Apr 2026 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158883; cv=none; b=jUsdihR4ss+ZNXdfucUN2CPGwrNKgztq+CWc9a8X7RhAys6XqI/ktm2Ml2JdxFjCxeVpnLYP+YvBrSKOUj5mMK8PSMg6S4IR9gsQxbnQqI2WZPZO/T6GMccB7qUn0oVa7LsVXEHiKco+W0zflqKsKnqUyKT/zJNwK4WE7qUwKoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158883; c=relaxed/simple;
	bh=M+1EIrh0XuJ6H/adXzJxIGYbrkMw3R+m8bSKxW7aXKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/EkETGc0rMs2aKpHGKMYF30mBYRYUxdfwSrlt2dIxDSTTyljIlw7GTsuinGbsyahsX8IUYonJ5uca7J9RWKe5SJ7/l4pYVSo/Dh0lk+sLpNd338sIoYfxNI8Fdy8dMg5ujDv0jAf4v85WgSVP3ihnU3fvnIh+N07fzrQuhwqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wlum3Qmp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wlum3Qmp"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0C88E63C;
	Tue, 14 Apr 2026 11:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776158787;
	bh=M+1EIrh0XuJ6H/adXzJxIGYbrkMw3R+m8bSKxW7aXKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wlum3QmpERI8ViOFBlV7S3CQ6fqBswPoYWDCuMOGJHQSbNXlF8aJeMp8Zox1i9xUL
	 hEgZSy7PJ2X8uDj9wt5CaYtkNWFJdydJ3ivn8k3RKVikLJgqIsLL6U7DOJBvYJezZ2
	 H7q+PyKpHzEakzef0sdxj5WGrVRReOOpnX1lQryo=
Date: Tue, 14 Apr 2026 12:27:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Message-ID: <20260414092758.GE4061@killaraus.ideasonboard.com>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>

Hi Elgin,

I sent a review comment on v1.

On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:
> Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> 
> The Omnivision os02g10 is a CMOS image sensor with an active array size of
> 1920 x 1080.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - vflip/hflip control support
> - Test pattern control support
> - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> 
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   10 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++++++++
>  4 files changed, 1051 insertions(+)
>  create mode 100644 drivers/media/i2c/os02g10.c

[snip]

-- 
Regards,

Laurent Pinchart
