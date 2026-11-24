Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532862;
	b=z4vPl1evULnYDmGjIiplyMvtQzfuVDR1PBBffGNHs3dHx8ySHLw+W5sJqt9R0F063gvb
	 j/fnJtObdeU9o7fq18d4tS/BiRXQZjHcBdSf2udJKytzr/DTcYfhGbLjEsewNr2hraG5d
	 NV/89R/6iUb/6TW5eyygZC6LqZYWD+I79jKT5kK+jJenEMkAP0zcB9q81bXlPFSTD82S8
	 ND3KNLrQfowqINHul7gGvH5SvVjO2az4sDLR8d6fASUcPk8uJ2NHvVUPWq7tmBs1Hxs9P
	 aNPKtjytzqz0p4yed6TMpKLEIIDTnL0M8IGazIw3zSkKnnnqAR8ciFUk8fTklK7KbNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
	b=fcGGcV/LjirHbXhQTOgtFEl2qhb96acPW9BipI5Goz7nx6dvrTiQ0joFyVA9OqMzDAHC
	 zT3nbT+8zBqRt5aUw+V4vwh0Lx3SLDvDn8IGmv8gXYwm30IQB3KsrY9pTeh1n4v8JOj2T
	 PEzFbdevohGRV+ZPXI3UTD9yCKfvTZU+00lcNyU4QKj0X4kLNHg4vfShLuY0AJMaMI5T6
	 J9cBSxNNYlGUiaU/HExEkR924ePURe7ryQ1i1fZglNGyUSeFAoo1y761YTw9ubSjRwPGf
	 /0mbae2fpTr3epkKC9hXsKRw03Yj8xK/Mnm0p3rMnzg4rULc7wOVOYzm7Q5Yf7ZDBfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cA4kVEyB;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFE1606A321
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 15:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFE1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cA4kVEyB
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab1e5a01a1so3627011fa.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 07:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532860; x=1796137660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
        b=cA4kVEyBti5oMLaeq7wT8khKjM1DVQUy5qVqtxYPOKnvBvWTxo1pJMgv+xaOFgWBV8
         O+Fb88txNYas/uoXAuVv8jncx+4khzepX5H9SQeIAA0HH4mWphgfrDKfIWzSZzRY2K0q
         L3JiqdQP3BmXzmE48NqmXEOQ4w9fd5OmD+IVV3pwhvkdPK9iFj6oFwLy7KD89+YwQnwn
         jEEdi2WnHYjGM1YZlmouHQjy7/zQaXqf8kxrhBTCzLViBNKtd6rju2hQasrmPN3W2EPa
         zrUL1UjTLksmq0aTlKUCLYp9x209mpDE958BOSijHdkEhZkPtRsYG9SYBpJRVn+VAr2R
         H/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532860; x=1796137660;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aICwJf3rQzn9t0UhzA5pRAC33uHfknWgbhObwj4iPxQ=;
        b=FhN900B/lPNBmCIsmD7Agkw8d3R2oplU5gxOFyLwsdk2dYYiFbo6B17H6AohV3awch
         cqaubN/B9GqrCfI5LxoLhlMw2FSWUlOedNXVubzkmhFYpt2CQQmAwvIcsIT/l65KJ8jv
         unzS0NXcJX3Ro11H3Np4zAQiZ6bAeFDAgjCclcxv1he4Bc0HZzMx8KDQy6ZAfcMpNjxG
         wmYx8eVzWLx0CIaWZFmjl9vlovwJwFQhTD1i1In7jJwC1PRJHWLYD6cf1zhLROup4udd
         4nfowis8O1V+OQvW/RBkWiZWIGVaSW996bEiBW7tdFAsk7cDf9oYGHFREQ2EQEXKFfYZ
         s/PQ==
X-Gm-Message-State: APuU4Z+hgvayKnRa1lo9m1R7Ys2psSFOlfNzOgyAHERKkAokixr/VcBC
	Xzp2N29HE7pbh32ot4I/PiEzGRIVKKk5LaHoCd3wi8j2ztToHnu2CWBMpt0YPR51P7I=
X-Gm-Gg: AZFdTZcNpJVlv7jZEWvMOzPz+tekrVZaF2mPXatYil/ItOA6zZfjbVkmIWsjcT+4cHh
	JmuIIXEMU+2Zntci/esP8vaABn2kZe5QAgiQT9sPm0dYPXZ8GdBPQ18ZvgOcLYSCD4k1alItzm7
	zRjST1ev8SQDunTt+vENOsl2ZHwbRhWi+jVFsNQ7W27pMoC+2qkkIwLEgucD+gAX9eSB4jhQd8I
	w+jW0lCbUA4RYBymf/JRBCkhtCSiqLkt7XFpOi0lTYd/X/eCnPn3anZCVongI0dJtm4HsjnS0Zk
	Kyuvk6hsb1Q9qto3Yhae3ooxmbezShc1U5mGcCE05p8r3x24MpiBep7dwVCff7iyrUgOckSfrCD
	XolZtLZ4tFxzXFk6WfvXO6+4s32NTwcyqYU2d72l7NABVTbo4tyBu/n0RtafkzkSstrb9aYUGXO
	fQCFWolGSTPv2gYFEHba6spRskdIP87t3vRs/eLW6QgEK3DUtd/ZH+TO+qqnm6mgHOOVYLh6JHi
	DYazS4XCU34CB6jab94HUqcxOo+Lyakk+7+5tMgH9SwMV5/7+aWVRwZicXr7LXmQzKrNoaHBzuh
	fAl1L/kJSnMXsTWmODwV1oOJytbsu74oeoBL0s1KLTO/bLWqEWLp/aNNXGv1iTIOZhBISE9Hxl6
	ry0YbCck=
X-Received: by 2002:a05:651c:a110:20b0:3ac:dde9:a04b with SMTP id 38308e7fff4ca-3ae7f7cd8a5mr35764001fa.0.1795532859714;
        Tue, 24 Nov 2026 07:07:39 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805215ccsm39335071fa.21.2026.11.24.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:07:39 -0800 (PST)
Message-ID: <5005ec8e-bc15-4962-bfed-74633013115e@linaro.org>
Date: Tue, 24 Nov 2026 17:07:35 +0200
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
Subject: Re: [PATCH 2/3] media: qcom: camss: Fix CSID to VFE routing for non
 ISPIF platforms
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-2-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> This patch fixes a basic routing error that has been present in CAMSS since
> the addition of non ISPIF platforms.
> 
> The ISPIF platforms can route any CSID to any VFE however this is not the
> case on the non ISPIF platforms.
> 
> The current requirement is a 1:1 mapping CSID0->VFE0 CSID1->VFE1 etc.
> Demote the spurious poly-mapping down to its 1:1 real form.
> 
> Fixes: 9229b53f9758 ("Revert "media: qcom: camss: Restructure camss_link_entities"")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
