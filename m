Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560538;
	b=tJKhxkoJSWjmHXl4jNI162nkkBWmIx01HuDDko+WYqQlXMYM59/Eu6xf3TT9ZEplpBZJ
	 KQK1uVSu7yWiXK6xov/jTVlRcvdSeQgmfmyTKetazhc/cyn64OaLArxuEDF7RylfTWSgy
	 M+lp/fX7SBRwex119IoDr475sU3XZo+Q06Tyh/18U4q/T4yoqDCrQ436K55rqwA0Xm5Ig
	 vczYY+XjxPg6mILLV/cOavf/8/Bt6K2gPgeaKI2wr6JBBFHF1rV5AoD6q4IhZs/c5Xmi5
	 87oBgyBIV40I5cUG65XJh1jmtdPByv80AXaU0kWYvYCGZYsyuiO0S5rSRd3C+u8MWCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ShlP1QFQYWNs/RofmHP2lRmg95fTwvmsIbJOEo+1Nkc=;
	b=UF/1ha9sDJ/G8M6YxW1lnpj5K45nUx9k/dsysL/vU35OyI9w2o67HijXhcqBFb+ffixy
	 93bwzp35Vn9TsuX2LQR/gqU6er3EberEOo1PR2mS0Vuwo5rQOAOsc1z6M1K/Wa+b1PzlU
	 +4YPpmqVWIL6/S2wnXSJdeFaDnToB63iAkBZ/jUZchEpDfJlCKTIb6RebYZCemTiEkZbQ
	 f8bKX+qJWNqXMMVEkLeeITLwooJ6Vyra4uLE1pya+qjPS50HbLmZvTDVXZf59KwX/NtsN
	 Z9gO90+Ex2rqAmdVg/Ty45B9Pf/9mquYtgL/CR4zpvLKiRTPywVTglfyhy7I5Ak0d/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKhNeKUb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.64
