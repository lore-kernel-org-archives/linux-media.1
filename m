Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0F03A6B81
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524009; cv=pass; b=bdbHZzNcQ2rI6mCUiLEuxok1JU8EnonvK3oWFDJOtzh1GO5mQgEb9DILnz+KI4ai5B7PYY5dMDZ5a5RQVgh2imIwoVt+DGXM1CuDFmbBfxgMllWmQhBgxEXM6roa5qi2vlxHwrK860Ut2cDkbbw9f63NZYviyIqnaLqvwwJyBjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524009; c=relaxed/simple;
	bh=x249OaL4JY8Ml6bMUfTSabz+1wUJi+34aoe0uUEkz4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ON7xuZRBt7dsYt3Q+AzIMCRwXzynU2zJMdDG6S+uxUeD0QXUUUOmwJCLC5VdQyxymBcqnaXatvWFwASFt5inq+lfLDZN9wFjd2w5tRo/pwglUQ+T7jxstanu7OFz7Nm9WJRYlUaxnNyR2hxt28pxNtnl+pA7n/28TNSAV/esDXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1vz0qAV; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1vz0qAV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c126b8118afso116993466b.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524007; cv=none;
        d=google.com; s=arc-20260327;
        b=EtQBJs6mVBl3tjv7yg3DLkstIuwNg9eZYcfo5WhVEaftrlHzXTPyBo3pAtawfakYhJ
         8tbCVYKYZVHspN6+z/qNEWJNyjd1xrWMEZYbi1eWiD7uEJGMPWQyRMd6rXn/wtjylbav
         TC5Hq/9dYUFRmhUUB2H5d0FWOTfIqyCpXSmVDw2LuG1d3obiJftnVpIB8IaTrTHkgv5l
         TYreIGzdWb87bL2uH7ajNR5JrWLth/Wo8PMMrNW6uLZFxMCaYcZSFgO3gAI+sEvW/qfV
         CMfLOFyiuf48oBf5+jX2L8DPi4EevPs/fQ+x3Q1Q+RCMmLiJeyCflO5ztIkXxzHpaJPf
         bk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x249OaL4JY8Ml6bMUfTSabz+1wUJi+34aoe0uUEkz4Y=;
        fh=s++6UgDz8qHsvn9QXFREVchvgBT52x97EKb1FTPb7o8=;
        b=JjxOcBz6bWCcq/8vgiPYuxcyiupKvxn3/J8I8RllufKVVrGUfveO0VUADsdV4f+cVD
         gMIMG4Mzv/EQJsLt6CCDh7nBEMr/8EoMOEmCzwMtwMxbGGTRu7AwBY27YBDNNNOZwntA
         SLnG7JAE0HEf8K/C8FYGbfaWkkdbD+xGJG6bgsIcD/CWioXjFW0Z8rbX4Ca3HpmnlB95
         RlYx94ho/cZbKfBrOcPVZlaMjAHCW/58VUZpt/0Ge0EAbt5F2y9JcngNspTy384yULtC
         gZEJ/Cd3nqFmn3MTLIY30FramdFRGgrQw0/5HalHDJNmWRBIYtiaatTHR5yFGuDTgZwk
         iNLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783524007; x=1784128807; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x249OaL4JY8Ml6bMUfTSabz+1wUJi+34aoe0uUEkz4Y=;
        b=Y1vz0qAVKjJijtFqO9xThPf2tbVEsVzMPvHIDxIyXIngjH4n3dhSzfBJ0kO/pPWgeA
         LRBLY/pSZax13hgisfuxTgXTfh20+8c35QK23eykJeXZq/X5Jw/dCA7D3cDG4XawyM/U
         iHjZ72N6Q1gRh7TeGltXJAa08YcLBT0MHADGbmnHafHD1nLyPUe1XkjGOU09dwGLfCuA
         URwi4Pb0/JIDV65LTXvCW7wR9lJpcPhevgPwG+720DRUPaRMW6O3CNMrmeB/iEohcfit
         ORfGudGhsvgOezyVSDxtnJF3Q3M7ej/sGLfwK9MZxUwZaiK9SMxEaWrB0i/Qp6LoAwEo
         rnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524007; x=1784128807;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x249OaL4JY8Ml6bMUfTSabz+1wUJi+34aoe0uUEkz4Y=;
        b=YVInZdoa2qjq6wTM8ugeDb6ACasP90orkuOn7/YbebgnSTGNIt5vV5tob0N1n7LvIM
         WlDoqd5n4udupwDcTK7LAA9GVcJtkeW8V4uJXDOgh+MKUCpv0SWIgh6CprFWmpr2LVpW
         cW5Zr7BTulWxIpB1efuLLvaoBvnrS4ryqwPy9BzuAvTCikTwb9BnquTcnJyx72N2Xy5L
         iZXb2EekHunFw1E9ekyXJVbaNfV8FXt2SfVGpIpwPc4hI5VJJGxEObqoLM/7MIN7etZt
         jNGh+14On6Y85kx5MtpfI/u7EJTUFKAXhYEoSEyx0Fq5ggX10WNDGA+cc1NuODhdxCKf
         7ujg==
