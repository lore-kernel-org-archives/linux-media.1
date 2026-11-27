Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778014;
	b=NuH7s4ldAOednuilS1UbRsnG6oBG2i81P4MsZ68tkuCHNTu4Vhl0tCru7Tl4D+/JesMS
	 PR0zMZm8zsgzsxCZAzW1Arj1vMujd4uf3DaVgu9ryB+IY/hS1+w1TH8i8Z8yk7kzyf8zh
	 FOM4VRtW+D887fvqf7KaEw6wV6Ii4YlW5CgZBuz3tqa52pS9zWGhiyCjkAZ0Kvx2Pvet6
	 gAAuZAxHlBsHvdTtkG9NtE9AX5SZ4PjmRG1XBy+aBcYPLIyGzY282F1DSJ6dGYsesz/3o
	 5B8LmUoDTAmXbLTjepYxj0yptwuZHxwu6biZO73ekecg23RdnvBHLwnhshG3K5PKUdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778014;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=syWf31UNRvhkEHPA5k5RXJurbjpyFdFbGIDGJwJpGTI=;
	b=N5c73V6dIlsgADAlMOGi2dpZfjAxtuUBcoyXCQG5pGnWEaGphCe29csx4gmGWEQcwMa8
	 qalWW1HTzOXBMDjXFvda6RwnbJC+FwVaFcdnCaZTabbKjGXyXAFBKCLDIXwtRmVcPLNIq
	 r3vjSoL+UWIHU63Gfz84AiR6vpF1cqvi8GpYh4mY/8J2lGfhdSHfI6bozVkXCpO6qucvo
	 9WJSGA5yhGQf9NNed8gJk7DQjzJXUAhYD6QxzDAPB/sgtem5x697O7o6BZsPUChWaU6y9
	 sM15YFsyBUSrdXRc4Ih/SmEy9vmrmW5VDRrrR/3EqfccahU+gDGzKqWLVSuJyX5l+EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7dSvwfY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32D1606A326
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7dSvwfY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321201F0089B;
	Fri, 27 Nov 2026 11:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778013;
	bh=syWf31UNRvhkEHPA5k5RXJurbjpyFdFbGIDGJwJpGTI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=L7dSvwfYVIrTp47ancLG78VCrKKlO6d0Pmalxpto3cl7tMjLA/Pz2HjeS0+OnqooY
	 e/Qz17h4/l4CPnLXOWqnK16QKJjJZaSVHkV8F+xQ5h6teeeSKwN6mnBiOlNWSEXPOH
	 +suvFkqE3YHEs60sIRstrmS/RWfsQ+Vlz42puAPeWhEqUSYPmfAWEnvHnbLN13KDL2
	 HBvlPPYITWeWRNY1VlYLXDmPzAo6gNPD/1FxnMz3vcczaydlcxSuwD6fiMzpybu90V
	 /CKfHbbnCqVqwgDGxB9K+juxrRkQxPdGtm4/nNVQG5uBKbzawccmcbRmHL3m488Ifs
	 3JIhuUZw+sszw==
Message-ID: <8a16f246-afa7-44ca-b60e-a9d420bdf6fd@kernel.org>
Date: Fri, 27 Nov 2026 12:13:25 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 02/73] Revert "media: mc: Keep INTERNAL pad flags just
 for the kernel, for now"
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
 "Bajpai, Manik" <manik.bajpai@intel.com>,
 Divyamani Tripathi <divyamani.tripathi@intel.com>
References: <20261118132819.213473-1-sakari.ailus@linux.intel.com>
 <20261118132819.213473-3-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261118132819.213473-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/11/2026 14:27, Sakari Ailus wrote:
> This reverts commit 77a10651b2f23b6a56d27570fa9a870f8e977125.
> 
> The INTERNAL pads can now be made visible to the userspace so revert the
> patch that made them kernel-only.

Please explain in the commit log WHY it now can be made visible.

I'm not convinced this patch belongs to this series, to be honest.

Regards,

	Hans

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/uapi/linux/media.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 2da6ae4da003..80cfd12a43fc 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -208,13 +208,7 @@ struct media_entity_desc {
>  #define MEDIA_PAD_FL_SINK			(1U << 0)
>  #define MEDIA_PAD_FL_SOURCE			(1U << 1)
>  #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> -#if defined(__KERNEL__)
> -/*
> - * Forgo INTERNAL pads until proper documentation and v4l2-compliance testing
> - * are merged.
> - */
>  #define MEDIA_PAD_FL_INTERNAL			(1U << 3)
> -#endif /* __KERNEL__ */
>  
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */

