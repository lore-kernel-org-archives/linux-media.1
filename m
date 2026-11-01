Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793574118;
	b=feRkiFkYfmZy+yfBGkzN6PBFnph9+4j+NCITMXwYGpZljTur6gGQgLh1TMb0Bb6xvixH
	 B+zVA5X1nujPE+VOCWDw9ljA8rznIsHZPhDffL28D03gncASjvj4+S4ksZFnnurffHxpR
	 lCv3goqR51WlIaOYGt1ke2L4v10gWFxxk2jv50eYpB4MEdH+WRbMOkXp4IFcLBrpKMuwl
	 K5D2JBCUzmQer3XSs302ZVJxGqN02otEDhuXqbOmjFBecJyd8Zq/e3JAVUnV0X3XoFT+5
	 wNRqA+dHvvcXp778PHNoSzsNMjBszY5Eavw5WlKVKpvZISkBUrrnFaC1FW9Cx+yYqrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
	b=EHSrTBoaMqZw7OKkCMu/bzRu0GWnCgMCaHMEDLpJkwYRHLlof5fApoE+DniBoidh+4c1
	 1DIILVj1SQI+isDuXj5siVx+SaNNCsxQ17xZ8kEW2oOL1cAUxkIUGqMlInwu2tzFci/+1
	 IOYBoerypn2U1baWREm/xpoYAvLOZafOXJSHEsyHNXR9Nb+oh2xMr8OSTiBMVZEJpTwfI
	 yP8gTg43alyXU66yBzOUB3+vgTBcloW8WS7XycBxW7H2GDXa7u4k57LEStD3mEN51DAZL
	 QmTAYoGptOv2Xg16F3H295pEvZl+2BhR5XQDDOD/hIp9I9YfxLF5pd0OQ8lYCm1fVqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nVzGWl6I;
	arc=fail smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBF4606A329
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 23:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBF4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=nVzGWl6I
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67583c777abso2530502d50.1
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 15:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574117; cv=none;
        d=google.com; s=arc-20260327;
        b=oEMJhQ9/ahp0I7CW+VkT3p+tyhCjHGCeGFl65k484RSRTfsUtxaeQ26KN/KTtCw7Ka
         oZSRSXhSRUXhUcZhaxqEYJYAtbN9Joqrh4gnjON+JLy3l1iH5c2r9jQXZYYXwtBDJ30k
         StwvuCTO+35Ooa+pwzCM/7/893XVlLqdmWfSiv3xTe0d/yyWKO0AZ1GRKoQq5meyDuM7
         nPdYe0N13SNbC73nPETiqFd3JhXsFJVNOTbSITHyUOzgAezK3Xr9Sx7Xqn4OH9Y4Md0O
         5rCQEF1ndNNX9ymtfvGc66r0G1vmV+1q1XXwvlAFik3VgGErQbvYFgBT0zdAZii6j55g
         7k5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        fh=+Rhn5u3Zt9TKqWlRWf5wzJzygmGjZrWegC7BFN28k5Q=;
        b=XI5FFowvCEUjxsKFQjnCg91YwZHLTQcNLUEs+OxpyUZSxJSB9DjpieUFbeytbsEmCw
         6lOOY9fA/hjEO/GsvQ2zUYlR2RUEf9eoH/OgZzb9IsqJz1UfP2CauDXc650hfmH+kDaY
         SL/RInhP8h4er8r+B0pIyCATV4XFPb4nctyXSI5qZa1ENo3OIC7MnklfDS6XnNPnClsb
         6mJNDaRU27/k5uhLV0OsbJwdbxk/gkmtCNGBA24cEKqYo5Gg0bT/jR69AenTF/TGKtng
         kXhvLP16WXSgKlg5+qubZHw2lSoDAqOb7wTd3+Mn9wVbb/YwzWT9eek23lVbL2P8wkW6
         rDUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793574117; x=1794178917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=nVzGWl6Ix/T3fqktC29agdSx+nhw9+1KkCo2E+r3nGEnlkYi0YDWQWcZKbN8IJSDu4
         MBaydsTTNFoMQdoqPXGsz5UQ2Wfw9GF21QdGDrbEeljKQuKKEjrBjiB06y5wHhM+nEm8
         mbw1jHlQf53yWyOYwcEcfi5NeFN6pvbR0q/l02QKIHDF5urwa0edOa9ApbA6HnMYhOll
         hYFaO8AgH/2IDzyj/ZN+G/EXtaqbcBGKAU3McsnRCQiBihI3r9uHmL5euFuWWyJROzxY
         BFVBwOhj8y40tAKAF/7koZvCgR0hrPSG/hVB5MytE3KgmxotZbHld46pa7CQa61/nU6D
         Ougg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574117; x=1794178917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD1nfjl7lET5+9wsGqFxfwSgtWUcBXtbEov7qAlr+4I=;
        b=Bmsz1k2Es1rniRFG02jAPcxhuTPnmbCUfDZx16BZ2Z6OX9F96+qg3jT0A8fsm11Cai
         teFQy5npC0TKvZ+VfURsacUyyCbp3Ny3OskdfDt2+8amqPiJyJAfnYbuwGGdqZv3pq1E
         a+AFsmWhnEJBvBIq5lLtxmy1j9jjAD71pnRyqIUtbLqCkrG3BsGfi8wissySiKSe4X7J
         DumrzsOJFSLcSVPn9gtmrL2t2kk7JMGXdK7A+BeZLnhHHjY2yTVtcMrc/McHspMeNsvo
         4mRsOZ0HYrA/ZoUxLVSvrGHAY7qpM2qnZPigI8RvIxb3fmuO7X1uXgH3KdjWxB1pxu9t
         QaoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcIS52fsQIj6fxH087qtXo/xhExjNzGitK8WRtLZ5WQxj22i0W2y/axZBs5K/xTZo8g1w7xDa9BxirIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+IMe8aucOfy0CeAT1npg0BdLQNGBlxN8pZ9grgLJtYevFipYs8
	1qtSYbZ7ddnJPOTz1lFKKSCIStmEsx7luz6r2sMg8c05FkJ2pn+9+xnQdH6CBc3upPUHp6kRXax
	YxqYz6NDBm9/xCjU0DftxSKeeKr3pwvs=
