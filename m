Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601723;
	b=29Oy0G8OLjD2J2PN5xHT1vFt89kKDSXnd4pAIhaoaplSDDd4UYT66jmVFx7UVo0dk9MV
	 6NPSFVFoUoacV7VAvyMO/+wd5FhFT1sROg/DWM++1Z6nzPiX230lGCoGASYyYghTb/p1q
	 G+j4SzOpPKOV35iy4HW2VbyIg5qbFX3DNceuQbd5ejkDOy2AW5BvwLMHPmIGy3CrN4q3J
	 8xIzuVa4ZR1z8ikVpqCkAtSBwC0A+deEUX6jsUCrDX8v6rcCKBLnpQrFZhhCcy03FUg7W
	 71KbUa6Vb37RIgHglUVcGAwPtZgd2cUg35QQ6uTZxvsSMJrlPNn6f0oNCDJMl10KevA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=01GyO5tRkCUqtu+aI3U0hUxCCjrBeqh4rgpFeuAxKjk=;
	b=wN/TGi48P7w/p1wOzVSC0jU3PscaNrmbZbRZspZ0ooR0evO9iJm0RjPOsxA29883Fmva
	 c8Zi1hKQIb+GtaOTu51nHcSmZFj8Vybjy0Y2ezni0jUvRcG4iSx3AMS+AslxMIrJxAC9X
	 j9FReKey09+5oYm/MPWbsBuRVqR6xiqhb6zNh1e9F8W9MvajtI4MD9OuWlh1PTSCE0s8g
	 V/mVqxVSGGdCuxQP7siQtbM+mlKTRcxaQ8KbCG32qyl1PQnWTUaQSnTWcx6OhQUOnIpY6
	 iX640/47PUzk0Podd8f7q9ZzGnX1ANMgRB51hCtXWNbfcGEm4PzDuLSDWkqNjgg7dhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qc75HuV0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BD0606A331
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 20:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BD0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qc75HuV0
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so1913671fa.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 12:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601722; cv=none;
        d=google.com; s=arc-20260327;
        b=qSMrDDYWVauaWsPLxlb32XkrRMCw2DwpPXmMAorB3mu8QjSQICg++CimFa1cM3NF86
         Rf8nCrwXzpznMTHFZm6vh8JyTPbRRLC+NBbI94Mgo1WvRu6Nz2McmxalAbmCmqJXhMjL
         U4/4YgiBIikC+sbQx+nOeFJZkUX8seEpi69Us6GRHWJ9YMDdLfqnRscFQvoFLnuhq2I3
         O14EIBYOCSeHAVJEjh/X/QFbpNGzn2kLqhlA6Hqhk07M4JE0x5b/vTNDdB3Zez7dDqTM
         DICgprSCoiR+JHTyBNm/nTl0xZYZRN4sWOQ5aUK2hO1eufM8GlItO4ngC5jNTYqo1YUi
         63mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=01GyO5tRkCUqtu+aI3U0hUxCCjrBeqh4rgpFeuAxKjk=;
        fh=SefEPYgUaaJYuJhf2WsO9q8DngR41DF71ZZJDb7NjxY=;
        b=EUH+b+MtAwrgMPjZmTyMwdr7ur/zdyOeePLg7c3s7GfHbOelt61brTdhwbKsZ0daOx
         wN+1mHioaXgJso7LtC8J/zEn+pE6JqQBVX34pcdXpQCU5JUYGgcS3oUJUCWLb1T40BRr
         mWTJRH882D9ajX1COGF60+yBwJXr3iwOCSyRaGVtNvCHz9eD+dQkoJs6jOYVuNif1ff9
         nY87T8m9qk8uifqr6D1mWgHAaMrnwQm6WmPvl08G8CFRjMBRwlTvsP/EVfQM1YtS9+5r
         m6VBLO5SSoh+uPa8WyYhuTbi56hm3PZLPwZZ2oF5vuA4yyqdmRl3LWyzANtPfORQ/a57
         1l9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601722; x=1795206522; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01GyO5tRkCUqtu+aI3U0hUxCCjrBeqh4rgpFeuAxKjk=;
        b=qc75HuV0aFNn8AOe4S6nRDBQ+CCOn3Jle9ywaejlVrtfL6XAzf5jZQkW2UiCLHTVX7
         30LuPYMpW2csCZMf9ebs+TILoIhZWNwTCyoHE+cNgbsWHAOvi+8xhF9ckTu5+iAvmNcD
         yyPsI/SCxtLKBpMgAwhW6PsC6qkr4nSxjLRgasa0P9Yy1FjwmdVLCLjEDP0d2XHF66Sz
         ZUqm+dXmfeS7JcIrLaycIXAoYHvIXeL4zlSG6hFQ+ZaAiPXCbbD+GSYW/zYPCvczhuGj
         bBpscQSwFGfdEN2ojeE2CIqfa2R2sPIx6rWrmLydpfIcvgmegSUeoL6PtuR0bmXPJpJa
         TB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601722; x=1795206522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=01GyO5tRkCUqtu+aI3U0hUxCCjrBeqh4rgpFeuAxKjk=;
        b=PRb/19PtA/YHZH+xFvl7ABtwLgZXjOuCx6zIiEfupFGUfOvnhk/YTWWSr65P9Guyox
         GZJ1kvdS7Qqz+xEaKT8A+PZELOssVNhWU7o0r40s3ByFhQFZXJ2jJJ4z+vlWvHbbJqS9
         LymS+knBUmlQZs9W5AUIUwevqW5/1k3uW5GOF6qfoENXW8rnnmIx6aWfPQM8yBhXt5/6
         xHh0hOSeKtOhZ5GZNUH+XdVgDRd6wvlrcL4gg6D28MpsZ1DwB2LEOiYB+DKit67qHFqU
         7XDmZmq+Tkqs3OyOhKT378s6BpN4rdkvx8hhz56DZxoqD6CUXKnDYPh0L43Gn4wU7BH0
         4w4w==
