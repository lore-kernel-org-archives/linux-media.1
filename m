Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74DB41D111
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 21:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791407947; cv=none; b=h8E60jy2kMxmFRyW57SGUryoHN15exIrAnQkGz203Ts0nI/Uw7s+gFNDZYiHew432l/SfyqkXG0GnUud6FjV1xzBqX32U9TWTxI2UOkggdmE6Jhe1CVny9rzDtEdSEpEvNES8xaVZwgIiKJwesfN9KoddxhsVO3EtPAOY8VRWHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791407947; c=relaxed/simple;
	bh=Gmv2IzYkxR2GSb5PXZvUVfrdpZVphHzCHjkjBlgrHSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/YCBpk3xE1UH+DazLE6mEooLgh91pfD4XoEhxOoYjBxE6tg/59Wm+WMcNi4RwTiq955nG66xi8+ZiOkcXr58kfVUzFaDEowwX5oPOZkRhDFoKAEod8v9dWsD0lKM0v4c9PgiCezkH1FV250fztijJ+5RdYrzttXe7HonYdQGlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y4pT6Mq1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y4pT6Mq1"
Received: from killaraus.ideasonboard.com (dynamic-2a00-1028-8389-0276-8139-a635-2d39-b80f.ipv6.o2.cz [IPv6:2a00:1028:8389:276:8139:a635:2d39:b80f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B48431C63;
	Wed,  7 Oct 2026 23:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791407823;
	bh=Gmv2IzYkxR2GSb5PXZvUVfrdpZVphHzCHjkjBlgrHSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4pT6Mq1OBwj4ALuxdmhqSBK4xjuPFmR7nk9d5Sw66Im1UdoKFVp7usAJ3RYEI+o0
	 EqgqTiu0OJ6ezf6Qjrj90a5YkKbw7tjv4Z7CT4Wq5b/CWDwwKZt1RNC6jItDAODbB0
	 rq02DinrZcFd9LpVMb7M26AyHfXWFEABCSH0dlZY=
Date: Wed, 7 Oct 2026 23:18:58 +0200
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
	Rishikesh Donadkar <r-donadkar@ti.com>,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Dumitru Ceclan <dumitru.ceclan@analog.com>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Martin Hecht <mhecht73@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Quentin Freimanis <quentin@q-lab.dev>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH 1/2] media: mc: Keep INTERNAL pad flags just for the
 kernel, for now
Message-ID: <20261007211858.GB664854@killaraus.ideasonboard.com>
References: <20261007204135.782415-1-sakari.ailus@linux.intel.com>
 <20261007204135.782415-2-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007204135.782415-2-sakari.ailus@linux.intel.com>

On Wed, Oct 07, 2026 at 11:41:34PM +0300, Sakari Ailus wrote:
> Do not expose INTERNAL pads on UAPI as the documentation nor

s/as the/as neither the/

> v4l2-compliance changes to support MEDIA_PAD_FL_INTERNAL pads has not yet
> been merged.

"have been merged yet"

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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

s/is$/are/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * merged.
> + */
>  #define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> +#endif /* __KERNEL__ */
>  
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */

-- 
Regards,

Laurent Pinchart
