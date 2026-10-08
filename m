Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ACB3CE4A3
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442710; cv=none; b=f5aqsxqdEWNBnSUz0YD52PsE6cAsrKmEdd58Dz+VYKVmAXKlrsbSQy//FVU7ndkXtwAY4lH7wPALTsfk+gKQdfLF2beC8Ijx+2YGRutSADXA/Wptl/84iRrh2MWt5vWklMEKUKuJg+QAopAU92+rncnLbSF421Nxal/HyZOYbvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442710; c=relaxed/simple;
	bh=ilB+b0fL/v7+p9Fflc29+ErwD9JRE7F1U54E/cbzX+c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LQjAzyANqhUgs4EdScBJKaD5jBxKcA8Sojz/VJRV7UZxhGZmukFsqGZCxe/jkvI+gRWIBI37CjL5YFpjrvolKTdyPgwZy7ifLeJaRbr2ouNop/4GVuNn6X5PJbSFv3Igx0gusaipPO2q559GqumZs8C/vvFZNzPNzKkNAgBtjcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oStjRxWF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oStjRxWF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25CB1F000FF;
	Thu,  8 Oct 2026 06:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791442709;
	bh=7JpzCMx7siRFGzQ9CZ85UvXyOFCVxh1vdv4NZxmlnC8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=oStjRxWF4aY5KjYwKZff2NRup4XOID9QahdfxZxHLYwMlDnn6NSmWU2uuPkydnMRs
	 15VRYNz47OmCfRP0KsA6zr467ju3XIgWiMVmBHunM58EUvIlGoNtlcT5SV073s9ROk
	 0f0Y75MQKL0Crd/I0HbBAUF1AaML14dP1VomAVDZ3jri2IYM5nn6EPCtDIk9jaco7n
	 yt2I8+5S6yenTiSliYeDIQ/tdJ4PaAGIvAzm1lClIQqKz/lRvLT1kvj6+fYVWgw4nB
	 CZrgX+H5lIE708MvOfLFT9VJ3zZBP2iXjUUwasA+6/AM7z8dkqzYJE1hUw8AOAlJNW
	 4VlPBuPsCmrHA==
Message-ID: <a2d805e4-71bb-4e05-9bd2-53d5f439274e@kernel.org>
Date: Thu, 8 Oct 2026 08:58:20 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 2/2] media: maxim-serdes: Disable test pattern generator
 for now
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
 <20261007204135.782415-3-sakari.ailus@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20261007204135.782415-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/10/2026 22:41, Sakari Ailus wrote:
> Disable the test pattern generator that uses the INTERNAL pad flags for
> now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/maxim-serdes/max_des.c | 3 +--
>  drivers/media/i2c/maxim-serdes/max_ser.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/maxim-serdes/max_des.c b/drivers/media/i2c/maxim-serdes/max_des.c
> index 1cbe4c3a3233..cb43edf7a9ae 100644
> --- a/drivers/media/i2c/maxim-serdes/max_des.c
> +++ b/drivers/media/i2c/maxim-serdes/max_des.c
> @@ -137,8 +137,7 @@ static inline unsigned int max_des_phy_to_pad(struct max_des *des,
>  
>  static inline unsigned int max_des_num_pads(struct max_des *des)
>  {
> -	return des->info->num_links + des->info->num_phys +
> -	       (des->ops->set_tpg ? 1 : 0);
> +	return des->info->num_links + des->info->num_phys;

I think you need to add a comment here and also in max_ser.c.

E.g. something like this:

static inline unsigned int max_des_num_pads(struct max_des *des)
{
	return des->info->num_links + des->info->num_phys;
	/*
	 * TODO: once MEDIA_PAD_FL_INTERNAL is enabled in the uAPI we
	 * can add the TPG pad:
	 * return des->info->num_links + des->info->num_phys +
	 *       (des->ops->set_tpg ? 1 : 0);
	 */
}

That way it is actually recorded in the source why the tpg pad is currently
not added and what to do to add it back.

Regards,

	Hans

>  }
>  
>  static struct max_des_phy *max_des_pad_to_phy(struct max_des *des, u32 pad)
> diff --git a/drivers/media/i2c/maxim-serdes/max_ser.c b/drivers/media/i2c/maxim-serdes/max_ser.c
> index e9bb722ea22f..c8dd5c3d352c 100644
> --- a/drivers/media/i2c/maxim-serdes/max_ser.c
> +++ b/drivers/media/i2c/maxim-serdes/max_ser.c
> @@ -90,8 +90,7 @@ static inline unsigned int max_ser_phy_to_pad(struct max_ser *ser,
>  
>  static inline unsigned int max_ser_num_pads(struct max_ser *ser)
>  {
> -	return ser->ops->num_phys + MAX_SER_NUM_LINKS +
> -	       (ser->ops->set_tpg ? 1 : 0);
> +	return ser->ops->num_phys + MAX_SER_NUM_LINKS;
>  }
>  
>  static struct max_ser_phy *max_ser_pad_to_phy(struct max_ser *ser, u32 pad)

