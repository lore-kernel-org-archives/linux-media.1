Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255464;
	b=GNwklYxfykP2PlRTpf0H1+IxRiTOoiFoTIp8hytTUyUldTRbcdX9sNfq9VjjJa6LvMVv
	 LO+oXWFEMIA+erzEoVFa+lnRdTXPtKBwW290JyUx0mR+38UEyzUbe8IqET38yZ/wh5D+d
	 jMDIHy33viHlCS1JvjfWSyKicnriFcK+r76WuYHv7/t0Vhe1IdMgwNNa7ZoCzMLNfGMQr
	 c1E/U0a7gvAWm0e3z7xIJQwR+EQZBFUDLWX2H6neghhE2Y08vJd1V02ZyrqS0wl0z1n7o
	 Pa3TgyUg4yI//OBs+m77hGrHw5MBVWv2Kqv+q57bZ5JSICN7EF8ADKqur2bE6wTMsUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
	b=Vo4PdcXnXPi+nJSGMqhN0dVyrflPbOsLf+vOzKzbvouEzEcA8XnRK9VBWb6g1tzLokaA
	 b62Tz0NekawXYlqS6jdkfZnxn8kgZSD2zfCxHCxaQ1cOZ9yVywNT65aGXw9VIL5lNFFZR
	 q3+fSH4C0iUMzU7qXi+E8w87kFxci9GVAfMVeyd61/WyyKd8+ELGUgXNi7CGsShmQcZoK
	 DelUfTprN+ikhx+Sb8LTR27/xfQXSUSt/bSCDQf6uGn7VP02gig8/luimPGtpLFIJxxox
	 MRJFSFLtKL9qGNYr32XKdjPSbf7CJiSyd+G2a+/rzGdIdCUEqsqdVF8L+PSxA3N2ocw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P0sZXvsq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A65606A31C
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 20:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A65606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P0sZXvsq
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so47a12.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 12:17:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794255463; cv=none;
        d=google.com; s=arc-20260327;
        b=gWgciUAd3V1SPmUIuGa/oHOzTho/mN6cOtUnrSyxxGNgVVRKUmojep1DcuPfyLQlxW
         ASqSPNJWiKom0ccehEqtY4/YZSzSNXax0vsq2ONeQ+eGz00MD+xa6mjZ7tPONqrgrvRt
         svNDwY7ZXdS8q1Tov5w6MI2M1Sl4jYZwTy2e3TkE8ho8bbGNmq+NMX+xqV1SJvEBrJAb
         BoECFcdJ3n53qNZrQKciKAPfIksIijDFxLDyIp7VZlZRhdSYvc0bWAM/r1Uvbw/EoCO1
         Fa0pa7QqZSubZTh2l0mx45XnWndxduU4GygzEHgtWLoTWXDsUgz42fm759xQwP0l9ls5
         S1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        fh=UnURVo4WdhE8JDWdssg9W6HqHKYX6IxLg/9EUr2cv4Y=;
        b=L3nrgJIGyMiK4ZA/MJ1Jkbdva6++fjw4do2/sy4vK8IxxYXZbBqWcLRxtAYaogfpim
         iwNN0789irhVAcWL4wMxHbr15lg6Kj25ngs8Z4PYImZDsUWZmKKwm+sffDXvSQiEALsz
         6weWRGnho32JsH0t9AqXu+mw/qmZ1pRU4kDAEI2iFUUU44zLPBnwccxdWpqaBfPXkpES
         acF31VFBNoFfRvVormouzJD2U1RiUxzLHzTykAuKx2N+eamiZAOeYYdeiaqiKL6RCHno
         UgNRD8XIr2WJP1eRyhWsiBWhBq9IqsSRnjkp6NyXMrZw55xu/7Tq34osnbYE1Y5SsFSg
         ii8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794255463; x=1794860263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        b=P0sZXvsqIohLE8Gp0wvO3DZJR6gUx3reQ55TVmSn9CykBgFrZfrQjaLL4smDuM0j1b
         5waQ6jjkuJjTO+9bK6d70m2Utj/Bo3ByzfIn4qpnN36A4OGr4mTtX+4jwHJPIdtm2UYI
         zUcvRkOzUEgrz0Rkzq4ZKf2kebSPB1+kFy/+FfAG7cS+e78EJV0P0VlujXhU9iu9Hp0A
         8i/yBt+1uCLDsBJyHn0CJe6rqPWpfuqyQiS+hb/gskzYbsqtWwWGnajuRq7Q8FrF6ozZ
         eZEXUqvB8fN1LtEJQnXQhyPhUQZhECtR14nfrxmKUEg2/dcOy13bALzuaFxJftMKZ4jM
         dprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794255463; x=1794860263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltRfrvbZQq2u14YHzE9ATEjjt/vP6akccZZlMBuYSXQ=;
        b=ruQL6Wg7ZoELszgi2wKCCFOTtXTJhh3IESNAWuP2nl1uf2ogwJNJ4B2+sM6Hrrq4Fs
         2brKUbm34T5E3X56GmDfHb2jPXLz2xGpzBC62x7u6PbdaMckp9xlINA31KZ4PSLwJGkH
         7saUCJu+5erBf8zBgcDd9qOrf4TS5sCYah6rlwpZ+iI2gHRvL8dOjmnMfXirFSpfJJHt
         GQz6hJ4RVrhTnbpnMIl74BjF8YK8XiJf+TaxwYsoQH1M7lnWUroNEABA89191UqFkmRU
         tOSw0/L1RbJsr0AaX7d88vfdwIYzMSqc8EzavItkJNckQpYmwfffGy4+dMICIoGkdq+K
         KxxA==
