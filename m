Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794552369;
	b=rjZInWq7cCUAUyGSjcTolPR4OhKkO4jE/VllWdbMV9WbQ3XjlDkI+7GHJn47lN7lIEKp
	 jqXefR9aYvv+MRHwJQBgz0yjF/UMWEyO6RbQOWCw8HgAyj4NJbdDXrfUtgOKV7iHuUdiW
	 AgKznP03xuP+Dwaw9edVnKOR+GCnqjsh5fWPf79AK7Qb0iB/Q3WF1Ec9+dxRXUf/oS7rd
	 wrSbudOyQi4IPECGraaY/YOnKAFbIjplJ1VTcI2ARzQ7XzyS3b54obY3HobBJAmNtbnGm
	 jJvnFB89z3iSqP+L2LhgBBcXC+C0in6zpkjS/iV22TTlitXSZ7skPcthK0OYSVYmfIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794552369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sUqaXX36ZDw1piKG6jmL/DoL8tq5IBd3zye0Czs+X+c=;
	b=mLAs6yU+bx0mxmPf4AsntOnMmPEGtI2DeV8otasDtkuG4CY54+xX6lrZMOII5RVriM2m
	 H0p4l1XML1SEULEMXWFAgWwNoXEUCzv5+Q2feZgmFnsEbCkE9sgoNyG6sApdu+vi9K12R
	 1SNfqPlOkitOSXmnKv2lXQWisApqWJqUukVvBnO+0Fdzyqr35JpQplcpQz/7gsuoAtUhV
	 XbTh/OyyKH1/bN64TIOWsXmShx5eszxLM16wxYUL2F+q5THICqCGChaD6Xp6PECZd6Mtr
	 AV0gdjGAOdmU9/efmg141IxHJIu4GRgJPJDU8hPTzGrOcQdLo++7erzrhKksP5b7fmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFvfG1Ob;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350FA606A321
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 06:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350FA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RFvfG1Ob
Received: by mail-oo2-f5.google.com with SMTP id 006d021491bc7-703478630a2so272601eaf.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 22:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794552368; x=1795157168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUqaXX36ZDw1piKG6jmL/DoL8tq5IBd3zye0Czs+X+c=;
        b=RFvfG1ObzGHbopX1ZuaAB4wEEaXW57YBO5XsksmDUD4avVD7sFneacr10wa+KmUK4L
         7gwfhBViUj1ePZhkKncqn1AUId3ruZdAWlFWYHNMZ1AbSNxXbH4JytWgLWJ54ENRTtej
         7Y24KoLKuhiC3/jaWuG/+GB246T0bG0DtF++k/7N33jX5L7QZDKHHlRH6Dl940G0vKJ7
         VRCaoSx1rm6vwmTTqkquW0WTTZqoWmaJzdHynv1AwRXyg95/4T2WMLtS7RuUbCTFAaI8
         3/lcyoR6RA0Q8nIgsYaD9WHmRMr3zUm9XX34yL/+wFIWzO1e6aYZfedSkowwrSYI+4eC
         VO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552368; x=1795157168;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUqaXX36ZDw1piKG6jmL/DoL8tq5IBd3zye0Czs+X+c=;
        b=y2Jhz0E1Gk9NQyT5uCb+Zfh32vgxHykwcBncxaSEA1cLJlihUbOhNh2T4uWsnl34tb
         4nQVYeQed2fxoFl4xoEXMKG30iUl4iHkpKMmL/JxEYQMMVI1VA1OK8wwwqElFecg5NUc
         4zvxmjCP41r9vKmTU/6tgphuseVpAADbfvoEoEWkADrvhfMtacncYKCa/WZiczYvZt6J
         3mhE/rdOcNpIn/qWxM3kKjaa6K5LJkw3+D+s87XCZVcugB4c3xM6hxiNLwGoiI/we89O
         z0WejK98mQ57wCjphiVkpdDACjY19Gxc6bx1oAhEo+SkD6tlmHJGFEcNM0pDb9MXedIU
         yErA==
