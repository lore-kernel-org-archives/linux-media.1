Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115193C9EE8;
	Tue, 14 Apr 2026 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160652; cv=none; b=T0C+sNbh7MFZZ+zHd7ZXIPMY3KBHtrJQ+W2F4UGqimcJgPkfwRVusdoNli/6GMiA6G1AwjeMnAfMCvBRp8QVFrIfS5kom34pqy65HRULuOuzFKzRkx2LwTsrb90vjZGH+d/HUvfh1Di/KzfXK4yt5IN/VX4U9u68wPst/c8Kkcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160652; c=relaxed/simple;
	bh=oKCWCUZ68h+2eyaR8RE4A52ActEoIRh0ixwQ+eNX1Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVe2Hh63gh1jyXQ8duEuGhYqC67AEmg0g8a4PFr6PU+StFtOFPWAkIHXa8E6skZJj3FihR6og8I0zeL4nTyuPfgVjbpzaDyl1Fnpo+J0Sm+uVAWUnrZX/SephCAoqjY7yD7Lr0U4Kql8odjAogZ3kDIf0FVCJeiGxl5hPKWk810=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mr2fNrt1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mr2fNrt1"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 143F163D;
	Tue, 14 Apr 2026 11:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776160556;
	bh=oKCWCUZ68h+2eyaR8RE4A52ActEoIRh0ixwQ+eNX1Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mr2fNrt1Auu4mWGHUplKEdOYyWVe7pYhQIJfxj1SD94MHoGXOYJQDl5hKRsWncJ3e
	 itESzAs5nvOooqVROMnk+0VgVGjSoV1tiDKBiaCedgglB0VEdV3CH2twhmlDpG+E22
	 WDYiGZuOf2gcLoYzNCxX67Y5wYCez4jP/HunH7sM=
Date: Tue, 14 Apr 2026 12:57:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
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
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] media: i2c: add os02g10 image sensor driver
Message-ID: <20260414095727.GF4061@killaraus.ideasonboard.com>
References: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
 <20260414084952.217215-3-elgin.perumbilly@siliconsignals.io>
 <20260414092758.GE4061@killaraus.ideasonboard.com>
 <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MA0P287MB2178FAA81D07B561FA68014988252@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>

On Tue, Apr 14, 2026 at 09:43:32AM +0000, Elgin Perumbilly wrote:
> Hi Laurent,
>  
> > I sent a review comment on v1.
> >
> > On Tue, Apr 14, 2026 at 02:19:45PM +0530, Elgin Perumbilly wrote:
> > > Add a v4l2 subdevice driver for the Omnivision os02g10 sensor.
> > >
> > > The Omnivision os02g10 is a CMOS image sensor with an active array size of
> > > 1920 x 1080.
> > >
> > > The following features are supported:
> > > - Manual exposure an gain control support
> > > - vblank/hblank control support
> > > - vflip/hflip control support
> > > - Test pattern control support
> > > - Supported resolution: 1920 x 1080 @ 30fps (SBGGR10)
> > >
> > > Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> > > Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   10 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/os02g10.c | 1039 +++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1051 insertions(+)
> > >  create mode 100644 drivers/media/i2c/os02g10.c
>  
> I have added a new function, os02g10_set_framefmt, which dynamically sets
> the mode register.
>  
> Please let me know if I have missed anything or if further changes are
> needed.

You also need to drop the supported_modes array, and implement support
for .set_selection().

-- 
Regards,

Laurent Pinchart
