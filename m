Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964269;
	b=fYsVNXuo03vml5lMcP8dXUQAJeiu3dRAFlpFTQJkpxiKTqUV18t/dKh+IldKlnidZNFj
	 MJ3jqz0fYf+2kJVaHPRGPkjCWsA5Q4Eb2a2WDURvOu2C8x0pQ2lFwmro3eqTvGoyBhmFS
	 YxXjrZvKSBrQa+Fn8nj/ymqEoafTKhqj2H7gEhwSNAnnSIOxh1LEHU15WbewBJryHe3KH
	 hztPjZJ+Ybd4mV6R3oI2h6PK36TmFkgyA4IBcIebcj3lF8JtPmZtYU31gXh7tECNImHR8
	 f/fHAjmmjz2FRcGwlBcivMnB78tYnABsYZxX78U2KYOmZlHQvaj2klBtSpT0DIDJXEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
	b=ol3Ib0lUBgUJAI/5dq5dc+pZR+LH7xBHX3rsuytVLjWyDi7iDljW374mPt08QPsIT8pA
	 UCLUEgAlflexG9Kikjw4W2ZCZA+w0Rie51SBhgYXaUfQ70OYwMqwdWThFcbFLGKT3HHmd
	 +/rRafJgU962P6pMCKpkiHqM+vBboAVP17MRLUcdUfZ3Nk5HhmE5DFO51T+4kQvVVCa0l
	 Epw/d1NiG759n/NV2OOZi1f9eFIiLNwkIlD3zXu4B4HXcPn0PMetWWdKBUIbJjNnOulCM
	 IjrNzbajlwvNW56fIf8aOp8uJoHutcyiM3YnyXgDi5C+O/2H5UOg11qh71mlfjFKGdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W7IAD3j7;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FBB606A32D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 11:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0FBB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W7IAD3j7
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso4095295e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 03:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793964267; x=1794569067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
        b=W7IAD3j7PaGIDf/91PYdduPoopl0Q9ouvdY8e0OR047v2ydGBma50bpSXkBEDgiY+F
         5mQuqBExoEcIOhhqpi8MF/uGL1PVDtpHhPzeeI6iRe+aouiY5xYpVbqhyraynWZ9wdnK
         4AX1q5fpb5JivZx6yqIXU7uJ7FG7Lzj6bdQwou6uHde8yxu7rxwOqf60SWh4R1tfjQFL
         BTT4WF3Ab6pTw/xFW0rPqX5NGng2RDBa+uLSyavxZ7J5UFgnob1Dge//nFNmZCb6uBYW
         yvu0krcLOcah4SZExnmyIBhpDNDH1mmz7cVcy+54rbY0P43O8Y4PZ5xT+SZiPyxzhTBN
         GA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964267; x=1794569067;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwjQyPIcMFf7inP5N0uSPmx3oh6JUfGi06PvuPXoUmM=;
        b=iArify0aIR8V+/dDni8A2qRMBPa2YArDerz68a1pAiB/p0xTXaTsUEjyrnkQHp/MoQ
         RJhaLquzilJNQ+Vuy0/9ZKSuqRkEGzCaZUJMi75hVGudNjCv0U4bgBqavJvzmLfGsRuk
         gEd7oLO570jbKeYBpXug1mO8xV360dJJy4n8D4WW1fxyAAesg0O/iMdc0YJLGElanGfS
         gBSF+Jsmwj8+KE2rwJfeM/l5XhVEcU8KMexfA7cImfT7fewHrUTzB2DeAsgSBb0aBJJM
         0GkyR8y1YPIQ0Fw1LEYH5ISF3wha1WIMt9v1V09bRRholXMlMDoSXcUSXCDoXdIgEuOV
         VBqw==
X-Forwarded-Encrypted: i=1; AKwUvBysV/tmOPv70tpnEUSbyp0PoaJ1jpSMZc+Q1F+o6zPWa8RIt5GaJwBzgPsEMslLxan0/1OYvTN5f1Hv1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+y+c7hoTH6vNh0e6pbS60LFWtQA4tYzi/Wg5elfvxFNyKmMljy
	1Pfog9n91wOHxyIV+oRYWfGAk5xfOncfFnwAzdGbt+1Htsximo2MS4YiYw/Mm6HZXIE=
