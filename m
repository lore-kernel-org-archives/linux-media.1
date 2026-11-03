Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715224;
	b=mXE/Me4D2a9imI4iy119iLwh7lo3c5YjLKA87zRBCEnKSk+I+CvwaVGQ7avxGkZPeYHa
	 n3Ui0zgQx6ptGLk5I2fV8L8X5+gURKZp5r4uwNZlq+s94vMf3YCc/nuuomyyyEPC2SD1e
	 Xz5+adf2bBnqdyLavotzrVKoq34cuDdhtI5zDWHz8RWYwhnk28ZSuJGnCsAJVxdCun6eP
	 HftGSvYULVv7yTUDertNANsPIRFGfQBkjqQsf2/N3wDXkxqZfeKkALZEhS/tZ7q4FH4vy
	 bwL/89TdCVmH6QqvL1Npgh2abtBazd0PMOAT7oPvoPv9CCEUeuWJbiCNHOlkyWMrBKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715224;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=1MDQ21pX3Toz1V8apE05n4hy/EMoFe/OONi5tqWTWdI=;
	b=LgXVkgUFUNXxzA6KW/Oobfo06W4aQf80C2UgFylQQO7ogGsFjBioc900S2zHVEIw678J
	 jXDcYD1EmsenqPiQgzo/oBATE8Akri8TvWwq8z7qC2OgboXmx6dWCgEh4SSqKrk+bawcH
	 R7ers6Ch46FmhIaxzFHTjtFy+JmyOp5fcwwLS/NpFS8vsBw1vBSUAtn3L86zBVYoWrwH7
	 uW5S44/3w2Tam/ziC/cxkPvcqr/kq5JvGsS10P0Lwyr1I7b2Nv1lPraja28JFzX6/2/dP
	 SF+5zPhq4LJD2fJh5b24fyJ3phY874UP6ct5BthlFZXfpSMbyYHNud5bMi2ZyPrgmDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=h3yuu5rM;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EA7606A327
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 14:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4EA7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=h3yuu5rM
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0174802;
	Tue,  3 Nov 2026 15:11:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793715085;
	bh=QribmCJwU/LAiCC3d9Mmp/H7nj08YMASjCuqKUqKw4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h3yuu5rMqAqkSxgKRDvEWL4q7xXV8asDO0WotsAysDSXNckep/c2KQwsqFOqw/Kfs
	 GtPEtxiWVRS59Y3H58qmouFSZZSse8uxPHDVoca4LWsHW3BF4+F96z9cK5dI2PjXh2
	 25/QWyZ918yzKXfK8I+YNcQ/2EGGErvSXmf5HZhw=
Message-ID: <ac4fb460-b4a4-437f-a6ee-e0b64e34f9a0@ideasonboard.com>
Date: Tue, 3 Nov 2026 16:13:38 +0200
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
Subject: Re: [PATCHv2 03/13] gpu: drm: omapdrm: call cec_s_phys_addr only if
 EDID is present
To: Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
References: <cover.1793691124.git.hverkuil+cisco@kernel.org>
 <9637a39495312aed32e21407d9a3bd5b8b1a363e.1793691124.git.hverkuil+cisco@kernel.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <9637a39495312aed32e21407d9a3bd5b8b1a363e.1793691124.git.hverkuil+cisco@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/11/2026 09:31, Hans Verkuil wrote:
> If an EDID is present, then call cec_s_phys_addr. If not, then
> call cec_phys_addr_invalidate. This helps the CEC framework differentiate
> between CEC_PHYS_ADDR_INVALID due to no EDID, or due to an EDID without
> a Physical Address.
> 
> This driver is one of the few that was doing this inconsistently.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 7 +++----
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c | 5 +++++
>   drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h | 5 +++++
>   3 files changed, 13 insertions(+), 4 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index bd6c4d2dcdc8..056bede2ec8a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -439,7 +439,7 @@ static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
>   		if (hdmi_runtime_get(hdmi))
>   			return;
>   
> -		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
> +		hdmi4_cec_phys_addr_invalidate(&hdmi->core);
>   		hdmi_runtime_put(hdmi);
>   	}
>   }
> @@ -487,12 +487,11 @@ static const struct drm_edid *hdmi4_bridge_edid_read(struct drm_bridge *bridge,
>   		unsigned int len = (edid->extensions + 1) * EDID_LENGTH;
>   
>   		cec_addr = cec_get_edid_phys_addr((u8 *)edid, len, NULL);
> +		hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
>   	} else {
> -		cec_addr = CEC_PHYS_ADDR_INVALID;
> +		hdmi4_cec_phys_addr_invalidate(&hdmi->core);
>   	}
>   
> -	hdmi4_cec_set_phys_addr(&hdmi->core, cec_addr);
> -
>   	if (need_enable)
>   		hdmi4_core_disable(&hdmi->core);
>   
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> index 852987e67e40..60d0d85dccad 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> @@ -322,6 +322,11 @@ void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
>   	cec_s_phys_addr(core->adap, pa, false);
>   }
>   
> +void hdmi4_cec_phys_addr_invalidate(struct hdmi_core_data *core)
> +{
> +	cec_phys_addr_invalidate(core->adap);
> +}
> +
>   int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
>   		  struct hdmi_wp_data *wp)
>   {
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
> index 1ca5b5ca8a99..234690dd3a1e 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
> @@ -15,6 +15,7 @@ struct platform_device;
>   /* HDMI CEC funcs */
>   #ifdef CONFIG_OMAP4_DSS_HDMI_CEC
>   void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa);
> +void hdmi4_cec_phys_addr_invalidate(struct hdmi_core_data *core);
>   void hdmi4_cec_irq(struct hdmi_core_data *core);
>   int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
>   		  struct hdmi_wp_data *wp);
> @@ -24,6 +25,10 @@ static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
>   {
>   }
>   
> +static inline void hdmi4_cec_phys_addr_invalidate(struct hdmi_core_data *core)
> +{
> +}
> +
>   static inline void hdmi4_cec_irq(struct hdmi_core_data *core)
>   {
>   }