X-Forwarded-Encrypted: i=1; AL+hErFFoelN2lUuIsyDUjdAxuIZV60fJx8wH2IxyXmexdL8fczCqkOou9vgIBdnweK5NQoCOJ6JDH6Rd9QwGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9s+rqW54sje1iWdjpYMw5NwxeAjUSbop2HwWl6wUHAi/+vtyql
	M93V/iaQe17sC/7bgzk7fkPLv+yHQImrDMctaIEeeZxmDdE4KBluzTy1rRcYHNm1kqX8MQyRc74
	JkZh0lgeFcV9AsxO4N5zsOjTQKy0gtm4jyLPAoSwZ
X-Gm-Gg: AYBFou1ruQQV8W/5NSf1dkuWYHqpEYf/GAaxWFot63AbXoxt9ZEOBCeXvJ1pVDIY9Hi
	qF9B9KQb/HdtFV3TxsfPODg8BXN435Gf/QkOFlDn1OBHS5pa4uTVibSRWB3zfQXXhc90d9h9qQQ
	yIr2bIQo5NGAqxt5wQoNAJPhhBj4U21towjwg/J3S+qFM0g6zsnDR8x6HstUJ8m6SalSkIXYce8
	XMGLJelFj14ofQCZDDVo8XsDQJh9JHG9XpLQ32aNAa81Ic4PeQqQKY3Xg7MJ/euqaxH+JPKz8lo
	52DGBWYbH8gQsIF3H2mTE4WZS0cEFzPxKCq0uwzQ5KAWAlfyL9N40IsSAsOgmQcyXuEnTIrX15Z
	wNiFisJQ8bCzw5Z5mrUjF6oa/QOQ1XLrX3o4h9s2L5t9MY5XsXLIz+5h4mNK/RjHDSGM=
X-Received: by 2002:aa7:d7d3:0:b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b756af180fmr22485a12.16.1794255462346; Mon, 09 Nov 2026
 12:17:42 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-1-almasrymina@google.com>
 <20261015163915.1166043-4-almasrymina@google.com> <20261020121858.3b9107c5@kernel.org>
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
 <20261021132304.23e0a4e7@kernel.org> <CAHS8izNTbs8ONvjhiw+6cRkZQq+cX3t=BZK9aCr39JNkVbY9gA@mail.gmail.com>
 <20261109104959.181a3b35@kernel.org>
In-Reply-To: <20261109104959.181a3b35@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 9 Nov 2026 12:17:30 -0800
X-Gm-Features: AclHuK_0MFErjqghvOz060hZJCCzy2vAPCeLH5qWi-kHJsJTH_MqHsOjMY4lEMM
Message-ID: <CAHS8izPcFSLdmq16ZrUDKpCqUJf513EMs+Y45brc56s+mUBmeg@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Tariq Toukan <tariqt@nvidia.com>, 
	Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:50=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sat, 7 Nov 2026 22:21:48 -0800 Mina Almasry wrote:
> > So I started looking into whether we can improve test and fuzz
> > coverage with an improved netdevsim. My LLM prototyped full datapath
> > (with devmem) and offload support in netdevsim so the hardware
> > selftests and packetdrill run and pass in a plain VM without physical
> > NICs. I posted the branch at:
> >
> > https://github.com/mina/linux/tree/nsim-devmem-rx-tx
> >
> > The main problem is the total LLM generated diff to netdevsim: 62
> > files changed with 5,525 additions and 672 deletions :( So it's a big
> > change.
>
> Great! Please keep that slop to yourself, tho.
> Upstream isn't built to host people weekend slop.

Understood and sorry for the bad suggestion! I was indeed unsure how
you felt about including that kind of slop in test code. It was a bit
too tempting to suggest it to enable the extra test coverage.

--=20
Thanks,
Mina