X-Gm-Gg: AYBFou0uIv6TLwg4zugzIKa4vcQu20ADQiASSp5itByJ97onxcUW7mu63bt3DiALepU
	elE7SwlBoVktcu4RTjqCSQ+iaguLR+zn5xc/9JLq+JCsdn33hIHtEOSLUkgQJu0K6piM3zUhn+7
	04WWAcFHTi5twVvN5wc/hsiMGeCwrJtoB+wRCXLjGHoztl2boFsAo0c+ThUPDePMzUH0wmQ1CuV
	DfiIsWj4rguuORFv7LV+ppw0aUcbYvaz234PxohQ3lq89j/i2C3D7ettJkJPviPfPqzJEecu9iD
	l8Gt1ouInWNIlLpVVxnGRkiDHrxIhnMSID4vBO6GQqBxuE46q/yXB+0O555J0krpaJrryyccZac
	cuh2TMjpkWfZ0I3bRNO/3X0n5IDKlZJcVVQhKbY4ZIjzRcJNojzU9CCOCgKIuh+pvvlDaWNkeDi
	6jbGuzu1UAc4ASqvF9WRcQLLvwxA4lS84mTc8+yT0vLf2eKQhWc/SW2huuEYM77VNTxz0pkdLZi
	48MbVLJof9Yc+6Oeii1RL7a/eXpCZF6/y9RQDj0AEpuncuII1gQtIbPiJm13SN50RY+35JOmq8B
	kG3xhWwpGYzhmUoapWgawaUYQ6+EyB/Be0577IKarA==
X-Received: by 2002:a05:600c:4443:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4b6e091e588mr38640345e9.30.1793964266527;
        Fri, 06 Nov 2026 03:24:26 -0800 (PST)
Received: from [192.168.0.167] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b741cdd8d7sm27597265e9.1.2026.11.06.03.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 03:24:25 -0800 (PST)
Message-ID: <1fd0e1a9-ef5a-4fb8-8c55-556b62b73ace@linaro.org>
Date: Fri, 6 Nov 2026 11:24:24 +0000
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
Subject: Re: [PATCH 2/4] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20261104-sm8150-v7-4-rc1-camss-v1-0-7a9534a9a22f@andrewgigena.dev>
 <20261104-sm8150-v7-4-rc1-camss-v1-2-7a9534a9a22f@andrewgigena.dev>
 <904675e8-701d-4fd6-b418-6c0dcc9288b9@linaro.org>
 <5ba03b8e-1d51-4e66-a802-37e63814f5d5@linaro.org>
 <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CANn8UmccjAh7PiLpbGHrhDR4yn=w6uiDYU01aoZvBs-tGkgNsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 03:06, Andrew Gigena wrote:
> Hi Vladimir, Bryan,
> 
> Thank you both for the review and for taking the time to explain the
> direction.
> 
> Vladimir: I understand your point about the stand-alone CSI2 PHY model,
> and I agree that is where CAMSS should go. I hope this series does not
> give the impression of entrenching the legacy description; that is not
> my intention. My concern is that I don't think I can do the PHY-API
> conversion properly within this series: as far as I can see,
> qcom-mipi-csi2 currently only carries the x1e80100/glymur
> configuration and no upstream DTS uses the PHY-API path yet to take as
> a reference point.
> Converting SM8150 would also affect the other CAMSS SoCs that
> still use the legacy description, so it looks like a separate and
> larger piece of work.
> 
> If I'm missing something, or if there is an existing branch or series I
> should base that work on, I would be grateful for a pointer. I would
> also be glad to help with the conversion as a follow-up if that is the
> preferred path.
> 
> Bryan: as the CAMSS maintainer, could you let me know what you would
> like me to do for this series? I am happy to keep the legacy CSIPHY
> description for now and follow up with the PHY-API conversion, or to
> fold it into this series if you think that is the right thing. I will
> follow your guidance.
> 
> This is my first submission, so I appreciate the patience.
> 
> In the meantime, I will send v2 with the review fixes so the series
> does not stall.
> 
> Thanks,

A) No top posting pretty please with sugar on top.

B) Since we are reusing an existing PHY init sequence there is no need
    to port all of that stuff into drivers/phy right now

There are several complexities involved in porting existing bindings a 
new topology whilst supporting the old.

TBH adding a single new enum to a switch is a much better immediate outcome.

Happy to take a SoC enablement now and work-up the switch of older 
binginds to new over time.

---
bod
