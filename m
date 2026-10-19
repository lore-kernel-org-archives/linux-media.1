Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426272;
	b=Nu9zeZbLPCeve194stfj5Sd2Ql7sf4FB2FXzDk/r/it8LViuDZS23mEJTAnlXNl5vz7o
	 qnu8xhGFtHehnysroj+4sAbEzZDI5pdMwYr6OFvRxKsbFoqpghB4XwDwNjyopd89FjRkM
	 9aMspBBmQ9HK5qa5sJ3XHXxcG8x8rkfSvCwNiFAeADv7p81qkvjYYiG/Y7AQ6XYDNrjVP
	 H+nzzA5KrGnV+z0GYYbkhBX0X9yJhhJe50ypEzjUZ+reEj4DXhbBT5wG175PFXssnj/Rd
	 Yca21p33oAhvJ4d4i12ikEXUELbDc2W4Z7EuSZAX3N1Zs5qpRmh2vwCRehC/nM/wnbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
	b=BaA45ej12hm2jFW1beKG/b3yi3YI8xMQ4l3pEk0doX/5BnPXZy0D6EO44Tv49AV78oS3
	 EMpevCTBhCW5cuIycG5Y954/xK71+gKtv7qoUaTEYadsXhICyJUBETNIsDB5e7m1eGw7r
	 9roTlji8TTSBONgzooUPGouip8PYidu8Tonbp8ijfcoTXsHpQa+3im0gKUYXl3fFcpDQD
	 tkLV1+934KelLQDF2NNmLAuB3eEuXoKxN06rVgrSJKRYUaj7WyqEHdNDb3IeySA4PiNf5
	 rjOyY/DEZvIJhiXVeBQ4OdeEsUo7cFu30QXo+ie1qGalNSzjKh0rovEMSjVOfO/ebUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tRx3K5jm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD6606DA7D
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 16:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05BD6606DA7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=tRx3K5jm
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso16995a12.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 09:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426270; cv=none;
        d=google.com; s=arc-20260327;
        b=OspaZ6rSSeLyxpvWVUxdHhDHuw6jDlYtN+Nfp+6dCgOtY0lZe2w8FvskPm27oT7wR2
         qIta2wklIRJbgcHHVeqY73q2V8SHhgxXjeBWcrsnCXLUJTbv+tAvPafEUKGcPIRYU9jL
         whvpuXbLklisievv1oqMwNfKAAVMKKZe9l0Kn86ejoDbUz3GtXneYfPQO9tGjhanI7wT
         WX4bgWCNL8tJmoqaL5Yip45kzA1oFc4g3iUirLJYJPT+ISZh3CnpQ0j1FfcVYHtYDRNW
         j2XgIFsW605fM64ogkRsnc0sQGfZ1dq8d+GrfFBn7Mq+P/oVFMKQpq7IKhk2bxW/A6ut
         7kXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        fh=EhrvZmdDJ5S6W0czLHX95+d9CFjprK5btLFgdsQx5rE=;
        b=MsPNB3nt1TYh3ehk6LDy2kS01Dh2HjIlJAiNFDAtSax8ya1mbCcoxaLH5P4rGJKx2l
         JT+SMD2cQk8pVrleKu3vbxR5ivGv05s/0nlDSDmLTjLRu8nt2OElgeN1kos1oDNncxcL
         EpUUXLtQvAucP/dqiaOz0Yz/Goh+6D9/CeJOzLauqyuKq90B+7//WJ9XL8S4+HAU6pLJ
         cWRNtP0ka6yZXZR+zeX0oiT3KLyenlKB/pa8GzncHLWknRvqZ0oeB96ncQqbZTLVM1zR
         ZxsbfbvGFehiZ8goizUDeSsoQzU4Bxm472kJAbupwSJHmBjrEmC3cff3PRwusdLqf5TE
         lF3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792426270; x=1793031070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        b=tRx3K5jmcY33uFjjLhBl+j7aQChswPzQ8jc6vt21o8gL5HebhBkZhq0m4V5VQXj8Os
         Vxy55uyFlopl85UWtcuhSyXPeS8T5aUmHQFtnKEsZz7CPNXCpLO6jJgwUUnFOIl2yUFB
         91ziLFkt7j059F2wIJiIWCft3lgYJiZpl7D3tjbGSsU8jErVrD+G6+TLwtfY72Fl1BRp
         +udUczkN4A9EVjpSES388lV7wjosc45EmCjnJY0x3QPYLgzoDNHjM4jwwdIDS0kg07RL
         YnqkBmDIKaVV6xViHZm/RbvKeMlM1D1RnEkQXEC8kGdWmFWv98zxVzqcc+Q+Y0hzQQtm
         mbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426270; x=1793031070;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr7BJMuifE78YwYx6pJZlEAPKb8dBOcE7CtzncpVA88=;
        b=LmxEUWy8UpGbkqKIDSbR0UgrOZiFhkNcy1Lsj/UUbYQLj1Kgxm1VHRbsoiamcVBka+
         tDUmhWa/z3hdN45lGkZSLABH4aFcrrRNsPlwoRdL2BJ/R/7IUAqWpwFLkxVMRcN6w8+U
         vZJSw6f4M+7WXs8+RHk6kSpxWwCUWImSrcmQVglpcaVc+X0Yu080zTds72e1GLuuxxQi
         yEZgbEb3C/1TDulksL5xN/xKB3GsSTgKyKjEhwXKQpQDImjH7hXxtCjWBvhQo79LjFra
         ytfMQlTRs/O0FJcY7G3gsWkaMRcLr30gTEkgiZlEQ9zEZVGnSHQNzeJ0HahOyr/4/TQJ
         AB3w==
