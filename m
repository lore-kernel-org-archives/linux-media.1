Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580118;
	b=Yw/1qhCusuUkx0hjs65cEVGoYorX8oUxDT1jxGAzkLbNyF9qhegZcxb7pzFxrQ24fR1w
	 hzd+4q8kImebKU9JbkmX+KUJlbcRngvH9rqWL07xa1XPOuUpIDPyp+jW7o8sf+7kV7u5h
	 fkETcNqg+KWjJimCEr16wBbbT2rWAkByxglHKEMUQmCyVwm7hFpOuTZV5lkgd1iruToon
	 R0DpErxWSpqlO/+vDZhxL+fmxyj3kjD4lndM+ed5S2u5JAeYLdWwasYoo1NlFqO+7YsS8
	 W4DrKmqyxK+z03dsNojnt2/0X0Uc5NmWmcK65ZNMDl/xLekdWMzXZQRcKhgG+FXJK1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=G1uiQHxbXrieX6SuCwOLJ9VY1wFor0LUhTYsmcPsDjg=;
	b=g8cRJnEsP1EmrnMgbQUlQn8x0BCWP1diHnHpr7uPJm0jITl2VTf6db8XS32S01AWuDFz
	 eGH+mjnYzvDG6TDEa9x8gZxy1CRWSP11O/+I8hVGMcY1TeQuNn/ujrJ14Ka7fDxqYSdDM
	 31lvw4nFzFEnaJsIScxFQvDHvzY9l5g8Yp3C7dadsNNxyntQ130KvTpob4UUzbSxEOL33
	 D8W4fJh8Yv6RVP7y2OwomDOMmJmMN1HfMQcYClXFFj/mID5PTyuW6LLLx2cYzscZUvGMY
	 gHFOi9DiChHVX8RyrAMQwvKC8IJMibQzpzKqh+fADnc94iFrdivlxmfhTsgcpdDs4BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="llFc8/0Z";
	arc=none smtp.remote-ip=74.125.230.192
