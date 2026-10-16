Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377D14F0538
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166687; cv=pass; b=XqBn5+QxP9mddInfQqGJq8c+EEMTYxjzekBbweZk1Ovc+BeF5d9aCsmeukGwY5Y35Fb6WuvOYZOIEnYX8KOnRlg44DJkhp/puNHSO6QEYacV77T7zWAQ1R38K5NQmRpc9KNFTUYx/esYZ6zotSuOoljzjSZ7URx++tGTAj6ipPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166687; c=relaxed/simple;
	bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orAYYvVlT1Vwtfc+dt5G89knXm9QU417rt6JLUQNNyUJaON1uG6ujlflsKwIwY0FpJ+tQ9FhCedaHjPpwSKWa6SFqi2OCKkeiYDE+6Fi4OEXQ6F1XxjHYFK/LKwi1w1Lcps8Jpy0drWLt8G/+OVdmLNLkF5rA3y6stlY/3qqjog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuOJ798b; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuOJ798b"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-677bc4704cbso212787d50.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792166685; cv=none;
        d=google.com; s=arc-20260327;
        b=pC1Ut0kFd6+euq5CkZCt/QJYBsB82RNNosfhUuVQTrEOUt5MSGsPIJJWFL9/xCKtJS
         qjkvtntIwBgcIQdtgZg56zSdU0ud+m16pTzr32Pvt235egUrhe83AKN0V1rqDzcP16Av
         a7bRxImOZI1GFZihlI835TbhKAd6qjxJiixLOuwUi6/+fYu+Xl5937rqHw3sRrKc4T5N
         HGLsJqnqcj5/BRZIhb3cyFDPfEkbL6Kf4AB6iUmC4B+85Z0kI8J0kExGrQbC8l79iOy3
         vUp8i/oqSM8lB8ZEsrXTfWUjMI83oIK5XH6/drl2++qzwNxUvlOaIHZFum78maxMxOp8
         sMaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        fh=fOJ3/jbnRPGJMkuEFanfRaI8VhV3rhLEDcTgYIDkMVM=;
        b=kRkJQTT3DL8X9O/wkigSmDOJVUpe64XmggB2Nv7RlMGUhbwuxV2vgQnTdiGpUoLGfB
         Yj7v1wOgLio4Bq4r3IyscVW2F0jSt/EVn8QGZiCfcOdKQ2gNNkEvzZchuyPCR1zxa0zg
         rmHlyidr46eFb2c9wh1GBJ/WkT4HGGN/O1mmZiIHStu+LbEN0w60SZhtr7LLUlm1Br4y
         lJhWflT1REcQLA1D3Wv7+e9ykVr9ZkehwAA8Zqyk+SROrlu/J01yZSGJbviaBmk5xB+i
         9KwmO+nsy+AE+smlr616D16u/4bzX0Ch34SjBPsBrzmcGB+mD59jUcr8wRqCC8JuoULJ
         UlGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166685; x=1792771485; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        b=CuOJ798bMYtCDpC5LWiwZJn7uw8bjiBagVxTyI6Y9WQHtVprqQYt1y47sCo21XrVNV
         UsOmF8vDTwr5vLG1QXN92cTa+5Im2jGEIYiRKKdOqgzUUOTnYt87XsGOn5018IMq+alk
         L7aJy/CQT1mulKcTs4zCTHTgB7D+ulX8GyNiMTZTTx8J0UwhjLxhSJpG1LHGNK5izf3Y
         c2jU0TWODuroFYqhSPgwpTpsaCq26tN2n6wpUb4c5k5Tj1qTFSAea6HSAfpp6N0Uh0Bf
         YY7iLlNhbSOArmXeqmWMYCYhiAV6fxBNdp+6tcTdfA02yg1vXQ4NCEjPo42auL7rK04m
         J4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166685; x=1792771485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iXULWRiQelhnvcT3Ak66Mg2j8IEu0ZMQcqJtR6BRIrQ=;
        b=ttFCKqc2zUbj3PcnUSMCWZX3NUR5/OOHsjbROTTocKUPug1k3BfQ8CNnxgk5ezjTVD
         Ssyhjp7+uzNRP3MYkTZbrtyNiRDRqQqTZQDl1zsjoYd5GydN+4UE7RPZvfJuruwWnIlZ
         vGI4cYcP5mMLgQHfBLML0PXen5zEsdK/emNVgHhvtjjSokglG4fWWlWhArN3CyGlS8xu
         P0qGVyaTXiX/YYB1xTxMFnhGjXhUN8ZnJ4BT6grWSbmI+hbH0WHDKG5dP3oq+j39lbUN
         3uLteqsoqXP7qhggiRo8mhZsISndFYUvbPAbteZSaXZoHBPZpC8LK842iM3cMvrc8uPG
         VJRQ==
X-Forwarded-Encrypted: i=1; AKwUvByqxPyrhmMw1cKnFHz69iiu7MSAPtfRpTfSR9l72/sLarDs6QadYeXRtxqioSAl/dbcyt1b0EaOmGW00A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLRm+8ViebvrQe7SRIPNu1KO1eMtfiMGTMVD4p0D8Oczsa7EZL7
	Ip5PgYuvY7QO9n9jbNwUp0RbcY5DhUWe7Hc5lhQFN5arYt/D2HxHIxFrxctocChYKu7ttVAdOgz
	qHjmbIdFtjLMg98DnT6cc0bMVDsB0gDI=
X-Gm-Gg: AYBFou3fV2IFuQBc1hv6TnaAG1PCcfbR7G1n4gOfGkzFRaKjAReGb4T99MuUo3NwwhB
	fDqA/gJz2tFHlDX1Q1mJqpVgMWFKrXDBvut7Vvg+s1R6AEo/qgi2W1s52XjGCxiVrQaTpuzgyhg
	EAxVWF5BjLb28+HXQfyPBQsZJLivQ2vU94ZDgq1xpM/ZRarBcWul3FRGsrS/+uEBjM2TthUyamY
	g+c3nTHcvBuwT2u9R1gOupTYE+yEORSU37zQ4V8gOui4sV/2Lc6lm+otyz0XtttJtcD1ySoYWY3
	tRCwwgRFd/Taebmx/3IomaucuKO8nS0LOAY1R40Cpq7bRWQlpHycoss=
X-Received: by 2002:a05:690e:168d:b0:679:94b3:a257 with SMTP id
 956f58d0204a3-67994b3d526mr1957505d50.115.1792166684969; Fri, 16 Oct 2026
 09:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016090930.947830-1-wyibo6109@gmail.com> <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
In-Reply-To: <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
From: Yibo Wang <wyibo6109@gmail.com>
Date: Fri, 16 Oct 2026 11:04:34 -0500
X-Gm-Features: AclHuK8HVxQHZuZqBOsgDtltrMYxi2H1SXCcO2OimABd3Lxmh6ZoSPvRZjNaQho
Message-ID: <CALQ9cS49UzOPA8PUh8Yf55+D5oim=9YRF9iHw0Hi0sXuZFDTVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, sorry for the trouble caused by my insufficient checking.
I did use an LLM to organize register tables for the binding and clean-room
HAL user space drivers work when I find my chip acts differently. I
focused too much on C files and neglected docs.I will treat documents
more seriously in future patches. Since this chip is common and someone
will inevitably do a better job, I won't send a v2. Please feel free to
drop this series. Sorry for the noise.
