Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793574947;
	b=UJGkcCNPjoQcNgUc7qEtmlpqI7k1WnhO75Cdn1MhBPYgEPAb8GFR40x374s9AawKrNam
	 nPfBNLjHJ6mmcgSXkAY8XgC8dM+8WCQEtDHUTkXUFVHPKqeOH1bHVk2UH4jWc2WM8mXon
	 4ixlUtnZpXY+kmabPj5esUSZjrSMGnnIj9OHJs8Ju91/ieRdzFvXwOANGX7yyw232INvh
	 QRoHsYuonaZGei+cZL2T8INK+VpjJJSIZUkoInlYkdQu9FWUoTURjMJSbYc1pz0MZrRrB
	 eGVkCnz1Jd5Xw8KsYOTx1A6KOat8ZAZSs8SK6kFTQZ949TEeGozQFvXn658/eEI15cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
	b=uZwRKrOt/Df/xUTOkzIX74jYt7GYiBM4F95I8jYCc2v6b3gASYsFeJQFVffmeWSONklF
	 szofHb8yRW2oof3sj+0siTZFmqH/9wxdp6EZYGyDj1JcajanGoIQfmGrP/iPLi48hvoe/
	 Y8ZpZ1jlj85y3CAaKCgnmqGpdezeIUKqQL+Vozno2HHEAlqBzTDs3AHWSLl+Bn3yYPpwr
	 +FYZfbsliZmxNQJQ4WCFQO+CQgV42QOxG2jfLk4qk4JNIvfyc8kfG3TAgRE6Jh7OJN3oG
	 VOfPGDOTJ4vBTvSR7iPWICCIb4kLmrJSMXqHV15sHj3tEelxXQ7j2QDxTh9ElKdCZjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F9E606A324
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 23:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4F9E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso11275a12.0
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 15:15:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574945; cv=none;
        d=google.com; s=arc-20260327;
        b=po731D6jV9bGthFf+MqDcXbvnQP4ShZ4nOpphzOlgOOZbIGPXZhJqyzBD6M8amOhM7
         lfNwzm8VXZajjdkO2OaJPmVQZvr1fHU9pY9mWxPzbdU4eqzS9qnOf57HHOmt/YHOWltP
         wjAMvLDbxzNzCZZeSNR6kbmxiUwc+BCwvBt65ZrmERFMweIGyKRSBJm/Bj+v49vp+tKM
         PybJzxO3+anPN8Z/JJ0twI6YivrYTw0I104nkA5Jo1h+YoBr4qozDxu+pJF57a+iUn6N
         jVY8/40uZesIPakaizY4+g0fhj06rv7aLt5kd+uPUapyTwUeyeKZZlpc+S+CFAoVDDit
         7xdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        fh=aMbmXA255WWpOD3/S5LIBcPlwpoAylfN4V2CVM4lg2A=;
        b=pWnMci8XorvcoZl0h6UuFk8xKOqrSJEKB0VhYHTn8IY95YKfnI0M2Vma+3aKGeskPA
         ezYTMILQe/8qMiEVsFhpvCZLDQGNrHEppJylxpCsIJmdUUDOCdjh4CRxCtQZDy9WKKK/
         3enQyZYD4kyoQIvPXh/VldetQhtEoOUA4hQssjKIozXn8iJOSevUjm7ZGDysF1fQTVyv
         6yj6gRzJLwD8VSaiSqw4RgMr/+b2YQyGJHYnrBCKEBz7iyIJwiykRh+nMwD9q03EyjYG
         AyEpFrW7rkmFHby+di+ALMxaFqN6LdzAiis7dA+PyJvFQsEFlI4x87IEJ4NyZ0XpfO9X
         2btA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793574945; x=1794179745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        b=hFbJtLRnNrWh9MczBVUqeHa6U6vBtL5Ropz9byKDoNLVHM87ltQr5NGlVo9+ozlqCE
         zCDbKcJYaT94e1dxw/Tl2UYTrALEmcu44Sdv+omfskaXW9uWk8l+BS5O+UYhaasoezsP
         QmUBkekyhVGcuiLRAHX2bsZXRHnGRLg08Qp+xKModUiXTfY2OCjYIvtANXAdTG0v4TNK
         zRLI7sKCdAUAyM0qQu3FA702xRVGzCQthGPmRzYyviVOrDfcPOzaWtJNM/ZhFIVN763t
         x+PQrfOvRfHZvM5mLxU1/1lHsxnJniaj65ghOzY5FFLgemheiUlWhWVkM5wETrQ0wSFo
         nFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574945; x=1794179745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b85SCZUlEMSxM24RW75vmTYnk/54bnSaR4ktiJzCCEI=;
        b=DQ4+uC9gQXstSKjenqxPQH4tswx8IA80/uYXDxSlZrU/LzorpcdbB+NpIf5At+2VQ+
         FCANLJ4QtGBR4ejfXVskUnsjahKK0DtSopEXu8/9v0VzfGLdVyITkkTLTufX/J9j2aQy
         8eXxNaGuvAFYpkjM5nNHOIkRoZQJasmB7JrE0R10YhJOwTu2YW/6rVnkASZagEtbjLVe
         smowHuSqqFTlyy04IZppBWPfnYlhjTvnC/7iYhLJ4CLiSbkBf/mQ8WhlBZaw51a8zH4M
         elIcjjirNsOBAcy0n+OktIktWlMWN0ZGYlx6y4FnpUgrGg1mJN4YmYy8MBWihpNwlMPZ
         IrjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYYpimh2Gl+ieglQTlMgTioH8bMUl/RC4+UhkCbQdJPh1FTYvLs4iEMUhjuwtSa39uLPQqM5XhnXaoyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+u/5ObSmbATxSc2oukt/Vp0Y+CDCVbpkES9bpQZbeDyNFGiv45
	cdtN6zTh6qxT8IrDDJ+H/s9JMA7RUwjPvbS5zufScf4sXT9hd9QQIS90wNijIj7X5q1uQ132mYd
	4YXomo27Re/2GaJpbc4c9s/xcGWkitaCen6gmMvzH
