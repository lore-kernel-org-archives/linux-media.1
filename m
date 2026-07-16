Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117741F7C9;
	Thu, 16 Jul 2026 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208335; cv=none; b=D0N5NTR/nICCzeKyVGFJN+b8IN6p5/4KIjWdrvlI8i/uV8YO+jB+a35P3m568lNPYAX+4wBJhJMO5KoQg7P5MDJEGS1Y/ld6ctn60d04Q0RbUqMIQM1r/AC4c1Y6QQ1Ap944sOlqK+fILj8+EhG1CaJwtMO25wyZ2GelayBT7bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208335; c=relaxed/simple;
	bh=LB50Bp5ir4kKx2YVlB32sZN36WqDT5yWt0var8mtX/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzYO6JtuEwiOpPXlugsze9qCp00/5clFj3xE9sEr7EeMxpnMITSzNNnfxF43SuorgIN5aqVmAh2GR8fTS1KNuwYY3x/pwbl4hYgJrCd1HD2yd3ehc+xIx6E3DHnfp7t+8v0KwbUfMk5xwl3gvNAvmmqDxrf3yTip8wMmLT3nqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=swLyDrJV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="swLyDrJV"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A7A6267;
	Thu, 16 Jul 2026 15:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784208273;
	bh=LB50Bp5ir4kKx2YVlB32sZN36WqDT5yWt0var8mtX/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swLyDrJVqlOnz2rs+Xx6/VkL3K2je8+REDsyQ4NfwUctMBqDmQQ7AxN2h79Rb9ORj
	 ZXGitWbGZxrbJzV23vGveGg817KgwDhJqI/9Mlg7RMXrEs2bVq+5indJydzHf9C2g8
	 K2LNYWf65MMpY2oYG2Q2zqF5o1KyLvYBPOuQvk2g=
Date: Thu, 16 Jul 2026 15:25:25 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Richard Acayan <mailingradian@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Heidelberg <david@ixit.cz>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/21] media: i2c: imx355: Add support for 24 MHz
 external clock
Message-ID: <aljZf9q6GpdmGFjh@zed>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
 <20260715-media-imx355-v4-2-f7f966fb9ffd@raspberrypi.com>
 <alfj3XIkX-2O5BGp@rdacayan>
 <alfrPmqdQxw18bk0@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alfrPmqdQxw18bk0@kekkonen.localdomain>

Hi Sakari

On Wed, Jul 15, 2026 at 11:19:10PM +0300, Sakari Ailus wrote:
> Hi Richard,
>
> On Wed, Jul 15, 2026 at 03:47:41PM -0400, Richard Acayan wrote:
> > On Wed, Jul 15, 2026 at 12:43:15PM +0100, Dave Stevenson wrote:
> > > From: David Heidelberg <david@ixit.cz>
> > >
> > > The IMX355 sensor supports multiple external clock frequencies,
> > > including 19.2 MHz and 24 MHz. The driver currently supports only
> > > fixed 19.2 MHz input clock.
> > >
> > > Refactor the clock handling to make the PLL configuration dependent
> > > on the external clock frequency and add support for 24 MHz. Introduce
> > > a table of clock parameter sets and program the corresponding EXTCLK
> > > frequency and PLL multipliers to maintain consistent internal VCO
> > > frequencies across supported inputs.
> > >
> > > The PLL settings are adjusted so that OP VCO remains at 720 MHz
> > >
> > > This preserves existing timing characteristics while allowing systems
> > > using a 24 MHz clock to operate correctly.
> > >
> > > No functional change for existing 19.2 MHz users.
> > >
> > > Assisted-by: Claude:claude-opus-4-6
> > > Signed-off-by: David Heidelberg <david@ixit.cz>
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/imx355.c | 77 +++++++++++++++++++++++++++-------------------
> > >  1 file changed, 45 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> > > index ac59908f57aa..a6ee7532018f 100644
> > > --- a/drivers/media/i2c/imx355.c
> > > +++ b/drivers/media/i2c/imx355.c
> > (snip)
> > > @@ -1749,7 +1756,13 @@ static int imx355_probe(struct i2c_client *client)
> > >  				     "failed to get clock\n");
> > >
> > >  	freq = clk_get_rate(imx355->clk);
> > > -	if (freq != IMX355_EXT_CLK)
> > > +	for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
> >
> > Did we start allowing variable declarations mixed with code?
>
> C didn't allow that until somewhat recently, hence it hasn't been used in
> the kernel either.

Recently as in C99 ? :)
https://en.cppreference.com/c/language/scope "Block scope"

See: e8c07082a810 ("Kbuild: move to -std=gnu11")

>
> In cases like the above it improves readability. E.g. with __free() that is
> also the recommended pattern.
>
> --
> Regards,
>
> Sakari Ailus
