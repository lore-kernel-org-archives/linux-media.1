Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800836;
	b=LQFZsAwRB/HFS9JsFjHi7/mimmS5/KvsWXBnc5AEr+bhuWwI7i24c2Tp0+f0AalRVpzJ
	 cP+XjKKeQkUovxHaU0gxqCZHUmWtOLMqR+OXHBwmjCmP4it6FjEkeP29oH7Tzpxw3kU5T
	 i9Lk6iyu1OW4VBSADtR/yo1cwMousxc/Hs9Z4BV8+HghAL8Hq0C6zrC4jUXTdQ3TZRCfr
	 OzIuO4fSti4K3g3L2pLCq4eBLANCGmakX2BqU+oPiT2V5vhH9W00upl4L1cB65Gd8Vsdp
	 ReqD/aKuQAaLAnAMsZuyLAR8K7RlKARyChDPYw6Ub0R4kyo+XtICRwCrTIKyI2yuSfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yLSW/CJ9qOILUYlmIBoazTCqPoZKnrkzdeQbNG8MlDc=;
	b=Jqz+NZpUgW7tiiDxMNZLWwCf/rvgojSpc8M2QVttNDU/6x+rfZEJ9IT+Fgl+OOhmHeeJ
	 ivWOdeqUmlpDrghIcxdQ7CELwVgW/MMv+fOaYUZw6RCFSlxOYuwmp3SAe4NazYTfmilba
	 0xibTtvhpHHZW0Ux7a/IG48BPQAn149w17Amsa3ac59LNJ80oVo9dyFwLA6k1iQek2P7+
	 dwX1vqJcFdqN3lSWpQOMM0N/DynCSq1IYoZWB/YAmQ3JXi1Dt5aQr7Ckz44LoMP1qhrOO
	 ppfkdisUnn0y6uwaYQkhXZ9oCeoBqFCuq5D1vy6U3fFlaJtEf0vA22k6umRDzZkpgpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nhmHfB9B;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CB9606A32F
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 14:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37CB9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nhmHfB9B
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3dd6f636so49339e87.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 06:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793800834; x=1794405634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yLSW/CJ9qOILUYlmIBoazTCqPoZKnrkzdeQbNG8MlDc=;
        b=nhmHfB9BA7eipvNVWaA2Gte+/EuT7A9kKbfv57jnv9GerCXmy2xu/MiC3444R8X/zL
         CWlcE5Y/QVXtSZlg5l/Qkov43ieQyjwX7fZLfJOppIyIcH7rMTg9fTXrNFUYQ2jZCgd0
         CaOs4V31RbJAEB45XReNIgWcEuqqO3nOF14L/+wmihvANf1K5c4b2HyUU19Vq40riAtw
         r8QW0tK/PhteMxYNJiZ8B34VzNedlLYAoqCSJ/ES9FIzNBs/a78POzFCXD2rRDYZwRy9
         JLRaIl8bY9XxzhRieqfVYt1PN7AkG80gBzTracYK7Seu3BT147aL1kky2JHChH7CwXf+
         RKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800834; x=1794405634;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLSW/CJ9qOILUYlmIBoazTCqPoZKnrkzdeQbNG8MlDc=;
        b=ubcyHtr5e2rz6YfPU2QM5nVIwC7y/1iZBKRFDy0UbsfmpHlMa2Kv79u/7MLmAlTjDu
         3B0uQwyl4592A5/bjiXP/FE/6BfAJM9NotKap78DKqCy2Pen/32OoU1nBy2eMXF/Bza0
         ph/3+ngWY0OZ4rvgIdGRVAKvk0TJo0eM86VbjOcfOmR+BCqxTsIUv1WcwJbO0r2jsv6q
         qlTd3qHCNBqaWWcBlD9VSCAbWU7jBAvLIjEkl+qimtZKqdnNjip0HWynNTfVrVFkvXHJ
         8acu1wYhorwOWKJtKIuU/7onvqk92ICympvjk4mKoD7H/O2K7So4bGoXlsB2diKTcijR
         LSOw==