Received: from mail-lr2-f0.google.com (mail-lr2-f0.google.com [74.125.230.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCE8606A330
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 09:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCE8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NKhNeKUb
Received: by mail-lr2-f0.google.com with SMTP id 38308e7fff4ca-3ab1cf59ff4so4611051fa.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 01:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794560536; cv=none;
        d=google.com; s=arc-20260327;
        b=BzX8vQBONVep/Ei5Nk0yFlquqvZYjMfOclxKoFItGvLwqIDoEfrEXJF/vDLstA1nOf
         oE5Eb9GFfQB9LTxAfr7vFoN05hIj+sOtwpae6+nO0LdfnxT3MUilqcdzrmRz+G1/6KKy
         JQtyGnZGlqpjw7EMgXkkqVBxW68YMZ4W2fu0SHlGG0nZJAfkHgD7AiiMAwC0/lkFlSWW
         db54RbikP9m/P0cRB2mWVq276h42vkoAjrbXdA7ApWEvlfV/d0wsGHvyNpUiaraE5rdu
         qZ3lok/M3SdZHslO6+EBS3b48DDC3VeQFuQpL/FVhHBEjVzlx/cYYQntZIVKU96LS8SV
         KgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ShlP1QFQYWNs/RofmHP2lRmg95fTwvmsIbJOEo+1Nkc=;
        fh=2ciEBS2QSOjqhq55S/9/NwhBq6LA+G/a2qVw9RzGFmQ=;
        b=h1iPDft8xSD53MQd90T+Sn2ZHp0pPJI1HmNArZIwz241pos5q38igZJ5ymmLF7X6Z7
         bHl+3V+HeI5sdUJUtYfYyNXa7OjccwNjxJkoFIilF8V8TlnpTkyZoScx8xeRlRX9fvXA
         1R6RfRvR/2CAIEFkha/BYQLG0XmGmZfOqGAR/jaweNvn1n9CuqvEg0Ocjug42AIJuYOn
         gtrrd0GhBJ8w6lYGqiEWUsVJUjdQQnCShON+mlCTgtNTDxKf6L8/Q8y7TOUKAg7Pkf5C
         /3tDFPxX/8gUJb0aKe/lzLHkQkI8D5DfYC6DvSsrxWJq99gK4/IufxlLwa8qoEPZRpmv
         PGrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560536; x=1795165336; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShlP1QFQYWNs/RofmHP2lRmg95fTwvmsIbJOEo+1Nkc=;
        b=NKhNeKUbz3nV9Y9Yq+59eD30vV280zDQg1sNyOEYIieLDElmHLs20LCcnzkf5MbhIW
         takXOiZtaYPjbmUNZZmzo1fnPIK3Ji8Q0Zz0NV5f23skw/D780ekbqMBEbR7felmUIq9
         HUVpvoq+TMkZOEf2bJXM3quhu1v/eIEEZlBBJOiV4+XyZG2T2voHsb5A7G+x5pKeft3j
         E4SnyXHi4htLkxcKF9S4j/vwUxhki6m/p0eMfN+WBBrK4kXnb+7DU10i1mdZahBBA6xo
         +2EUnmtDpivWbrgWEh+mj0UhVHKh9r3xL4XDWbPvFZw2XXGZeNsSGQc+KaZxYEVL4J0C
         F5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560536; x=1795165336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ShlP1QFQYWNs/RofmHP2lRmg95fTwvmsIbJOEo+1Nkc=;
        b=QM2l9rnM/YcG3gjIKUqNjEZt8QMIoi/IcKjugBdGi3SUrMLa/Z74uoy4OuxWFvQYAK
         SbQMdL+hdfTQeS290xfvjiQh2UYd3GzJJLb/vTC8fJV01U0nkIwzifTACfBqzTPhXYmz
         gDlZkD/GADJWPtGsTQmKQNzAPo+UlIKipoSoesWePLEGj+FKn/46RxGCMHjz/l4tUG8X
         /g39xqNizNOlpaL4jLiltIu6TSyZwQQqe1agg9Rf74L+nMU9nNxAhBPU4JV/SN9JLNHz
         9D2rSkKE/yl76BTQBkPMyJedXlLa7k/AyOIDpXgVJuAnxT4sVidjt2WOFYP4gYFWeh7Y
         zlAQ==
X-Forwarded-Encrypted: i=1; AL+hErE8MGKeOVQbba3GLdhbPWJuc48DYxlmiBNLdtxFIcUSpcD41AE8j0zoKGEz7VuoPyJnkUNFkxLDrsKsmw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9/FCsx+ZW4t968Qz8BY0FQ8EUpkmO7nNLnIdibxwFDqiZTpbVO
	RjhFA6FqyPhvTQztiFeOwPitNYhFmh65LXclKC21Yq1U8TanMyk+f4iAIFOdPxRVTdDsScEbfTz
	32BTdzMeHgKxpuL9kcTDa1fsJ+LYh5gOcmr1GJyUhat1h4aNzIA==
X-Gm-Gg: AYBFou3EabObeFMIxjR2beYj5T1aTOyo7eGcp7wZ/M2DRrKbc+fBUqNjyh7r6+E2E6y
	XuzIWh9j51TSyawesqe/1H6rV7qvXlkGeQE1kfDFi0KpFqG5zkuZ+4nhodKlINPunyQylDJaTdy
	plA4a3wqq6VsCllf4gqKltJnaHtXtM20gYTeoa+LusTVz91j43dhIGQVNpqfb2BpyiruQnU9BKJ
	2Hxoy+c0rIv6DdKUwIEaUg8wyC83uwHOQ0bwmJkFEElnVOHuxT6apqQYMFgKc5tAWS2yablBIym
	KKJNpTvY7wG6Hlb4O4sZ8DRI1KNSmkUqi5LrMWhQmT6XECYlnwAWNg7Z/Jn11o5C0ykQYGPGyvv
	ZYl4vaGv52Rr2caqnkm5n98gsD5ucF8WgjCNXWseqT0v8FG4WPyERTyvlpps=
X-Received: by 2002:a05:6512:b85:b0:5c1:4974:c153 with SMTP id
 2adb3069b0e04-5c1707740dbmr682345e87.27.1794560535586; Fri, 13 Nov 2026
 01:02:15 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113021845.1697485-1-w1355457260@gmail.com> <avbAkhu1V5wiVTkY@kekkonen.localdomain>
In-Reply-To: <avbAkhu1V5wiVTkY@kekkonen.localdomain>
From: z Y <w1355457260@gmail.com>
Date: Fri, 13 Nov 2026 17:02:04 +0800
X-Gm-Features: AclHuK-ejvsvZRZ1-nlBgJMJsxD4K4EbVb5r9KS4oPiuqrt78W2Z9owTA57KJlg
Message-ID: <CABG6VKNUs3m1t+8OytB_UQ1_j+DZ2pP+C25qV6-q11jfdJwLhg@mail.gmail.com>
Subject: Re: [PATCH v2] media: media-entity: make media_entity_cleanup() a
 no-op macro without MC
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Biren Pandya <birenpandya@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I'd still call the argument "entity". Without MC, you can e.g. pass the
> macro multiple arguments otherwise. I can make the change while applying.

Agreed, naming it `entity` is better. I used a variadic macro only to
avoid checkpatch's MACRO_ARG_UNUSED warning; please feel free to change
it while applying.

Thanks,
Zixin