X-Forwarded-Encrypted: i=1; AHgh+RrRtfQ0OFMCj9pUDy9D/2iPqyr6f4Y5IXJ3GwWvurTwWVXRkGIjSv9UwIs1Ddyzyh5w0jZLEVI5jPt9Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPgKwLuJOq4ViKEChqj1SeEnRlUagoEZfw18O0I/hiTWlL5JNJ
	xX41rg/+gCZapam72dlLYHeF3t9d5I1SffwJLfPReU+3ry5JKJwhd4/NENQdt+uOI+b+MzKBzuP
	3PuwY9io+g6QiwL3DEC9Gce+G3itLFv4=
X-Gm-Gg: AfdE7cl3nIwY6SHCZVI29BPfUrXIPl0RN/NBuGnNypeoJS6clvG3wHW8Rs+f7ta9cMm
	Y0cERQWjpOiy4iZRLtYoDsKO857BN6clWD9NKqF3cwz09MUeKuhuy9Vb99SLcGQWcixR7xh6O/i
	t0N6aJ9xwDM1zZ0AMAkX4m4Bh7IkMVlBJOomSPTOn4B8sfKilOkc9fogUbHJXZHsk00kJPW9MPA
	DUqaPjEIUw40GVDCWwCv0BjIqJmpjlQv0iDQ7Ehj1FWJRdx0gAfIrct2d9rrEk39Q4M9SYDSkMJ
	QRwysT9OEfiytWLypsANnQy4/687hYMltlrDBCmSwolkBkwxeIdJ3X1t9dBi
X-Received: by 2002:a17:906:c10b:b0:c11:efec:6ca9 with SMTP id
 a640c23a62f3a-c15cdfe6c2cmr151638566b.8.1783524006447; Wed, 08 Jul 2026
 08:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com>
 <20260702-hm1092-driver-v3-2-85faa7ff4fec@gmail.com> <akkRRCaZMRyoWDt7@kekkonen.localdomain>
 <CAJTcUFQ3CJQhEv_N7L22FmQSJsGpfMvKO1F5wiEarNca5VmV5g@mail.gmail.com> <ak4DfkbDlIvsGY_u@kekkonen.localdomain>
In-Reply-To: <ak4DfkbDlIvsGY_u@kekkonen.localdomain>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Wed, 8 Jul 2026 20:49:54 +0530
X-Gm-Features: AVVi8Cc439u3XEK-4T29XYZN9pnFk6mhtHu9iHtSI7aq2I5-tW8zXJ2xwPEpgZg
Message-ID: <CAJTcUFSp6Y3NB5q+-DyPqS+E_KH40hhq3mJMBi5hnfcGT=wxjg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

It's all good regarding my name, the review didn't miss any details.
I already sent v4, I will drop the data-lane property entirely and add
the other API elements required by libcamera in v5.

Regards,
Ramshouriesh R
