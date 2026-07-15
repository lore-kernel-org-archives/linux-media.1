Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985B353A8F
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144876; cv=none; b=eSeWZLFI0Rvhs++wRugH2Gdy8BbRoXdclRcfW7L1mKJaGDPg+FWp45qycRVzbrxK7l+4R+qHNjl3qiR1s+0qz6ISs8ndQst7O6sIjxNF92Akb3xdG2f+kT9yGx+T0vtKcr6gbtjDnJ/VVAm6N1YD7Ne0G6M7MTjUraPVtkFGUKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144876; c=relaxed/simple;
	bh=AQ2mAEPbzm04qOGxYXD+C5edEWnqOz9w1cgF2xpS6xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Og0ir7zTBxeFhh98ubdk/7lpY6FQzRMOspspAeamVjTiKolAuuXSgvkuWyyTKj/Wj6/xA9mmi/j9v0waRRN7Y3uTP0DhC5S3q916dYW6ICVA6armo6b5nS50dy/Ip+z/dY8Vei4Kjs67XMJgN16Aj2JlKAEiQK1wTpdVVvQldXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJoxSCXH; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJoxSCXH"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-902fc790cd5so59531536d6.1
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784144873; x=1784749673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KEXXjTtbWbMQrJ2ZliFeifCGsiHTYZZHXWoNLTa8NpU=;
        b=rJoxSCXHFcdsLztytxa/oK5XHs3LLUp69efB9zMFiCVcowdfhSRUcNdq4uYmiuP86W
         KE4BuEv4KadIeoYvjGxf9Oxkkg20PrtZhz/1JI/zC+RftS9op9ksoh3xTJo3XTf1F9AT
         1A4L1f2sclIB1B4RrzXyrbk2K0jTJW7kgwEfU/7XbHCmlbSnhY4YLDirDgCx8QuqRqx4
         d2nilcAn0IqeYf1wv9ouTmiX6xpYD2PdHLRHnxpthYukAs1aC6jC03iFSbeitmXLbHbv
         0TiBP2JEwASNli4nhAEi50NrybswUlv/IVv/EiejUbs9mdZbzn0Cj1UT3Gf0eAeTelm8
         krew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784144873; x=1784749673;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEXXjTtbWbMQrJ2ZliFeifCGsiHTYZZHXWoNLTa8NpU=;
        b=EDBPJKPHtuNw4BawBbH6PXs6s0tHY9tBpAN/H2gweljPbwYUm1t9tOYgXBCrv8nZ6b
         ChoZEClpWJIwUXU8LMO7J1Zang5ts54XnRPndkKTly+uZ5Yk4L4CmLBs06e58GsuTt07
         icnMEbRksLOSPeo/Fubi5z/7f+iv3lua9Ckr6W2koUhjB0KsevrM4vFqoVZkEtuluW7t
         FfzjTO5kWo/pPwJvS5aBrUqt1MmUg1bs70njxUd0vzzuRxSUSNfwiSk+jwGWEZsc7kIN
         dpkDEyPPzwq4o+hTiBXgMcoA6TFLjrVmtoQ+c1Wb5JoMJ2bQZbtRwBpsNR2B74bSo7T4
         FSzQ==
X-Forwarded-Encrypted: i=1; AHgh+RpArvvV31eK38SYdPLFUeB3R0oot81U1kJR0IB546Q0zNviRCOqN4gy8TwUotFpcSsxSnhyBBbORnlwvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi0ikpb3LW0nK2FHiDvSdYyOVkp2DBDXVP22Zd184NX9t1hfuo
	O1bbcBVZoGhVFJuUoufTYvUeG6c0+E3rkXFJVGMn4hKbpher0vq4UaFQ
X-Gm-Gg: AfdE7ckVRz8GrANKLs2IeQSrAVuVZEyvGalPxbv4v9YaSmHoo1TPPNnJZ1aPy3q7QyW
	2hulEJN61YmLW7Fvesn5dNngeBESM1ff8RGfXVpF7xY5ZibUf+TplNBDTJexgBnQmuzdx9Jw6rM
	cP51Bw+bOrfuueqzMDRkWayYInhn36dpk+VW0AA46BuV/WzxIQAFFlT8dyUc/F8sK+BZSr+74jZ
	UWq7lZskyOoXu/Adc5DOiNvW6wOekEg6/9aqmv9YC+9+RY2uQUyMEukC6f/l5xYlOuIaDHynXau
	nRengzr61Tlk+YS1t2jQAj5mmeTvL7AexPt6mbVNTx3RYwI6f77LsCU5uoPRSI2PsArohXoAc61
	eF9Uc26TJEasNCce++6FL5KfuOAjhfszejy/V7BKwFT0g/wDMeOEqFmf8iK3bZsNLdwYAVH2YyU
	CYwnBjJr5jwHikffFR4icW/YSK
X-Received: by 2002:a05:6214:c4c:b0:8ff:496e:1071 with SMTP id 6a1803df08f44-90747c2eeb4mr111182776d6.1.1784144873147;
        Wed, 15 Jul 2026 12:47:53 -0700 (PDT)
Received: from localhost ([174.89.92.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c8d4csm218276946d6.44.2026.07.15.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:47:52 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:47:41 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 02/21] media: i2c: imx355: Add support for 24 MHz
 external clock
Message-ID: <alfj3XIkX-2O5BGp@rdacayan>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
 <20260715-media-imx355-v4-2-f7f966fb9ffd@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-media-imx355-v4-2-f7f966fb9ffd@raspberrypi.com>

On Wed, Jul 15, 2026 at 12:43:15PM +0100, Dave Stevenson wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The IMX355 sensor supports multiple external clock frequencies,
> including 19.2 MHz and 24 MHz. The driver currently supports only
> fixed 19.2 MHz input clock.
> 
> Refactor the clock handling to make the PLL configuration dependent
> on the external clock frequency and add support for 24 MHz. Introduce
> a table of clock parameter sets and program the corresponding EXTCLK
> frequency and PLL multipliers to maintain consistent internal VCO
> frequencies across supported inputs.
> 
> The PLL settings are adjusted so that OP VCO remains at 720 MHz
> 
> This preserves existing timing characteristics while allowing systems
> using a 24 MHz clock to operate correctly.
> 
> No functional change for existing 19.2 MHz users.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx355.c | 77 +++++++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
> index ac59908f57aa..a6ee7532018f 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
(snip)
> @@ -1749,7 +1756,13 @@ static int imx355_probe(struct i2c_client *client)
>  				     "failed to get clock\n");
>  
>  	freq = clk_get_rate(imx355->clk);
> -	if (freq != IMX355_EXT_CLK)
> +	for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {

Did we start allowing variable declarations mixed with code?