X-Forwarded-Encrypted: i=1; AL+hErHOuh4z9f3/hkO2Ns82tuavatpqkOll8tDCadVMfjLJkICiiaiSxavYZf5pDK8dxf5F0aAC3A6xxnDIXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+c8tZ3roDwLOTJwTp9YyBtOj7bIa2uF1kSy12QxtvPzioqD7yQ
	1O3ycM0q5fVQTwPnHVFBWCfnX0Lcz1njrZzCmQX4WfpbKmyp2MZDxSrOFiL+KXO+WI4H3ZsvXkT
	8bfExqtlQ4tmSgGMZu+Otq08W2aR3nd0=
X-Gm-Gg: AYBFou18jENDoJhobE/3wWm4IYFhBWSMW+q1lmJ1ZZ2XhqhecGYMyX8J6PNxv8F13Am
	mTIIu6GBmF2ZuR5eX8kvcwyDa4wAVqp+QBM338HU4tkIqvN434WF8bRM4TZhq6D5bPiwjmMTGUw
	wvmCqoxegTdjh1VwHQI7cbiLDBKIG71zJuw0BorbCpjNJv5BM3g00K3S1BFypVbSnXQ+itqvjgu
	rxRWdAUCemRUsIym15UJPkx8QlPoRCQffkT65djStQXvx6zvnwDOi/Kp9kV/0rKUFMS7Ru06SAL
	liZviZP3al1jcv0DRMXD8WU1zo1b+KxNYMFf/lU1CjrdE62z+m8b9aoNaAc6ul+SmKoDImz3/g6
	UyGkTzThO6A0aevhF3VzjHZA2q0A7ccQGqWdiI5bNlEbkVx/MwVSid4SCaSo4lU9zbc51B0kg
X-Received: by 2002:a05:6512:1322:b0:5c1:57b9:90b2 with SMTP id
 2adb3069b0e04-5c170746a13mr1725091e87.1.1794601721562; Fri, 13 Nov 2026
 12:28:41 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
In-Reply-To: <20261110-hevc-encode-uapi-v1-0-38ae9fcfedd4@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:28:30 -0800
X-Gm-Features: AclHuK97FgaYb-XOEawk8OrUG6zWN4m0UqFKg3z6sSaJjcuTRTUrE7QE_VziCKg
Message-ID: <CAEy9hNUybxBFWQuHTjtdKWsTScXzCo9wtOjNe-FV1GnDcs6LMA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/10] media: Add a V4L2 HEVC stateless encode uAPI
 and helpers
To: aiyengar1990@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Please don't review this series: it depends on my H.264 follow-ups RFC,
which I have dropped, and it should have been a summary, as Paul asked
there. The two ideas in it:

- References: each picture lists its reference pictures as OUTPUT
  buffer timestamps, marked used and/or long-term. The kernel codes the
  RPS and builds the reference lists from that.
- A read-only feedback control returns the QP, the resolved lists and
  hardware statistics with each request.

It ran on one encoder only (Rockchip VEPU580).

Arun
