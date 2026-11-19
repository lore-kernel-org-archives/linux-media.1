Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093213;
	b=PpIqEACcBKos0gtb4e8GYovPO74OhM0eV1K6gsS6Cqzgsj9odwJnM2DCdCchoU7DZpjq
	 LNrxNBjvbKP6FRUo1kx7Auof7bvPV5iSh4tSiKVTiXWS8uAnpsTfJE1DH0h5VtABGpNYH
	 xw0ifBiQJVrq+sR27k022Qsid/Cf7ijqzf0Y0Nl774TPjsw9zPEdCO7L99ogzx+RP4UM1
	 +4wXuqZIY1uJvG/RIlenOZBN0A1f3p1X0BtjWwd6jOapnz9T//bbetBm+AhNEY6BTPLXB
	 V5kEhKDOAox77IW0xXXJrZoD79YtCWw+4AX1NlI9+c2CR1J+NkUF3zaOThMb/pFqI4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093213;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=I5TqpydatrcIiBqyhHz1ZbS8lF4liUszRkHtY8csQK0=;
	b=XvCXOROkIzMDXxwGkLTF2yi+siFcs/AQ+qWxowVm1Vymddbf8ZuMitGViAmCBpGkq1/v
	 uTAUIOBPNwaGmAKV7J06Q/StyI0MLNPl55Pb9Ag1xBHRBK9d9hl2UMjpMiY7BOnJdWPOk
	 2qsVQ21ybf50k2QHh3s7yx6w/UudHpUv0ApX4K2jGIuXcmW4naumrmil6ngk+gGpdSpAz
	 4rpCB6sMyokyRygX/yYD4axNkx8ktKEIyQxuyi19PaSysMDvRP7VaeFJOJEBiM+3SLr0r
	 GCYrmlUVkWnN+yKYgco0+1kWI/YrWL2eo3RV/oNpNOPufm0bfxlJpmShG2QLvPXZGmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YkX9TPFU;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7916606A325;
	Thu, 19 Nov 2026 13:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7916606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=YkX9TPFU
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5633B4E6;
	Thu, 19 Nov 2026 13:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795093061;
	bh=jgIfFq12KWtVN3KAiREpPoeqAP2LhfkuX+XP63OrF4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkX9TPFUyksRSuellC6rE4404BmoRzyMdg6Yh5AJTdBskk23NTjW+n08/6qRm3pdM
	 HrjTurCAknQUMYuK/zQFbh6VCyJT55Qf2enEBMqzEA4T8GHdnUPEOETxF/dZyUzZYt
	 CR3EmaHJeY9I0iJJ/3+O6dPdL3aIv1FUmlsWC/vU=
Date: Thu, 19 Nov 2026 15:00:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v7 0/5] media: Add support for Broadcom/RPi BCM2835 ISP
Message-ID: <20261119130009.GS1923307@killaraus.ideasonboard.com>
References: <20261118-b4-vchiq-isp-v7-0-b8c81d193abf@ideasonboard.com>
 <av7njO6dZNzM9UFi@kekkonen.localdomain>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <av7njO6dZNzM9UFi@kekkonen.localdomain>

On Thu, Nov 19, 2026 at 02:11:56PM +0200, Sakari Ailus wrote:
> On Wed, Nov 18, 2026 at 11:38:13PM +0530, Jai Luthra wrote:
> > Hi Sakari,
> > 
> > The VCSM-CMA driver (which this series depends on) is now picked by
> > Florian in the broadcom drivers/next tree [1].
> > 
> > If the ISP is okay to be merged by you (and Hans/Mauro), we probably
> > need to coordinate so it all ends up in a single tree during the merge
> > window.
> 
> Is there a chance to have an immutable branch for these? I initially
> thought the driver could have been merged via the stblinux tree but the set
> also touches other bits where we certainly have changes to in the media
> tree.

It will be a bit hard as the VC-SM-CMA patches have been applied in
Florian's tree on top of other changes. Of course we could merge
Florian's whole -next branch in the media tree, but I don't know if Hans
and Mauro (and Linus) would be happy with that.

This series applies cleanly on top of v7.4-rc1, and it doesn't conflict
with media -next (merging media -next on top doesn't report any
conflict). Assuming the series compiles cleanly on top of v7.4-rc1, it
may be fine to simply merge it whole through Florian's tree. If that's
considered too risky in the worst case we could wait for v7.5, but that
would be a bit sad.

> In any case, for the set:
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Laurent Pinchart
