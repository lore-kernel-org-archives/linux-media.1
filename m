Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427FF38AC76
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 13:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347800; cv=none; b=UQIlygU0XPZhYuUcZQJDVlBOj+1upgoaGPgODEhkySs4hBuUMi34cL7/sKDg3pa78umWqi5Fik88e9ILTlSgNNdq5XCi/nbv4+hg24Egljcw2lZwMq7U6g2eWyk0m2nDPAvwqL6z8W5JgdlHfBr99HpitpdkvwSDW/XgCiJSsqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347800; c=relaxed/simple;
	bh=IarCRNMtwpP1aRtfTCi13lH/jRADFh1m5HjwSGdD9D4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m15muQauFjtHCdMoBuN3yNWfBUrTbR7ZQ7sAs/BRXZhkr/Pdgcs+H//tRIlXcc1zYWWgD/vaZOK7M+GqdWCz9JFKGZvc56Sit374+bNAA2IP23uXHsJ/P9CSmp6z9d9IqgrcKQz3tK08N0hEok3OMhQp2cy58zc1AxRTWh860RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ginrnfwt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ginrnfwt"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 84359107;
	Thu, 16 Apr 2026 15:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776347701;
	bh=IarCRNMtwpP1aRtfTCi13lH/jRADFh1m5HjwSGdD9D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ginrnfwtgTPgVYNEYvIlkHfQ7GfGAvaAHqogWcBb+rX2U8wy2dGYZ+sV/UoP+0LVM
	 B4vqFE54rTyTptRrCBSGYPZChnFiSbdW2VKOddKJb+IHidmH3osVdP9pcBTv+LJPfz
	 9+A1Jpy8hcUiyOMZfLuf7X6LsL7Cah2pMKssFh+E=
Date: Thu, 16 Apr 2026 16:56:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v4 02/29] media: imx219: Fix maximum frame length in lines
Message-ID: <20260416135634.GC1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-3-sakari.ailus@linux.intel.com>

On Wed, Apr 08, 2026 at 06:39:11PM +0300, Sakari Ailus wrote:
> The driver used the maximum frame length in lines value of 0xffff, but the
> maximum appears to be 0xfffe instead. Fix it.
> 
> Fixes: 1283b3b8f82b ("media: i2c: Add driver for Sony IMX219 sensor")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index cbd151d4af5f..89061dc1842d 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -72,7 +72,7 @@
>  
>  /* V_TIMING internal */
>  #define IMX219_REG_FRM_LENGTH_A		CCI_REG16(0x0160)
> -#define IMX219_FLL_MAX			0xffff
> +#define IMX219_FLL_MAX			0xfffe
>  #define IMX219_VBLANK_MIN		32
>  #define IMX219_REG_LINE_LENGTH_A	CCI_REG16(0x0162)
>  #define IMX219_LLP_MIN			0x0d78

-- 
Regards,

Laurent Pinchart
