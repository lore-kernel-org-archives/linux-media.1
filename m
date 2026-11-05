Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872299;
	b=cMrbutrm2TIODoN4Xwx8gVPzmwWjdEkt6DdUNP4Vlph93QWVSnAeh+6oQPo0XN7qNdHP
	 GaYJc6dnDLG8F0PKfXCmHFCXEaHknJFHIW4AYSV9aunQ9ogv+wBeWuGXglu3xbUDIB+r0
	 dJYQ60S48rveAzCHsPP4DfJ0MqpKxwNrPz02UkiKxvSu9bVO9ussNBTyv/tWxbmxvkeGt
	 bI/TyRqtI4JKHnhHN6yhk3twQTY3Zn/5FtP/Xr7h9zvGAQWFTnBwAqwL/ATGQuAy6TNL5
	 BgCa491cFdhvln5rBr3VoY0Qe5DCsTpiwpTmSRDYTVYa3SKoOAQBHQEBKPQQ0JsOf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
	b=ev6VKW3KnzsoYPmw6lXEL2YI0RgRS3YOMhwhWOZvkM+vbp7hXbwKW+kpqwvf/hOonnnn
	 rveOOdBZYkXwcYOzU8aYs67cIWNnmxc0A/oumI0q1FgeEfJn9TQbhlbfTbzHiCCbrZ9MV
	 DVCT/5X4oFz0A94RNsoUpZhel7dcEYbILUAcTTZlT+fSDMbGKnYFxqGW5wkBYJW9vq8FG
	 buuld8OV+OadNWi42+N5WIFyLJ8O+jFfyDPw76QIE3MjiY9Z4Khjp9yVun09niuATBqBq
	 5Msn4P+EC3nMffRlPimKC2nZZqyBLCPGP3AYhTgKxzJCu4iRsMjrlzb339kzJ4RnJgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2TUIWcz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D615C6083637
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 09:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D615C6083637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=L2TUIWcz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so12727365e9.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 01:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793872297; x=1794477097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
        b=L2TUIWczYjxmSNW3YksVxTTXQJWVA20AXdJ8vCHjMR7GtxLqwju9JKjqMwhaUgy+Ag
         Y0jUBEYZai/ZgKkAW1P4S9HjM1gkSIY8n4/hWTaOnvbBqLdDk3NzKnUc9JxJqZHr5LLs
         qkQ0/gxxMa5dRWfLld4C3/I0Ti0+UZ5xaP1pYzPE4DRRMhETPu5gtXyF6uetxvlNXt9h
         JIcS77KJ+6PPi01g1zG971ug4Q/XwH/bw5q4hy1LmQMmlXOOs050EoF7iYeJf1lpWt/r
         qTCXSLZskxiwyRmjR0p6sI0PUFjLmeykwBgTLdUjyBj1326mzsCbC7p4Y4XUcEOTkSfb
         ImHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872297; x=1794477097;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvKyTZ9haWPfTGY/2ux6Lo8rlburvEYrvCc+2l2o3+g=;
        b=YXU4mnHs+hd3gJkmUmndxAb+9h7Rh28xyqi3z9jbsCX6ClLu9mDqJdEQsba2wH0WdQ
         kZicFmHH4vxy8jTFc3Kvv252I/KmBDkZ4T1xdUQlntTI1EVj3BoN+Vit+b60HqogB8oL
         9Ex8HbHOltmZpY39BVP9EgTocNOaoLLnQB2oW7h5gxP6qMDPu7NwdgDihh5xwlbftRvI
         YjURt4SYLe8NWrD2PaqG6SBTZeRdvcUhGLBl/2vW8D8ckJyPe62RQa4GeDS2rBJoXQff
         NGDn+uKiyxBbg9Y/EjIFbwSEnzBDS51eRwOy+yqaPG1YkaoLeSnmlgRJNVhW27/EQhus
         uEsw==
X-Forwarded-Encrypted: i=1; AKwUvBw/D1OQ8a/t01YlrdZLaszBGttCdaHENsJv7XP1Ttf4bxdmAbuiLAp9NhQEcmr1z4q1WYuOaYug+xsU8A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0twZy4B/JQ1NKZNIFdv0mh6XR2RNLzR9wwtxbRkM7Q3o9Bj2d
	ZSCHVbD6Sz96nXpMKskuVoHOKecZKzLWdWTU8BbTekEK0p2T65xRbo2AW8ds81Ks700=
X-Gm-Gg: AYBFou3XlAM0GgocrHXqGo51m7bnEE/NzvYKUI5q/KBoVH4Wjca7KI6ZCmSXWALyMCx
	mKWbacW8oIPMzAidwytjVC3xbiAe2CWEeyP7Q0b9puPJeLPXupg0NlPgfDuFYlE9G9Kejx4cJpQ
	2oIEOpJv0uGki6/c/p/w0HsLuyEZjnEhcKlDiU3VF7t40CbNL7Bm5IO/q5bA17/bcVZfXGDYD4R
	rwePSdcSzoBTJzddA8C5U0+dkYpc3ucvCVKClByzIL4dtp/mVJ8JnNdXzzJeFruIDUfJAdSp+mP
	TPwjO9Dx3S7K+cnU6XOEBS7LMAbbVdUNxMaIA4dKmjqUrFdMwdRxgC1RerzAORbd3aad1ROLAdd
	WsF3ZjHHFepgTMfe/5iCxLdRqEitfAigbr4V14T+Tc+6veqZIL751T28pgWR5Qz3viqja2s1KvX
	Nl3rsaZ7RinfWAxqqMhT/Of/c2C3/PfuX8ud/KVawA0/3Vt77LoZ2vfIRqSBKgL5VSc7Ork+49o
	atZkgZHmGbsVFNnvCnHMC7RnLwS9i26KYyxjkNsMZhRuZ+qYivldhymGcGg6fFOzm2ryiFwECsD
	vVqy0ScWFdw5qgiZoIntkkbc3FpbxWPbTMmXGnts
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr404951005e9.31.1793872297245;
        Thu, 05 Nov 2026 01:51:37 -0800 (PST)
Received: from [192.168.0.167] ([51.37.126.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180e7csm9090994f8f.5.2026.11.05.01.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:51:35 -0800 (PST)
Message-ID: <aad7cf3c-cc25-4368-bcff-7e222f22ca99@linaro.org>
Date: Thu, 5 Nov 2026 09:51:34 +0000
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
Subject: Re: [PATCH 2/4] media: qcom: camss: Select Titan 480 CSID offset by
 VFE type
To: Vladimir Zapolskiy <vz@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261104234533.3044265-1-vz@kernel.org>
 <20261104234533.3044265-3-vz@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261104234533.3044265-3-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 23:45, Vladimir Zapolskiy wrote:
> On Titan 480 CSID register spaces are placed inside VFE register spaces,
> and the offset of CSID registers differs between VFE and VFE lite blocks.
> 
> Instead of the assumption that all VFEs starting from the third one are
> VFE lite blocks, check the VFE type in the platform VFE resources.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index a00791b00feb..9e64e8d44926 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1119,7 +1119,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>   		 * between the VFE "top" and "bus" registers. this requires
>   		 * VFE to be initialized before CSID
>   		 */
> -		if (id >= 2) /* VFE/CSID lite */
> +		if (camss->res->vfe_res[id].vfe.is_lite)
>   			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
>   				+ VFE_480_LITE_CSID_OFFSET;
>   		else
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