X-Gm-Gg: AYBFou0pLb+BgG4Uln+Uj/1cvj8PbqPgRiTZqx64Xw8lu2Xbsw9PZro0Tl7okw8TiyC
	R977VqSYT80TJoxdEAqXYVvVZMolG8z7jKgv3r3EdNX0n3jNGegaFFRdxHbL3Gm+5tjRzsd3cBr
	QQOOMRhe1beIcWUIQmwYUkkt7adZijsCPK9zl7j54PQzRmvtrzg0VjA3QCgArlPTgH/EwC9tlU1
	/YF7BXreXSpXyV84oCK7nOLVV2OLPLWA5BqHMryUBTwFIr98ZGzSo6nEP/SgdBzXvAC22doHKSA
	7Uega6gNr5cDwVh483AXSI5rzWvainafIl2y6Z72+LDY8G29NJOuAB0immSajXc1Ukanzzuw/9A
	Tvci3GVRuIHQwSfXcbOWfVqhr5qQhsoakuUweVJRSzWyQS5mX+sg7b7Dl8E99ncURuSNFYA==
X-Received: by 2002:a05:690e:4084:b0:67a:86d7:b9ae with SMTP id
 956f58d0204a3-67a8d60ce47mr8913440d50.42.1793574117117; Sun, 01 Nov 2026
 15:01:57 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261025192320.209446-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Nov 2026 00:01:46 +0100
X-Gm-Features: AclHuK_6zPYcTTvvo1ADEqHJgjW6vbl_w9ibYmytUlZi0WtkMQH9WoT0aPoNmLU
Message-ID: <CAFBinCAaV0WEsO1oNF6q1t1hLF7oeO4oEpJQY_vHXvuQbWA47w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: rc: meson-ir: allow the receiver to wake the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Sun, Oct 25, 2026 at 8:23=E2=80=AFPM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The suspend callback switches the decoder off, so nothing is left to
> notice the remote and the receiver can never wake the system.
>
> When the device is a wakeup source, keep the decoder running and arm
> its interrupt as a wake interrupt instead. Boards without the
> wakeup-source property keep the existing behaviour.
>
> Tested on an S905W2 board: suspend to RAM, the power key on the remote
> resumes it.
Can you help me out with better understanding: is the firmware
involved in suspend or is this CPU core idle state suspend (meaning:
firmware is not involved)?