X-Forwarded-Encrypted: i=1; AKwUvBxS7JI5jV7pKMnE264tEejAC1H4YZyLvGuYVIQka51guYCQA8bUtsYsDJoUx6iWAztyxzRJ6+WCnvaOlw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/S9ptzbtKPST0Wp4nJY8beY/x4sj0F7lWs8R6XcSbH5q/9PSLT
	VuoleXrpp7y2W/g3S78zlLx99hZZPL8mKz5c6H45ajZl4MKFxRHqdG8xpVUtZidIZqVaj3nPb5Q
	1FfEGJlo=
X-Gm-Gg: AYBFou3L9OqsBQYydFBR5Y3tuH6I1mCsvNXLsSQliky4ovgTQu2u+xr0VV6VU/PAwNj
	EC3c+HNKBGfFd0R2qbn/ma4qgbNbLZMcyyXK8g/khrB70gQfqAGTLRlesRb6rp6xmVcZjCWpcx6
	mQPx71lOGfTcf+GcRQRQH3i+jkb5XSapmOKxCI8kNvI3yqlAv/AzK17dhN3nWCkObFM4hziibiM
	wgBI/+fHemsUOtflxBgnmUk70gsNh8jUjf9iwO0W8xIGUbjpJVQIdS1fQxKGvr2pMuV8x7Yi8kk
	zUt38W9otNoQ866S1SqJw8nQOo7Rt1NHMIAg+vJuEF+crfXJ4dY2urDPkFJweROu30J6MKBbSxe
	4N+gqIfwAMWTIYAQ2QCgYJKQMixzs5p3Zh5b+/vXNQs333za/thE0TOoPo8i5QDviPt1sT0NJUb
	y/HXuJUazbh9NmGmvOxhhp99JiPAtOXHm+4Ylw/+VraFg5a5vnDONFAyx6cFbqwP3Nyq8roypGZ
	/q6QHe/GVgFqc2aEwNwynDMmU/P637BFZXSpzZUM/wly/PAbXbmJG2oghldHtTaHXYQqbfr81Cn
	JXjRxkrM8865tQqupudoUeTagXlYSYSb/3WowHMc++URzY78WJEqDJ9dlK1t6w6htXW7pq2XZNn
	RiIvwKg==
X-Received: by 2002:a2e:9592:0:b0:3a7:7ce9:7530 with SMTP id 38308e7fff4ca-3acb7a59280mr29824581fa.2.1793800834086;
        Wed, 04 Nov 2026 06:00:34 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6bec70sm4550261fa.13.2026.11.04.06.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 06:00:33 -0800 (PST)
Message-ID: <48f56fbe-9db3-46b7-96ed-a6e3b535c0a9@linaro.org>
Date: Wed, 4 Nov 2026 16:00:32 +0200
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
Subject: Re: [PATCH] media: qcom: camss: Change CSIPHY device name from "csiX"
 to "csiphyX"
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Frank Li <Frank.Li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
 <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/26 15:46, Bryan O'Donoghue wrote:
> On 04/11/2026 13:00, Vladimir Zapolskiy wrote:
>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> index f99eea2ef228..dcc005674d8a 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>> @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
>>    	csiphy->id = res->csiphy.id;
>>    	csiphy->res = &res->csiphy;
>>    
>> -	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
>> +	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", csiphy->id);
>>    
>>    	return 0;
>>    
>> -- 2.53.0
> 
> I'm 99% sure this is a change that was made @ Frank Li's behest i.e.
> that csi0 is how most other systems do it (true afair) instead of csiphy0.
> 

Let's review the discussion, please provide the link to it for further analysis.

v12 has "csiphy%d":
* https://lore.kernel.org/all/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org/

Can't find a request to change the name from Frank's comment to the change:
* https://lore.kernel.org/all/ak_HfEIpXj6Aky9c@lizhi-Precision-Tower-5810/

v13 changed the name to "csi%d":
* https://lore.kernel.org/linux-arm-msm/20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org/

The reason for the change or even the change itself is not in the v13 changelog.

-- 
Best wishes,
Vladimir
