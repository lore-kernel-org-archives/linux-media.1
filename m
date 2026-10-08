Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6754A3CE083
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 06:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442337; cv=none; b=cFs4+YBPk0aNxg+W0g1oAjE9EhZ+xE1/N9Q+1c+kaxNPqSX6aiy7WKGxBv85TwZTzJJCvH5MjnVX4kgUHPhxvRY8tj4PYj8PHfZuenTmd2GHzPH+RGWuiOeG4lUw2b9bRPEm9e6RCZBuN5fGsceo4XGrl3rjn8CL9F73Nz8+PvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442337; c=relaxed/simple;
	bh=GhJa/F78UTRptZUQ1OB3yE2E4H5g/nOrlu+LwUBdfCY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t/pPKQapVIc+ePRASvGthEOT9EflgYPM5ieHrx59w7s/8IeUPqQ2N5LcMHRqEm96ARAA2yOBoD83qZm6HQjt5NQcoz6zuTz2uDTsK/caK5ptmQFKiMAeP6vyYQlagpuDy2Mft6r2pDkoPsQlfOW1Z7IVRKokTMGf/GFMtG8GNE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huhfs0pZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huhfs0pZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88D31F000FF;
	Thu,  8 Oct 2026 06:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791442330;
	bh=nHuCJkYlMUjG+oCR/j0/wkyMipE/7evMGhVbjJcCmJo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=huhfs0pZNIZnFcEnUyaOhQSsCBQhGkWRnggkWlIBCUJJjsU0VW2ecdd6oV23kxehL
	 ddqmxyhFo82/OSWlpp2OI/LNZwwKIM6ZvDZO/O3qxXGBjHeO980EDYP+IyyP3HbZBx
	 iWvQyh0Ny3Xp+tbEzo0rcpTOnN0HcCR9OYiceyKkJdPxl1J6AaV2bLo+B0+ntbIUpu
	 Kli7Hv0Ei4EVk+50E35ZE486Z6OgdsqR8AXkHn/f23ENgtbSKsUl2tf6arzLgwvKSi
	 Ur8wc0WLNmI1LbRvdQL5aDAkSLpTzP6s0vVsnWReVUfwpz/ek40az4e93x1JnZztBi
	 5wBN+kznUEeJQ==
Message-ID: <6dcd4951-d86b-4295-817b-ac4984284c16@kernel.org>
Date: Thu, 8 Oct 2026 08:52:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/2] media: mc: Keep INTERNAL pad flags just for the
 kernel, for now
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com, Prabhakar
 <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Rishikesh Donadkar <r-donadkar@ti.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Antti Laakso <antti.laakso@linux.intel.com>,
 Dumitru Ceclan <dumitru.ceclan@analog.com>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Martin Hecht <mhecht73@gmail.com>,
 Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>,
 Quentin Freimanis <quentin@q-lab.dev>, Cory Keitz <ckeitz@amazon.com>
References: <20261007204135.782415-1-sakari.ailus@linux.intel.com>
 <20261007204135.782415-2-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20261007204135.782415-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2026 22:41, Sakari Ailus wrote:
> Do not expose INTERNAL pads on UAPI as the documentation nor
> v4l2-compliance changes to support MEDIA_PAD_FL_INTERNAL pads has not yet
> been merged.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> ---
>  include/uapi/linux/media.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 80cfd12a43fc..63e69a517987 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -208,7 +208,13 @@ struct media_entity_desc {
>  #define MEDIA_PAD_FL_SINK			(1U << 0)
>  #define MEDIA_PAD_FL_SOURCE			(1U << 1)
>  #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> +#if defined(__KERNEL__)
> +/*
> + * Forgo INTERNAL pads until proper documentation and v4l2-compliance testing is
> + * merged.
> + */
>  #define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> +#endif /* __KERNEL__ */
>  
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */

