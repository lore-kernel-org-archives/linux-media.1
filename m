Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792791859;
	b=I7HlO5NdzlrvhxehqvJhozwn8RLA4d1HGswoUYfLrR8r34G4NO5G6Qer88Q2kyqTLaTj
	 hqRkv7kkse8/JVq7cod2TO4KV4lW2ZgBQHPanGopzk7iGVNZzVSaZK/yPU51MJPG8vQV0
	 VLWELn+xst/QZ2yR1CMGT63DOVX6deyzTKb3QeYSCDncNFzbUjPtfXgy0qu5SbfyuROy/
	 6vDvaRgnRooNsrCVEY1MN6EFI6LppSgAogr6Nobz3VX8AqckWg7Y/uaCqfuQQEPrlkzda
	 UIwyBUlT82TV1lMPiDiu0VCVo++VCml6/MJ5z8krUWB9Vs+qwExCncpqaBDwbaxDIhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792791859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
	b=Vd2gD04fvYjFvZR+KfBAfdmPGPsAXh8npkTk9H43B8yFKBxSAESZzUE6tEt+Cg2yLAzZ
	 vD12hWMNoj0YZqP6FhTj41/NZRtPn1RRdm+1YQwndOZlwYPAv9uFqUskLkXqfVBKW+xIh
	 1oweb0+zFinDx5easyxmNGPZTJ9otT1Vq85FZj0MQif1w4IFjtab04gYWJh2vKbm+G1hT
	 x/TQsK3B1nsQ8AmmU45H+C79cq5Yi3CeA6cdjZjAxX5DQUye+GlI5Bfxftjj39g0jIr93
	 0iAly4NXLYi/cqptk0laBS22FkU/0CXfkwnXKpzJclYITJH46MVeienSs39ISxUct4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mlFIvltp;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37686606A31D
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 21:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37686606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mlFIvltp
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a208d93758so13877785e9.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 14:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792791858; x=1793396658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
        b=mlFIvltpQf//XRh4JIZWCEhPJNJ0X/sQhjQhiV4wzLgBap50wkui+qFJRqfQ3YDRk1
         yHrOFrS5vtSk+Yj9CrrFgHVyHo4KKLmIYBaRTM/7bj25gxU06M7VfQCUDI5s4oOeWcKi
         F2DLBsHnk/8lWkH5W/MTIG6K5uKsg84EIbIpD98Yer2j1HB2cyW6kRBGnoRYL2rOWKJ/
         TMDpqq4l0qY2PMRtmJz/10lj9/HkD5YDbOHEUNMayjlxBFrqfDvM4ND1pILr+Wp4uD2r
         eN7CY/Aj2TOzSEIuaZystdERQIs9nH35oiHz6TmbIUQ0iwv7Bs/UPsnfxchnRQzyprGD
         0+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792791858; x=1793396658;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fFwyhZCXORgrLkzDtxE/mSv92Ck+rSlYQsSs3nn1b1E=;
        b=MaCZQ9AdYLTEm5u0kVRlzA2INLDlXWxVZ//hfiSCgfdIwv0VvEXPYFjyeMrYmZlv3z
         6HGWx9fxI0SwK8ob+3p5JwTjcY0H+3trqRPPJPpokm11wvIBFP/7YW6sEhhu7iNVBcZO
         iE2waS1P0QJ4kPapW09gtocs0t19A1Zwn48GCaVsymvaRj51snqzKY/aDsNO+KBcWOEq
         0cakBYthjrEYiXWmGs87+bFd9G5BGqrsrRs90noIXfvVFLdJZjazr8B+GqqcBduzJ4As
         LdfCIhLjOYooaGWvEYyPYVbSfIwEoJXznUTcNGK9i/X8GtRZjS0IPktn8gltSSrltVPH
         rehw==
X-Forwarded-Encrypted: i=1; AKwUvByLXo7C+xPfRZEelNliU8AMMkpPn/DhGvBmr2yhDOabcK0L65YCutj+sQ063AOHZvm1Nti6k3vLxhE8AQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYICgXp4ID30718Fhq/K5UgmAez43gt5X7s0VRjfMq5aWiXEme5Y
	lTJqADOnW96gJHOSKhiAZuapEG6/EGhpZ3cTCkdfUIjzHMSXGoAAKGB5Pe5dIyaS8iY=
X-Gm-Gg: AYBFou2MBZs/ZrBLHNpG2Y9NfPIMU31kazf0tNRmiHrwNWhJRqM8eG8pe5HR/szdOlG
	WCZ7gH7V9KnJ+SCXJvX62og83uGcUQNGMpi0+2Tbzqrd8eiycVaU1DnKTX7WhpsyCUXs14Owdgr
	kC9OkLq/97+QBf0vJPMBEPHg0JN6glLhmfT155hpLKJDPI3z/Gg3iOMgfzsL33lgLWwFdH0ruSh
	ap16ppuX4ewXJ8lIwXGjWPBh7lo2fqgeDm7k+jW++ho7b/3rRAixpzRFZQtD14hXCIe0wt24vwu
	VFnw/74etF2pi2I+YO4L9mWi4s0tCKSiije5qwKyTJLTNIokfmdDsqcYxDWBsFDhvUmsvzlHL6N
	I7pCt+54TCjp+6AJkss0dlFszOySQJbwQFr+l9hk2NwUlfODPk8hCA/lUZNhvfKPxouvZLHqMOb
	tGYrSTWvcQ1CMbzKXLgOWJp2RPjQrKlevm0IaNhhMu+4Od8/Pxu79tp9/6DoSDfV4Em91GIdHzP
	XL68fYitYneAFrXQBU6iEGkNgYt3d5bykcqQ5/SA70MZzl5CXujdE/BVHWnrk6w68cd
X-Received: by 2002:a05:600c:6095:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4a35ac99412mr2318005e9.12.1792791857174;
        Fri, 23 Oct 2026 14:44:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.107.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e786sm10434525e9.3.2026.10.23.14.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 14:44:16 -0700 (PDT)
Message-ID: <1574aa17-dd5d-43a7-a433-ecef6a8ce136@linaro.org>
Date: Fri, 23 Oct 2026 22:44:15 +0100
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
Subject: Re: [PATCH 0/4] media: qcom: camss: share VFE clock sources on SM8250
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 16:28, Atanas Filipov wrote:
> The aggregation only covers the CAMSS VFEs. Drivers outside CAMSS that
> use the same shared clock sources are not covered and are left to a
> separate change.

Hmm.

Lets discuss that change so. We need to represent shared clocks through 
CamNoC anyway right ?

---
bod
