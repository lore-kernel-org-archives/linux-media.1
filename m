Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596640;
	b=hQyqQttQV10UQcuvrsxkm0BQ3V+Dc/DUKBbo/ZwT3cvqAlEFrdh8iVXxoPVOfSrbaxaZ
	 /a2YM1dTKDoyHC2GAeS4vz0DvPwMYhD8f2iYmMgOvc1uo/5J4zhuhzjfu4FRDm2QweEXy
	 /qzDxdI9BKcQsB5WAhssqJO71pJVAAqWJzjpvNdvKATGaif406SDedS239rMPP2uDwigZ
	 W+9ovY+tiI0Z1d4EVtnve0AC6GgLFt9WnyorGBv/Jlnr/v7rcDwdFjHxryHSyywbZKyOM
	 oajvxcCJ5R3dY7Kpw8EweMsfcgFaYqBNWuag9jk8YOUBbucy5YRCkFhn/KMvXyxHXnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
	b=SIcnGiQL0TgEl4khwILmhn43UKcymGLOvb0SnS7q8Cha0uOAA9+hBr9AooOh8akeb/J6
	 8HTRLRFOG211WNVeqlR03IVW0GnuCWSJzUPmOb+UKKmeiyVrHvpPhH3+n3n6w60czAdVR
	 2nkblOMwNGujm8JjeNY6KewBmetjg7WylinWdXGKWKN+fSeuoclfVn8UTksIpyODDqsDO
	 bGlRXT8N6zi9ljgMseyqRNnjWHepwBeG/L9+MmGhuPLnUiGXG3f6nkLEV6ylpBMc/jk5w
	 GI0q3dT7ZDIUscy3u5aGuLQoUSyilNV4SoEapEYN6vGRFISB9vXv43f2W/yubwRfqHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OBl7H+i6;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAE0606A33D
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EAE0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OBl7H+i6
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso27611176d6.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 11:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794596639; x=1795201439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=OBl7H+i6ZwCYqyZENMFkOks9QMvP3Q1O5CrDefd7QEnoWxR7Gzg2PWplPwjprGwO9m
         ONLcl2A+SicRV5yCDWOMiHwCcJzaUmNARnD8racf2rem5cydfXkKMyTLGas/HjHQXhp0
         TTMH+rLW9ObkrPLd+QQ+P9H/NwQsFwau/hQwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596639; x=1795201439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=DkAk0JX7v1FFYjFph6ILTEeQjd/nGrflGX4STpcPT2IUOd6ygJ2T9ajLBdAqB4KQv6
         wB59+x8YLtT0+7hKjDUuCCv1YUkbwgVWS3669rtgVD1hL0cagP/DWXPshnHDjWwmtF4O
         QEabng8W3Pkn4YksmTRZfMWrhuPIFhM0pUQjxBQamOHkin9+sHA4myz+EMcomWwyS7Ir
         JkmkMiN0xb6F+08T8CEzQw6KbxpZRMPpnQ/3RU6AWvz7c8qKpTrRWCktZ3fR5kolYs7w
         VgFK7xVMd26rsIa2W01dUtSXu2+DEvUZXYk2zcG1y3TbHgVnYigEg4mDMBZZ/jUuKyUO
         JjhQ==
X-Forwarded-Encrypted: i=1; AL+hErGDuiWfECerpKJkvqrznBD5R+Dz9pIxPeE7zSiOX7NLkE0nNUAtpYDiv78h3ZHrYCcKZaOU4eDd3I+4qQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fg9z3mnemrI1uQc1zVnN/0OX/zIIq4i3zSL7W5h3NspYeu+Ld
	6BCnfytM74mr8tD2MYycX58nlyqHnGRBCCBNmkzETQ1yxpvH67LvQI+eayVlGaBj7g==
X-Gm-Gg: AYBFou3lRo/lj1ChHWKnUStoFMgr3+NOI4R+J+P0HdwsJ+E7kk3IYfxwon4jJLl1NhS
	enNmecCV/8SlRO4paPiRPe4KJKsIuJZHMenQaYa+PFuMzLzcI+7uxxmdkoTT35IYMGUgjmLJlbx
	6+Q7FJs59pmlMfWexohrQr4w6kR4MX5Miw0/mO9gj93pws3+6+Us7vhi0Vmzoq1redEqLq4rqhs
	bixPb++udOqcl6il3nTztCCkK/rOh5POcKHexcOtYkiy58DZkK2EaTuYGIDar+HbmY71cnohBpy
	iHigacM7sNMU47w8dCSMWiLzUJp3M5w62XxbHowzlNtv9cfAnDr9/teUzyMDuG+cehYaIhp5hRc
	LDeXc2mXTIk1z7/2kE+8qB/5uwgXjmZADIPVyHDSF9F7e/EqXOY8ljLJFrgMO6o3550xI2VmuK2
	zySHKAt1V778omMBVYnTq2Rz5XnPonj6x5hNrKMuZ1KepsbxNJime/DdixTDnBSAqs8gHSNtX6z
	GkrRywJWoCSRfoMRamlyJvpQuaKEHqmERTTYwiFWWxT2PPY8O3LTnsAKvrANUcLcPZGQ8X8lpRJ
	iK1DgVAEGT9XmTZsDSwHWnJT
X-Received: by 2002:a05:6214:4409:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-91f241ddd3fmr55479136d6.46.1794596639018;
        Fri, 13 Nov 2026 11:03:59 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm27000686d6.27.2026.11.13.11.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:03:56 -0800 (PST)
Message-ID: <1b84bbe8-28b6-4a74-af0c-5b9cfdd8b394@ieee.org>
Date: Fri, 13 Nov 2026 13:03:53 -0600
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
Subject: Re: [PATCH v2 6/9] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, Alex Elder <elder@riscstar.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:50 PM, Mukesh Ojha wrote:
> ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
> TrustZone authentication, which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
> qcom_pas_context_init() and qcom_mdt_pas_load() and
> qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

I haven't reviewed the rest of what the PAS library does but
I trust it does the same thing as this did before.  So thanks
again for implementing the non-devm interface.  This looks
good to me.  My ack is already present, but I'll reiterate:

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 14ac2d2faf7c..0a37741c2285 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
>   
>   static int ipa_firmware_load(struct device *dev)
>   {
> +	struct qcom_pas_context ctx;
>   	const struct firmware *fw;
>   	struct resource res;
>   	phys_addr_t phys;
>   	const char *path;
> -	ssize_t size;
> -	void *virt;
>   	int ret;
>   
>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> @@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
>   	}
>   
>   	phys = res.start;
> -	size = (size_t)resource_size(&res);
> -	virt = memremap(phys, size, MEMREMAP_WC);
> -	if (!virt) {
> -		dev_err(dev, "unable to remap firmware memory\n");
> -		ret = -ENOMEM;
> -		goto out_release_firmware;
> -	}
> +	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
>   
> -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> +	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
>   	if (ret) {
>   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	} else {
> -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> -		if (ret)
> -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +		goto out_release_firmware;
>   	}
>   
> -	memunmap(virt);
> +	ret = qcom_pas_prepare_and_auth_reset(&ctx);
> +	if (ret)
> +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +
>   out_release_firmware:
>   	release_firmware(fw);
>   