X-Forwarded-Encrypted: i=1; AL+hErEQgOGTBOHzl49QDUjwgUxBJ6e0+HyA4YCb13GrlOHLtugDRtznBuw1JVx6LhwLU48ZB0NNdqymmF4lzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/D+tZq1HxBFmYb61WBE79pDkoBxbL3IE5jxTJhlWB2gCIvAPm6
	D7wzzscaImaGwwhrL+54hy7tMbLPpEhVgKo3SRDndp/MSbJZVD6oesMQ
X-Gm-Gg: AYBFou2Q/UjfvdWz9vdSJ9J+7DzLRvTGQ1E73lkKixcgzTMY1Any887f8bQ6fZpq76h
	bUt1rX/iF+Xcq6xK8zxOcxg9COCJT0dKWgpRsLtgxHLTEZVfNRDaNSGoOpevoxGa3qpd+p6DBLv
	no3iwN7S/tWqKUJYMgK3Judvr3zQYZACFpSsCKxWu39pjwrKw05NiYFE/wQFBt0dzwmKiPfPIYC
	SmINVavf3amOzw6X8e/I1Xt0ZqpP6MGAjzPUV8aDoRQIhRlwNT2J1xY58tw2kNOpoZHaagIm9be
	WIwCkuFpBq/hvaTfqZ2OMARB3vgYxNldGL3JgI0jVYJXUYONM6YPvfN285k6+6IMpHGqkdlo7jd
	Ckbexo8A/LJLBRGucRodM4ioZs5mj/wC31aBv9bGq3zeUWLnN69wm6Wp8y1q3yBOrjHacMqROqO
	/8Ln55hHiyW9dQyJ1OMIA/1IGdqFqDGHC4mg7t/MmfYp/tXjVAKtDBudgKPx4+GXHXMVe1alsk1
	+HpW6e9eugJzSwNmukwSYroZ9nbKeGNKc9q/BoSoe3D4NRy3N0LnXWs4252uf3lbpge7w23BUFq
	tffTSO19cb3fa87A+hS90UzqA77OZBcudKoY74a2OH4flQ==
X-Received: by 2002:a05:6820:55c4:10b0:715:10ef:578b with SMTP id 006d021491bc7-71ab5051781mr614940eaf.62.1794552368056;
        Thu, 12 Nov 2026 22:46:08 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe228982bsm906195fac.10.2026.11.12.22.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 22:46:06 -0800 (PST)
Message-ID: <9accec98-c16e-4815-a479-b84fc39e4580@gmail.com>
Date: Fri, 13 Nov 2026 00:46:04 -0600
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
To: devnull+getfeus.gmail.com@kernel.org
Cc: Xiandong.Wang@mediatek.com, andrew-ct.chen@mediatek.com,
 getfeus@gmail.com, houlong.wei@mediatek.com, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com
References: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com>
Subject: Re: [PATCH RFC v3] media: mediatek: mdp: Keep component suppliers
 powered while streaming
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Youngjoon,

I hit the same thing on another MT8173 device, an Amazon Fire HD 10 
(2017) tablet (board DTS still under review), on v7.4-rc2 with VPU 
firmware 1.2.0, every job took about 1.9 s, the firmware reported 
success and the CAPTURE planes stayed zero, for MT21 input and for plain 
NV12 -> YV12. LARB4 was off during the job.

With v3 applied (one context fixup for devm_kzalloc_obj() on rc2), all 
seven sibling blocks bind, and MT21 -> NV12M at 1280x736 from the 
decoder matches a software decode byte for byte for H.264 Baseline, Main 
and High, VP8 and VP9 (30 frames each). LARB4 suspends again after 
streaming, there were no IOMMU faults, and a system suspend/resume with 
the driver loaded left conversion byte-exact afterwards.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com>

Best Regards,
Ryan Brue
