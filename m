Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0173C9EFB
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777963012; cv=none; b=EAWNHinWVsbJwPmmZX0lMzrEjcf54XNC3euEtQQQvdIN34MNq7MUz9WDMob0dJ4eKhf8sLRhMra71uyZwAreqx8AyPsh9zufEDF7WOrfkppjjMWVOAdLd36MPaAfuBVNPgE4XVHUNpI6Z9hYQGfWEHbq/RHcOqLESCmzh9o0QoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777963012; c=relaxed/simple;
	bh=O5uwHimYJHm13VjLekuKgi8rsruWb449G3MH24HyLtc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tEBewDPWvgWuqCX8Zbd3el5SoXxx5EJHriR9O+CapOc+CoLEhP3WB1x3Lr4IgT2+7vZvGGmkWqCGiHZeiFVwMJhoWnj3rsaX79F9wlYXte9qb0+qA9dArTkNQkIkbhzmbTmZeJwxFCN+xKbyiwZTfup7XwSl0fZVUWbUdT2ooNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKIsscmI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKIsscmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9E5C2BCB4;
	Tue,  5 May 2026 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777963011;
	bh=O5uwHimYJHm13VjLekuKgi8rsruWb449G3MH24HyLtc=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=sKIsscmI0qEAktdaSjPWHmHEKc5EAWgRrcd228pKTMtVm8n9ehvDsoR3wjuhVsmHP
	 bYrEeMwV0pqLZiO3jsRlsa2kH2b4eVpn3lr3wSYSkjHdOwazowmimUbgH04nOb4coE
	 LxNBJLMocjo82ZWc0IVhzWK4Hi0Zek7qco+A0H4K0kbH16KUmCIhgDXJF+MYBOTPuh
	 vgOZ2s9vWgFtpSVXWdMcS5bBjfhmJ8sV9qJeQxmQTXoc8xVqpeiN0DLNPrm3fA4F7z
	 ge8RlIKnFlSgki9/xvFFsL+cQlPmEl6HPzKHmTDXOeU7luDuf2ihEnIYQVoVh/8vEN
	 F+vKjEri0FT3g==
Message-ID: <e3b9b553-af2b-4b9a-bc01-a9f859e4c319@kernel.org>
Date: Tue, 5 May 2026 08:36:44 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 21/29] media: mc: Don't care about unsettable flags in
 MEDIA_IOC_LINK_SETUP
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
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
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
 Rishikesh Donadkar <r-donadkar@ti.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-22-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20260408153939.969381-22-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/04/2026 17:39, Sakari Ailus wrote:
> The implementation of MEDIA_IOC_LINK_SETUP currently requires that all
> flags that are set by the driver are correctly set as the driver expects.
> This poses a problem for adding new flags as programs could not work with
> links that have unknown flags even when the use of these flags wouldn't
> affect the program.
> 
> Ignore the non-settable link flags.

Doesn't this require an uAPI documentation change as well, clarifying how
flags are handled?

Regards,

	Hans

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-entity.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 717569bd1a8c..287eded356bb 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1319,7 +1319,7 @@ static int __media_entity_setup_link_notify(struct media_link *link, u32 flags)
>  
>  int __media_entity_setup_link(struct media_link *link, u32 flags)
>  {
> -	const u32 mask = MEDIA_LNK_FL_ENABLED;
> +	const u32 settable_flags = MEDIA_LNK_FL_ENABLED;
>  	struct media_device *mdev;
>  	struct media_pad *source, *sink;
>  	int ret = -EBUSY;
> @@ -1327,9 +1327,9 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
>  	if (link == NULL)
>  		return -EINVAL;
>  
> -	/* The non-modifiable link flags must not be modified. */
> -	if ((link->flags & ~mask) != (flags & ~mask))
> -		return -EINVAL;
> +	/* Only allow changing user-settable flags. */
> +	flags &= settable_flags;
> +	flags |= link->flags & ~settable_flags;
>  
>  	if (link->flags & MEDIA_LNK_FL_IMMUTABLE)
>  		return link->flags == flags ? 0 : -EINVAL;

