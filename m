Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809523;
	b=Ao3JLdjoG9VeNb0rFKAzPloZQYWNlAnekCtnz9iyjP6KXEFZ1zuGMa47JGCcYATpYIQE
	 bC3eKkqms/oMoLilWOV4k1r7nCnVI07dLlDMWl0K5fYSEQW+RgAwwXvXhBOLolzAqCqbs
	 Aepqmo5+JyE4X7jRyCxSuS6QpV8XQECss3rSLxvk0Um2ySZj1Cji8VNI8cmzKYwTqoIdX
	 w8ymb9Kyrv0hgpQ5DMKuvL58VXZFoie4s1dNPiJIxfUy7Qri80cfr1xodfWI1DRMKuUyp
	 or1xvD4xeT8rJDZzG9+4g762TARp6vO8xlnGtPyVNvb7qBsm7kjj9owH+hnyxYfdp1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=x484ZhrTGAE9p1E5ENgypW6izGXfAInwMb522CXH0/M=;
	b=EMNObHwdSsZ91VgZ7B9wZGg7H8EVj/SIGpQhOjZXxlRwFg2n6ssVVioSBD+I4IFnCIAT
	 XM70UhXf7WXucmODNB7Uv6BPwRTsBvS5uIPBL43U8SZ9V4zdd9W0Jyszq8DW3QAqMbWxL
	 7yAp69FSQb/JwjRUgt3RJQS88sYO6PSbtkpPV/xLxrkN2/iY2wqZQ5VJ0ixKoPGLgZF73
	 c53gyiIAQpOYL+IUN0rc/viJ7p/kSQ4NARRaeAc52DEOnlfqgMAKTQloi9cx2VggAZWic
	 PRAMkD9o8Gj4FcGLJAHW3DjHNl1PkBh1n0uCsQil0ngeOTsqvnQCSgab5S6MQbxBB6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cnisikzh;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5D5606A32E
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 16:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5D5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cnisikzh
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so867181f8f.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793809521; x=1794414321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x484ZhrTGAE9p1E5ENgypW6izGXfAInwMb522CXH0/M=;
        b=CnisikzhUtdcZehzae5PTqWUH4SNGsg3CZIUq/Yg7q11AUdGbPmoiMfk7sjq8o8ylz
         ssHaxohl1993Hoc7DDJeaZJezYFjI0hnM69yt6WJltYauCuQpfE17YTGl36XcTGIrrAP
         kvbFhRkb3A9kfJaQUljAn8Ioha6HlS3DEE7nULd6mYvXsZrUaiYk1HE9802EAGsS7YOf
         JxFoSs17scZ+GvYbC76yaX035A+qcw42oXH+3pF8eqf1mOJAfVQfuBbdX0gwG/RlzQbD
         uYrjzR2q5eP0KIdLguF8TUFXnWtd1+aVngqZ4kSgkcVYXCw+3bJH6s4byVJfWU3ZhFo4
         UHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809521; x=1794414321;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x484ZhrTGAE9p1E5ENgypW6izGXfAInwMb522CXH0/M=;
        b=GMewdZE4hIVOIp9HabnfcqkIGFgdBOvydEofxGyTYSWxq3lbsTCUstHbNZ8rmK/yfH
         zotqxkQHdBOixUBBW5FZ/pQXG10HicPplkQMlpTVL5RvJMUTHVZWBdA4+nXqBmMj+A46
         zSZxUtf87zC6uUfnEIUk+AlHYif5JgzuMinnvjFTpXFvt9qlmV2evVeNI/BBw9mdgWNz
         6AuJSqOmGkbzmcRhaAdUHqn3WnyR21Ire72RcEmkG9lxyyTiKA0QLLEaNc79aH4sAz4A
         YufV6V9yYBg+ZDPdKZ4Mi28jBDT36gmrbdb1Vs9DdKr+DKMdLumZU36k//d0a+HaWnuk
         B+Ig==
X-Forwarded-Encrypted: i=1; AKwUvByZpLCLg4vwvWM2qVfoYTSdHOwQR2OQqwqFCBB50MaIqesQSxaujsT/k7BWsCOdVMNufTE8MBqGBFop/A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+SXLVOjPbc7o42OG4UoxxJtnzTHEi8IHNQ6EBSnhRNkE9gE9k9
	nAa56taMgRNY5q+M/ai1wQjd9RJFWciLT+YTwPznYGVS+5ApqN6XV3wfx6nX+3O6B5reV+PnOh/
	DNXa3C1o=
