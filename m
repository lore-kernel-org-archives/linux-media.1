Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BE0384CE8;
	Mon,  3 Aug 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785754781; cv=none; b=Gi2achqXI3/Zw1nxNt8Y0i4tYyoqeJj4mkNsCQez/AZ/lPKQi3N1ijyaIIeQfrFDiZVKz+N2BEX6qTx4DX5G/WuEW97ZgNzgfruFXxjJvKzZl0Uora7EAYoDMFMUo1c/nXnBJB6Vei5a2Sk04eLltxYA23GYOcgUAufSkZXlzjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785754781; c=relaxed/simple;
	bh=vBOwgVMe8mBatIapnGErbEuu+eAuMy9ntS6V/yBIKRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ci5pPDLjtvSKxdSpLXEdjMHnpBk+hfA4IAfmBzkyebfgXKCvGH98qd2LdZMgFzK0idz4n3BaIiw66AgujYBJs63yN8GYjJYpLg6sEXjRFYMSqcZcMq2pqhf1UPE6b3FpLcAd8hIIFPkuhkbD7badfJqUH0pTvFxq7KrxMpDNfZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rtwkIoZY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rtwkIoZY"
Received: from ideasonboard.com (mob-109-113-25-35.net.vodafone.it [109.113.25.35])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A661E5B3;
	Mon,  3 Aug 2026 12:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785754705;
	bh=vBOwgVMe8mBatIapnGErbEuu+eAuMy9ntS6V/yBIKRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtwkIoZYeQHz16jaUMDvR8Xv1y7H/RbGwzniTExP5iK5r98rcPSj0QoDo28uh8Ryn
	 fEFjMqVmwH3idFOeqDey9mC6CYxsYk9S+uAVvBpQdhee5jHUyUg6DNhvZ9+ebZ9xyS
	 8KYx7WO6vsqCJmU8ZKu4COHKYonPejZyjnUhksIA=
Date: Mon, 3 Aug 2026 12:59:31 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Philippe Baetens <philippebaetens@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] media: i2c: Add driver for AMS-OSRAM Mira220
Message-ID: <anBzYRw1I3yo0Q8f@zed>
References: <20260727-mira220-v10-0-8825794e6095@ideasonboard.com>
 <20260727-mira220-v10-2-8825794e6095@ideasonboard.com>
 <amjAgRnL0vM2eQJl@kekkonen.localdomain>
 <amypEMpDvY47VkG5@zed>
 <anBtWwyNVdKi90Zg@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <anBtWwyNVdKi90Zg@kekkonen.localdomain>

Hi Sakari

On Mon, Aug 03, 2026 at 01:28:43PM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Fri, Jul 31, 2026 at 04:15:53PM +0200, Jacopo Mondi wrote:
>
> ...
>
> > > > +	/* Sensor control mode */
> > > > +	{ CCI_REG8(0x0043), 0x0 }, //  Sensor Control Mode.SLEEP_POWER_MODE(0)
> > > > +	{ CCI_REG8(0x0043), 0x0 }, //  Sensor Control Mode.IDLE_POWER_MODE(0)
> > > > +	{ CCI_REG8(0x0043), 0x4 }, //  Sensor Control Mode.SYSTEM_CLOCK_ENABLE(0)
> > > > +	{ CCI_REG8(0x0043), 0xC }, //  Sensor Control Mode.SRAM_CLOCK_ENABLE(0)
> > > > +	{ CCI_REG8(0x1001), 0x41 }, //  Sensor Control Mode.EXT_EVENT_SEL(0)
> > > > +	{ CCI_REG8(0x10f2), 0x1 }, //  Sensor Control Mode.NB_OF_FRAMES_A(0)
> > > > +	{ CCI_REG8(0x10f3), 0x0 }, //  Sensor Control Mode.NB_OF_FRAMES_A(1)
> > > > +	{ CCI_REG8(0x0012), 0x0 }, //  IO Drive Strength.DIG_DRIVE_STRENGTH(0)
> > > > +	{ CCI_REG8(0x0012), 0x0 }, //  IO Drive Strength.CCI_DRIVE_STRENGTH(0)
> > > > +	{ CCI_REG8(0x1001), 0x41 }, //  Readout && Exposure.EXT_EXP_PW_SEL(0)
> > > > +	{ CCI_REG8(0x10d0), 0x0 }, //  Readout && Exposure.EXT_EXP_PW_DELAY(0)
> > > > +	{ CCI_REG8(0x10d1), 0x0 }, //  Readout && Exposure.EXT_EXP_PW_DELAY(1)
> > > > +	/* MIPI */
> > > > +	{ CCI_REG8(0x6006), 0x0 }, //  MIPI.TX_CTRL_EN(0)
> > > > +	{ CCI_REG8(0x5004), 0x1 }, //  MIPI.datarate
> > > > +	{ CCI_REG8(0x5086), 0x2 }, //  MIPI.datarate
> > > > +	{ CCI_REG8(0x5087), 0x4e }, //  MIPI.datarate
> > > > +	{ CCI_REG8(0x5088), 0x0 }, //  MIPI.datarate
> > > > +	{ CCI_REG8(0x5090), 0x0 }, //  MIPI.datarate
> > >
> > > How many of these registers are actually 16 or 32 bits? Does the sensor
> > > support wider than single-octet writes -- few don't?
> >
> > The sensor is said to support both single read/write and burst read/write
> > sequences.
> >
> > There is room for improvements here, but as the startup latency is not
> > a concern for the time being, I would leave this as an exercize for
> > later
>
> Related to the previous comment, it'd be nice to have human-readable names
> also for these registers. I'm fine with that if you promise to address this
> later. :-)

Only for the MIPI related ones you mean ?

I'll have to add support for non-cont clock mode and other bus configs
next, so this part will be reworked anyway.

The other registers in the table are not all documented, so I can't
help much there.

>
> ...
>
> > > > +static struct i2c_driver mira220_i2c_driver = {
> > > > +	.driver = {
> > > > +		.name = "mira220",
> > > > +		.of_match_table	= mira220_dt_ids,
> > > > +		.pm = pm_ptr(&mira220_pm_ops),
>
> If CONFIG_PM isn't defined, mira220_pm_ops needs to use __maybe_unused. I'd
> just drop pm_ops() here.

Isn't pm_ptr() there exactly to avoid __maybe_unused ?

See 9ab2bd7760a9edc23dfef71bb94092359ce94024 in example

>
> --
> Regards,
>
> Sakari Ailus
