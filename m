Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792563474;
	b=jku2VSDF+9FEe+K0sgWeAW6cssl7+5bbpn0MUl+wsXjxzj1m9Mx+wAgXb/j/OLzA2gw6
	 OzH2XlDJ0RP9B3owSTFfiEZykCuJoq1f9obZwqUccfUxV5C3E8WAOAAI1hEeg3CDXMBD4
	 WpymyxHlS+NbAB6wyNO93cmgYHD4Vx6xj7NAcbDnUtpffEvs6mtcrI2qZpgg5co42/pWX
	 SxGEFjZ4ZePyyx1sIISrqn3Ekba41PgI2UuHkdXVApJSJjB36Rvibypo78SERj2eXUsz9
	 lihrWb40NiLx+6cUeN+BggwBaxP8Ax/rp3S0eixXX7SO19QT4jPRkeyf9AU71OrMTFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
	b=eZTGFEddg37k9iVPYsQfMJ4YP7py/ltRa733ZsfHV7k13fKKpfEW/EZCQJOxRHM6ESQx
	 wrjVpgTiinLn4h1bn3RbziRQ/Zji57K5ZQVz6pmkBwIsZvsLssp9s7wN02Kh2k9s+wuZG
	 jGHXeKO3V4Tw1IvI9LaEUb9UkXhuoZb1vLc+l38uyRaE6t+pAAQhGtgPJuORGHw/ZvOWU
	 Wd45q1GQVKk24ILn5blhdvXpLrRy+yxZN5tj6styRYOtc6YNpnZMJTHkF+idHJw3w8HgC
	 59h3p7xT/anOLazWY4PAk9kurS6m08l8ijOFvFhTR9/ykvAabGItKhjEBAFn873Ghnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C8606A325
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 06:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F14C8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so7547a12.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 23:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792563467; cv=none;
        d=google.com; s=arc-20260327;
        b=Lx31UTGy04z5k/nG7I06a97I8nbSWaSf7Z3lxNVysTWE/pp+r4y7Se+0Io5AFLkWi7
         q2b7KaGVkgMFm6zzZYtZYEwK85t7J3Eru9of1g0sDoNjvjyI4GHC9/vf3bdSxWD6/9Li
         Rdgvuhtszwktdwn/BKXr9GTBhB+Fc+428PfBreXReaMnxUoUZm50ftvjA7Fih1/+O/wh
         NVv/DFh/7W/mRcO6U1cb8k9w5JNLdmQIySNN3rDbTu2q6Hmb9/P+InZ//fF/7xB4nkmp
         Jnfpxxz3bXzTfH7UkwWVIlDoxQD6VktCHB3zj/M4P7Mi9UVZKgoxglz6aPzISBUHLCyh
         +yBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        fh=au7vfS5lwCmVjsHQB54aU5qCJDonhX43yJMBE+2Rde4=;
        b=aIvQronUTp4XmJhxwkakZZLEJep9SasJiNCMntZDaEbfqUvDLANkBdoyIAuiAZHITb
         RZt8aa8xSuVFZN5Ko3327uhU7LV3sO2NYifuwF9ImQWmNSZHO3shOQt62Wu/lRPvryid
         yDUhw4G9WAutA/CPACtEqS85QXtTUx6BZTL3sYCMrUiVJV2gL23jcxE4HH+FFJ0qEDEf
         QzqFTJqSkHjlsfkKsST1rlp7D1KVW4G+6VnDTPzV7M4zp8iVlY6HKNZ+fSvgsqy1ipL1
         AxJoAMp6Pyh3924W0IXE5JBDR4RUUC29RLpeQzbCkWfVnCTQ5DSet5KHwnkeSzvH8GUh
         t3Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792563467; x=1793168267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        b=pQIPJhuwRgwitqjGA3ItWVLOGRQSBJ2UxZPYrPAWnSbOgQb7bum+xLkiJsThMZqhOH
         dwhP0Tb7gfDJbRLLmYO0L58nN/lbc0ijCbj7vD9/AsO9AN+96fT1k2yklolZXbSXuPwo
         LvDI+a8olKugTFENbi6HjsCC3zDMl6Iz1h6NBkZRClcTcPd8ggh/X4oK3qTp3lqZ6g+A
         1/vCcb7V+C3SGzXl2pN5Qza6vN7p6/inIC4foXEFviRK7uLerabWIo3jtiqgZBXKVU0E
         35IRXsTcGT6NK/j4Qt7Yug3jaRtwJPct+J6CNc9iCK/DHqCogYkMU/l3zqzSbvR0IHLw
         KzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792563467; x=1793168267;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpMUSfXjYdpw9tHtxpMBZ2ptmbz/1TA55D+obf0dVY0=;
        b=RNKOZpGeaI9J5aZKfZ+uzIyy1NikFbI47U+tJxswTOAR/KOWijkY/ZMJK1tIfpoRTP
         h/LCa5mIy5Ym6CqJs64hsRY0X1374dBgACyXmCd55hXj8msFkLh25es+f8m2j9RnhwOa
         ve/oi1SSlyCiHkgOsLBD4+F+TE1zBEqwEZvaSQEx1tFXSlOugn6RdyNfOYMRPQICYu2G
         T5dXPCN+gCQyAT8FBjkxlToCvnsNcgj0UVVUDIjnrh/OxcYz7euZcFcX6Dus8zuwHsfP
         Uma7jcGqi6oTeXh24E7TFMEmwvZf54ma94T5Au0J6wSmPQTeL8lOoG1bZfYNTLUcuIMF
         2hyA==