Received: from mail-qk2-f0.google.com (mail-qk2-f0.google.com [74.125.230.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3A5606A337
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 14:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE3A5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=llFc8/0Z
Received: by mail-qk2-f0.google.com with SMTP id af79cd13be357-93f184dad7aso62343985a.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794580116; x=1795184916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1uiQHxbXrieX6SuCwOLJ9VY1wFor0LUhTYsmcPsDjg=;
        b=llFc8/0ZrRiznz4s5kIn+WPYvCaGrRUeXsjdzRfo7PkRlJehbvBNzNZAr/U5jS1luS
         K++rM/1ndjM4y10976teDA4nL4AC0OHFdIWvgEpPRnK1LMMSoRPHSRMZwRutVsF5KJxl
         vAg/xH91RKyxvDxUlPNTYSnTV7aQ0OvEmh/cmqokAmmt6AIPgw8Bz2AowAGaulFiPZAo
         F3ULabsuM2YMr1HxfzMAXUbi+aQmobWoN+oPloJw25kf5jtTREN0pudO7X9OOMtjiyj8
         GBOlyhXfYwvrigm5FaPYjF36Ryip055gTC3462yvpW9W1f6vuRyC7JUrWvwIz7ycX6pt
         KTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580116; x=1795184916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1uiQHxbXrieX6SuCwOLJ9VY1wFor0LUhTYsmcPsDjg=;
        b=srfX/QoRev6V4bohIqVKhQ539EnU6P+Z952Mtj9Q2jHAkp/zFQ5AARv+csuhNGo6Ku
         vBTyb4OGZb4yRkDjDLzgP84Zb3ZgFXKfHisMRkSJ/iemK9z3VPDqOpGOACrHtQoWXYo+
         GgVNM7NYcaCPOnpgbcaIsEzBv1eGGQz6MwdMb+Gp0eHKqqRsE/7Jujt0yMyLoOiFOAM/
         /ye2+gUaS0UAbc4EjPGoMP5LsvBko2zUk997LuahorOOqFXxgYWo9P4Vok832wPsFSFZ
         j0iYzGEpOxwfWpjZwEy7j2QXWA5jozhuXnhp/nuQ8IWahf0FOKwa+G3bw6HoNOOQWOMR
         fedw==
X-Forwarded-Encrypted: i=1; AL+hErEUamyRsqHbpAT1TC7DQx0xYsIPRKyLGIR5OJXi1NyrsRIgUL0ojmRy63MztbJm0ZG5y8eQQxHXwujeVA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+u2TnyLRcVqrF5u54fIcfiYN5CB85z2hYDolfkrzPB20ZECE3x
	e0DAQk9zs4lVQEQ37i/YcXRp85Uv9LSY3V60vTQjBQkKUv9T0lb2j1XU
X-Gm-Gg: AYBFou0T6cclacfllPdRACHvFs+Sgqk/1tpUf6YhpkpbYWq7uYvoOls6jLPjN0sVJE8
	+NBzkXSY8dffFXDhxr8gkrPJ3uRYKoE+Ogt93EnbCSbNxanstNCTILHi47WsFz1XinTZddu2VB1
	onlFp6ucSAldKR1RAibWgqIcLUOo/Mt+The+h+CcE4xYluULW4ZlDWpW7/523Xh3kzvuWORC91I
	5Zt8ICh8s0He2jaF/M6Mhdgu5UH965j7Qg5wWCtgmh6cZHnGxij5EtvWVunFzcD7uDxMApaV2rx
	zUk1vOoATTfL/Cpj2sZzNFNTaIa9qy2P+Wf56N7xyy7xFgBqybcjSfyr9BMIl4i97fOxyFpkRv2
	fm4rsRU/7Ii5GcI1xEjJ8Rfr3i+Vk4pfvJsU7lfgQCsxCSc+7JAuVtkWz6khhJQNn5gdEf8pP8G
	tV5iYk4PQ3Dd9x4zc98c3vEwvLuwx4Cv5uOyprNNdoeZb+Pjnm3PAnPo9t6By530VPZccYwiy/+
	8RCNPWYEtObfi0QoT56Lxgm/PRSvjNekClHOx4IoGtI/HgJAWQUFFU1VH/2At39UyBp5iZqj/mC
	OG+ibpGchoddOl9mdsrMNw7aqIJ7L+Wcq5q5Ti8AJvUtA9D0y7T3tmlQpq/CEJU0x4U=
X-Received: by 2002:a05:620a:6c81:b0:93e:9792:fd47 with SMTP id af79cd13be357-9494ba5e524mr406776785a.4.1794580116359;
        Fri, 13 Nov 2026 06:28:36 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm194977485a.18.2026.11.13.06.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:28:35 -0800 (PST)
Message-ID: <b7d42a96-6827-4251-ace4-1b3a86bb7593@gmail.com>
Date: Fri, 13 Nov 2026 08:28:34 -0600
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
Subject: Re: [PATCH RFC v3] media: mediatek: mdp: Keep component suppliers
 powered while streaming
To: YoungJoon Lee <getfeus@gmail.com>
Cc: devnull+getfeus.gmail.com@kernel.org, Xiandong.Wang@mediatek.com,
 andrew-ct.chen@mediatek.com, houlong.wei@mediatek.com,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com
References: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com>
 <9accec98-c16e-4815-a479-b84fc39e4580@gmail.com>
 <CA+m4KrDA9rx9YB4pPMdZ+Qg-GbGyYb2Mnfbb7NdgrwGWduEuYw@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CA+m4KrDA9rx9YB4pPMdZ+Qg-GbGyYb2Mnfbb7NdgrwGWduEuYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Youngjoon,

On 11/13/26 5:40 AM, YoungJoon Lee wrote:
> Out of curiosity, are you working on mainline Linux support for the
> Fire HD 10? Your mention of the board DTS being under review caught my
> eye. I’d be interested to hear how you’re booting and running Linux on
> it.

I am [1]!

The original boot sequence is something like BROM -> Preloader -> TF-A 
-> LK -> Kernel (simplified)

Back in the day there was an old boot exploit you could use to unlock 
the bootloader and allow booting other kernels [2]. This let me replace 
the vendor Fire OS kernel with an upstream Linux kernel (with 
modifications of course).

Almost everything from that is upstreamable from that, EXCEPT the lack 
of proper PSCI 1.0. Amazon's TF-A is PSCI 0.2, and a broken version of 
it, so it's more like PSCI 0.1 in practice. The upstream kernel expects 
PSCI 1.0 or a spin table, and with a spin table my understanding is 
you're giving up proper deep sleep.

There's a newer unlock [3] that works at the preloader-level, allowing 
us to replace TF-A with upstream TF-A (supporting PSCI 1.1!). I'm also 
replacing LK with U-Boot, because LK has some arbitrary restrictions on 
kernel size that I had to figure out by trial-and-error annoyingly.

I'm not the only one working on Fire devices for upstream. I'm aware of 
Ben Grisdale working on the SoC and DT for an Echo device [4]. More will 
likely come in the future. I personally am working on the Amazon Fire TV 
Stick (3rd Generation) and I'll be cleaning up more patches for it as I 
wrap up the tablet support.

[1] 
https://lore.kernel.org/all/20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com/
[2] 
https://xdaforums.com/t/unlock-root-twrp-unbrick-fire-hd-10-2017-suez.3913639/
[3] https://github.com/R0rt1z2/amonet-koboreru
[4] 
https://lore.kernel.org/all/20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch/

Best Regards,
Ryan Brue