X-Gm-Gg: AYBFou2ddPEKWQuBcc6C/B/WFizm/zq2Nw4c31rqrGeG0agEYMkvnUtmf0mGhEQYHTf
	/Jpfkgrc9HCy8k46ppf1rZuv+rarkSEVmR1b5b2buavPRpm8FNPgpLBjKM4gfCTsK7m2oBu6Vdu
	rULOw3AW9XIdGSD2CnISrb3nidciNw+tycU5hQ/yjrtq5ZGNsUSrYuqFWiRTPfoFOfD2kLZRDz2
	ZFDHleTQRBtPKvVneGheK+opQl+Qs5qtlzBoub8bzJMrZczXZS/j2a4z+IfacL/HElvQtoLMu4b
	DOUCOZ9fTdbSZd3limm2MFIG941O6sTYbcaokS5b6bfFwgKal0kp1HZEyhuUeT/ieR2SgNXuS8A
	iaf22xpxKu+70ThrIvN6NKeUGnb+KY5T8pr9I5Tk=
X-Received: by 2002:a05:6402:1a58:b0:6b4:880b:1b61 with SMTP id
 4fb4d7f45d1cf-6b4b3cd2861mr242904a12.12.1793574944562; Sun, 01 Nov 2026
 15:15:44 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-3-almasrymina@google.com> <179357408360.3131.16098294926514442303@kernel.org>
In-Reply-To: <179357408360.3131.16098294926514442303@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 1 Nov 2026 15:15:31 -0800
X-Gm-Features: AclHuK-UFMQ382VldDl9mQXawkR9RuLEX9lDNBBCTFPZuNPb5GUS05WDrMHtxpk
Message-ID: <CAHS8izO=-DZzaeFbczj=c5yGszo6parXeQNqqGV8oieZbmMW=w@mail.gmail.com>
Subject: Re: [PATCH net v5 2/4] net: devmem: detach TX bindings on NETDEV_UNREGISTER
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, pabeni@redhat.com, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 3:01=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wrot=
e:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] This patch's TX detach is incomplete.

I know about the issues with leased devices. That needs a bit of a
rework, which I have done locally, and would like to send out as a
follow up fix so I don't hold back this series.

--=20
Thanks,
Mina
