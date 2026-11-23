Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444972;
	b=amSMK1T4BHybaKnWLgPfxFVkN5RvoLdwiCTnBYsBFUZeaHaRE/qDdNjTi7lJxNx45h/Q
	 FvqPWkNh6bQSbvhRaVsYUugPlDO6K91Q2kiFTqHss08DVj68017zp6JYp05ebztiI66Ub
	 nIDoofn5NTkphi0YYgVfFeCFk52rl4dR4LNfoo7OeHMbUCz7+s/NVb6qKkuufgkYw0p2m
	 KQMjMpqi3VQDUPeypJe+M0G/i+IDTcQHF05RESyHFWPCA4xnzietuwme5RWRsP0eHzUVH
	 3Hhy5nP0YIyfY33kK0O7mGmsNWcmFN11c4CmxQFgSPQ7Abh5y/oMsG5yqLsL3/vxEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PSInUSGmoNCWCLBv78RAKxmVaK70Lkm4LuCPu8e8TNI=;
	b=oO8RQoG2GnZbuk6FRkzymL3PS1DTUTPidnT91Z/30QrpiGyuJK5Cdn8E2Nb9naWKgz6o
	 iGgZjwUL8zECwb5aLUW4m8T/ihaRi6SreqCSf3qgEOg79ihTcgGs+btbSbAvV4YuFHDgN
	 h1BrLPu/p+8oTMlAsJlqobzrBKIvA+v6VabpbwlBSbGwpouiyFzn1XPUrdGYf+RCm1Jd5
	 10wNGlto5VJhaAI7ncwhB+Il6p0MqtiSjxX5F6cgCGMAz4vCwantisVXICJu1o3TJDCAk
	 ZrM4jKZrp43TbM7h8YC0cSNzHPOGFhRizXAmQkYFoySFW09MWxpkiKPK0bvFRquOIFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A7Gf99Eb;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4559606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 14:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4559606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=A7Gf99Eb
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5126505cb3so429864366b.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 06:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795444970; x=1796049770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PSInUSGmoNCWCLBv78RAKxmVaK70Lkm4LuCPu8e8TNI=;
        b=A7Gf99EbVb0om3U6UTcAtakVM5S9WHTKrp4ttP3DkQime+XOLo3Ev5eGI9MH+DXWoB
         tHFP7ps+pD7gJKS8ICpyM+wItA0qEJ4glHiK0AIn5j4pF4p8CmgjBU5LwBTHRdXw4YaU
         FwETzGkpprve/3CrJ97p5Z+In7/pWM2DWq7icDBEBxgDdxB0sSRsGfFNx6ix8xzBbCUp
         8fTax8CRkBKvZ2U8Q+j7TBAtLCDhiSzPb4qfUC87Rjzo3mS31WjDkDp7WgUIap8h2amO
         dvVFYA3c6edQEzIWcsIC2skBpfaf28cZ9GsEpfvUWuCWkpwr/XKwxWOXmJy8okubjj5h
         D7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444970; x=1796049770;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSInUSGmoNCWCLBv78RAKxmVaK70Lkm4LuCPu8e8TNI=;
        b=2Hpj/eCm6eThWV3XSkWlmfKny/PvSoJGtIoJTch/SCvYzm4hVRqjfpn/NQq4tSS61Q
         OoLFKE6PktSSGk2hbaAWlG4HFc69gIxKG0CCv/Rb83Fsqpb0euAmnEsBebUBAyHjK/JI
         OCId6w5NszyTEmFMyTv/eXoMAR8iMp3Xe95V3nmOrrIqLpBrtV+v2bfIp2dAxBCO3NPN
         v176uQkffIE3G209K2bK89sgk5JSj9R1NVPSGSb5yi904VTRfMF+XcFy2kw7fu1+ZWRK
         PdT3rxFi+za/5SIloto6e0g4oTsxzU5AmPTR/6buxH0SVoU7vg27nyohuWs3Mr586jug
         TCbQ==
X-Gm-Message-State: APuU4Z9zQ7ON4qzQooq5yoODVH0TUSHZ21KoD+/wHUAc0xepHhjAhsMi
	lKU7KDB4J4GYvQsr/YhEtKNzAm4Fx0rPQBknTCWEE7GSTDMB1z70YM3JV9CJUhne9y0=
X-Gm-Gg: AZFdTZdaSpSkJpgS166gpdyC/JUngghx66VIiNMvVQQrGWP02q5zh8nLv43a64oGZ8C
	xNSz0roHhIokvdRmQGSISbG5H8abh9409M9mPxA/zpMquNUcNx4+W7mNXmbGrQQd9vCZlqxtqIL
	ObR9otM7nsgDfqPit0rYhYOVp0iHCHus3mF1YHxzxdUvLS7Vd/XW48As4hxUrJ9Tw1kXdAGWjuY
	rCUsHsCCFX8aszFDpoaiyDvMNonZVrE8e86t15e6OUERx1SIlMd6SzJQc4TyzRtheqQ2XckC9w4
	R1aJDTgze+KM4PeZAygHahHUwpRT/mgcOJwG04BK6LaKxveZAqc4EGdaqi8c2gcURdmhUl/rsMz
	W3Z3hEJbj4YrignK0D8nvPIadvYAeHmLg9S0EQdT1hlD+3kddQY+HRp2X8wEFleItqEYnDnu/le
	kmsknDco5xkKgT7ckfBF1YiGKF4K2Vn6YDrUSD/TMwsg29RvZON7cc28IG51JNtXrNGGOzmjVwk
	+a10Z++4o9d6QJBcOlqGiMW8FoVqhc7jCYquPxpps5gk7nojZHXEgupkpzgztgFlL/vt8Hlhzic
	jv4l0eFmMwYoKzN6hoTuXklcM7Z+9mRxUciLn1Pimb8dZRdJDcmxYjnM2+33XiE=
X-Received: by 2002:a17:907:3e28:b0:c41:7e99:c6c2 with SMTP id a640c23a62f3a-c513ac99405mr977016566b.44.1795444970020;
        Mon, 23 Nov 2026 06:42:50 -0800 (PST)
Received: from [192.168.0.167] ([64.43.130.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm417794966b.78.2026.11.23.06.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:42:49 -0800 (PST)
Message-ID: <a374af79-7308-4b36-94a2-cf70c6714a85@linaro.org>
Date: Mon, 23 Nov 2026 14:42:48 +0000
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
Subject: Re: [PATCH 3/5] media: qcom: camss: csid: release parent device on
 power-on failure
To: robertijtsma@gmail.com, Vladimir Zapolskiy
 <vladimir.zapolskiy@linaro.org>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261122-camss-fixes-v1-3-9df4deb87ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> csid_set_power() acquires a reference on the parent device via
> parent_dev_ops->get() before resuming runtime PM, enabling regulators
> and clocks, and resetting the CSID hardware. If any of these subsequent
> steps fail, the function returns without calling parent_dev_ops->put(),
> leaking the parent VFE power reference.
> 
> Consolidate the power-on error paths using goto labels and release the
> parent device reference on all failure paths.
> 
> Fixes: c5af8db84c01 ("media: camss: Do vfe_get/vfe_put for csid on sm8250")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