X-Gm-Gg: AYBFou3Ho3tGr9XiaL1HoeUSZzHGxIJDvW32hZmH9LZDig6w9XFFMLdaNjDd0v5xY9e
	jMzuP7/to/o/+jS7IkVCDQpHGtuFv6rdXz3eKoV8b3WWmtJaQqppnLlrdUlEdkLJGlv3BsJ+xkE
	48i80f5IOKOuJ/jN5fG39iUaMYIdwjWzDU+FuQQxQ0cvGDcYwKTiadTesQIn+dU8qRCpIt1yKlM
	6mAEfux/OoIyZ0tsDYdMr/4s3xgrntzcras7v0lQpziIqQO274TvVhrzg6q5iu9FwGLH2LjqexS
	eKNwhsdkoV0v7GACYu9NfI8gSloFvNLh/lvOtKUCds/rI1feMtIJ7jWs0ozOMM+CY5RsPqUoWeJ
	BskvBPtGi/nVZGPkCUsEP5qwP79ox4T5Zm8xsc7y6dePD4wvMsdgXFt6RjxvakD1TFChkMQwMia
	Nygca/gEv1vtCHQ5ZeLBYNlNIVUHS+daQuRfjKeMLl23IimNB7qob1sEeMb+ptIV0Ly3A+1SA9t
	QpG2antEd2le69DAAkRgwnJ56+My5UiF90MuY6VgNQ7UP6ibSRpmk6b/BLS+3BglqYozTRHz2DK
	eOsZxyfHzjveMfyRZpQvgp6fTF56nUr/AStXvj+QkQ==
X-Received: by 2002:a5d:588c:0:b0:48e:3d2:44b1 with SMTP id ffacd0b85a97d-48e6e510f87mr35082049f8f.52.1793809521503;
        Wed, 04 Nov 2026 08:25:21 -0800 (PST)
Received: from [192.168.0.167] ([109.76.163.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181079sm5151097f8f.8.2026.11.04.08.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:25:20 -0800 (PST)
Message-ID: <d24e1238-c366-4963-8cbf-d40487e4b3c8@linaro.org>
Date: Wed, 4 Nov 2026 16:25:20 +0000
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
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Frank Li <Frank.Li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261104130014.681769-1-vladimir.zapolskiy@linaro.org>
 <4e7f2f2d-7c2c-4dc0-8488-6ba71f4b886b@linaro.org>
 <48f56fbe-9db3-46b7-96ed-a6e3b535c0a9@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <48f56fbe-9db3-46b7-96ed-a6e3b535c0a9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2026 14:00, Vladimir Zapolskiy wrote:
> On 11/4/26 15:46, Bryan O'Donoghue wrote:
>> On 04/11/2026 13:00, Vladimir Zapolskiy wrote:
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/ 
>>> drivers/media/platform/qcom/camss/camss-csiphy.c
>>> index f99eea2ef228..dcc005674d8a 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
>>> @@ -839,7 +839,7 @@ int msm_csiphy_subdev_init(struct camss *camss, 
>>> u8 port)
>>>        csiphy->id = res->csiphy.id;
>>>        csiphy->res = &res->csiphy;
>>> -    snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", 
>>> csiphy->id);
>>> +    snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", 
>>> csiphy->id);
>>>        return 0;
>>> -- 2.53.0
>>
>> I'm 99% sure this is a change that was made @ Frank Li's behest i.e.
>> that csi0 is how most other systems do it (true afair) instead of 
>> csiphy0.
>>
> 
> Let's review the discussion, please provide the link to it for further 
> analysis.
> 
> v12 has "csiphy%d":
> * https://lore.kernel.org/all/20260708-b4-linux-next-25-03-13-dtsi- 
> x1e80100-camss-v12-0-f8588da41f16@linaro.org/
> 
> Can't find a request to change the name from Frank's comment to the change:
> * https://lore.kernel.org/all/ak_HfEIpXj6Aky9c@lizhi-Precision-Tower-5810/
> 
> v13 changed the name to "csi%d":
> * https://lore.kernel.org/linux-arm-msm/20260728-b4-linux-next-25-03-13- 
> dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org/
> 
> The reason for the change or even the change itself is not in the v13 
> changelog.
> 

Since that change never got though, actually I agree csiphy is more 
consistent with the current naming convention.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