X-Forwarded-Encrypted: i=1; AKwUvByA0flpmksGCnR54NMslIr3RvZhNdOHYBhF0x/uMBYp/1Avh9MQGuh39qdFXvJAZN0Yv+4QHeCoMZzvUg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI6n7BqHM4V/VnLDnRS7rTJzLXxN9a6TtpKgM6GXC8DEZCZn9Tw
	QeSVGb8AylCaUQ4PEcMLROjtI45eHTKUdiLqTAb62WFWPCcNnQZOQD4HjslFjhVOGiEcx5cci7e
	5qTAiWt4W4ybSRp+gxWLSNc+IBKE38RgTjOzotoB9
X-Gm-Gg: AYBFou2JlarNfSIkfDMwQ3kTB671wIAW/2l50i9+Z/h5gdzLIuuW9/XFhgDfV5Yl51H
	g2cK5YiojUAdESxMdb9L1DOH4gW4mN48LRk850lUohrdg8bRVdeZZ67Pdq96Y1NDljdmo/hSGlD
	XoERsbs+B4YY1UonPDWEwVXVgqlRaYEoGKiy2zUfzWzSkmXd4nWnYFCGpc5TS4Yb/Wivggrsowt
	IojNsNOBuKmXzxGWO5+0NF/RWI19ZHumaI5FlqHbBMlb4x61KEi5MKA5hwHuh05fvQkYozyKufC
	Jn0axFdImzVBQKnX2bQMTH1pST0SHi+aGImyxpSf/XnIM98HoKoQfRW+nIA2Obr8uRMObogxVkh
	nR3SFrJbSB8onY14esYP/lDnHBR76vjsy1Q==
X-Received: by 2002:a05:6402:4050:20b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b3e77153d8mr91222a12.12.1792563466679; Tue, 20 Oct 2026
 23:17:46 -0700 (PDT)
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
In-Reply-To: <20261020121858.3b9107c5@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 20 Oct 2026 23:17:34 -0700
X-Gm-Features: AclHuK9x4qWdNnjJvUjsI2EHUcAIAKj09plc1NcLTKxrSfCtCSi6D5JlUi63xuU
Message-ID: <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
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

On Tue, Oct 20, 2026 at 12:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Thu, 15 Oct 2026 16:39:14 +0000 Mina Almasry wrote:
> > Set a 64-bit DMA mask on nsim_bus_dev, enable NETMEM_TX_DMA on the
> > netdevsim net_device, and configure page_pool instances with
> > PP_FLAG_ALLOW_UNREADABLE_NETMEM and queue_idx, plus PP_FLAG_DMA_MAP |
> > PP_FLAG_DMA_SYNC_DEV when CONFIG_HAS_DMA is set, so devmem bind-rx and
> > bind-tx netlink operations can be tested against netdevsim in software
> > selftests.
>
> Slightly worried this will bring a bunch of maintenance burden and
> "bugs" in netdevsim. IOW that this will be more pain than gain.

I felt the same way when I noticed many reported bugs against this
series because I didn't add proper support.

But on the other hand the test coverage is nice, and maybe one day if
we add enough devmem support in netdevsim we'll be able to fuzz the
data path or something. Is there a way to get the best of both worlds?
Like put a comment on top of netdevsim that this is test simulator
device and any missing functionality and/or bugs in it should be
medium criticality max or something? Or is it too much trouble and I
should drop the netdevsim support and tests?

--
Thanks,
Mina