X-Forwarded-Encrypted: i=1; AKwUvBxPSbTkfL3Ri/YxodjupAi13TFsFHu6JDU6oREGQLRRclCBOrrKm554GKSq70vJ/ksAlmXisEU13AbTlw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbFuBT3AIm+EFDbpNAy78WUIpRqJRnE5xFDsxl0UiJOF6B/x5v
	dxSnRZ+pU63MC62H6E6VQfTvS1DgEZbRR+EWVRIhFp5Prytg0lqHzfMNmozCwdM/6HuqQEVs1wY
	/4qOE2gNLcZdYJQmf4JWuZjJAvUIiXLm9uEPbBmvE
X-Gm-Gg: AYBFou2Jy8ozOZS0VTDUyQpcWe8BiR6ptl3Hc4lixKh+XNJViPie1XOudpsAxnVrIsN
	T8OIOUuyoh2nt+oS2evGGnP4uk/LmsdhwkflgeWjJr8FJQMgHwkwNKIAucrhSbZPav8rT7iezdr
	n/l+6E0gMoo9Pg23VcGMBBYY4xzpq4hpbPBGXaTDIWPFjzoxDlo73o1/0FgEpNCdyUiiAFWbyoq
	AfzyKf8JkGfK4RW6Abg32y7NTWnPrS0GKAO7u4VgtEg3g3UPlGg1rHrWxp9oKKvWiarAIOObqj8
	/1k2YfWOAxGkM6P5ELVqjRCk8IMAI+lUhmpT0Jaky7W2lo4bkwVucjobmPN6oTJWT80F9JXDpiT
	GfSI5VT7L/Q==
X-Received: by 2002:aa7:d3c1:0:b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b3ad90b655mr92225a12.9.1792426269498; Mon, 19 Oct 2026
 09:11:09 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015163915.1166043-4-almasrymina@google.com> <179233927086.3135.6123492094489915156@kernel.org>
In-Reply-To: <179233927086.3135.6123492094489915156@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 Oct 2026 09:10:57 -0700
X-Gm-Features: AclHuK8eiPagoVp9rRWfufPEyCEaXmjBdb7vS7t1VxUSJn80p85wHIDPJ3eEP2Y
Message-ID: <CAHS8izPobFzob0pF2cLqL+nqtJVL-TC50QuDHOem9_cwJoGSxA@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org, asml.silence@gmail.com, dw@davidwei.uk, sdf@fomichev.me, 
	ap420073@gmail.com, pabeni@redhat.com, kaiyuanz@google.com, 
	bobbyeshleman@meta.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, dtatulea@nvidia.com, razor@blackwall.org, 
	daniel@iogearbox.net, tariqt@nvidia.com, kaifengw@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 9:01=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 (1) =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] On builds where PP_DMA_INDEX_BITS is 0, this patch leads to a
>   use-after-free of the netdevsim bus device.
>

Bro this is a pre-existing issue I think. My local sashiko also caught
this but it has to do with us not doing a get_dev or something when
PP_DMA_INDEX_BITS is 0. That's a very rare condition and unrelated to
this patch series I think.

--=20
Thanks,
Mina
