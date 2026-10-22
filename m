Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792683717;
	b=KurKXPsxV2q9v+agTzWPOr68pqxCSRPSfrYc5pOlc1RpcuPEe4xQ2eAO25PpEisYDbmo
	 A2cGS/pGMpglMxhEqmtwxlB/b/gQLD1N0142pMQZY346RM3lzj7qgEi9RKFPHkZExsb5T
	 UotI60+SHyml+sNhvWMwrqaPXS1wsNT20PVifrskif3edfaYe1+ZXcL7RRe84JOmI7WKM
	 NxhopE4Wirfe7KPnh8AFWvQ0xob30XQ3kV3QpTjCjCCQ+ki7vDyo+9M/PqF9lsTDjH5du
	 b+bymRc0CHkTWk4LJQrYeqxOY/3BCbxXQ0rR2ITDRtuQ5LZ4VO4Mg4FV65OzOpYfOGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792683717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
	b=JUt7KAsrf/ctoDUBHxtoQRqIY+FjBMlGmD4HYBEIPy27lTFPtaQmJhcic0JQ8dOwWmUf
	 Y72oevU6fpXxhhKwJDKlj6udln2ExIEvtpx61dnHaZgZ5TLthoEJy10BwGFEEJLozMBFr
	 pO7XRQPQzsns5A7znXNmKJECBGXG5mJKn/KUbnY1C60n0v08WOwAyNvHB4DoqQgoI8IbA
	 MuawppdzVwf4kZ2tQiFfAXxwOIZYf8mr6eAwVSPPpryeX33QmYzxesQ7AhiU26KVsU8g7
	 7+kcJEt5PeVxDeECNcKdWWnvy0NMWyMZ4AkKbiGEGarQ3KoNMqIKGw4dbTc1fYuomfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZE7yvOJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213A5606A322
	for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 15:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 213A5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZE7yvOJA
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so14886a12.0
        for <linux-media@vger.kernel.org>; Thu, 22 Oct 2026 08:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792683715; cv=none;
        d=google.com; s=arc-20260327;
        b=GeYV+zPkwrGgwFgjoQa5LdP2ggY3Cf8bCV+rJgWeq94h5VaWeK7Q2QxeDlqbU+KWtp
         9Ov2Ks0bWlqGZR/6MVQSBObcTZApm1mwUt92E00BxXvtv/j7WD7Np4+4gBv+KlLeBePk
         lulksb56hJptPiFZJHaQmagYIZ2FXwmiazMOd9KGoPcaSggNZM6HmWL95LHkvNnTgiRO
         68+WiyilMdSPqroauK5yp7S0KDbUiA6Ch1iJ6QQi7koG5BFtUXaGgvH1uV7j68NxccqA
         IWS7B6v7oExgRVPwtmq3YrRYAK58xq5Ga/OTRKKWdfieRdxzsfvUVvC+n4E+/O6Z3x0V
         KzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        fh=XyGCPOdC+WCP3YUT0Ov0cltBXy2FDXk087FQ/77WV/w=;
        b=DYlcJuBbNQI5/XZQvBDm1IixYUUU2XR18REoSOaI3J+9KTtLmT1/z0tx1t7FLbhHrA
         uaXs+bhE6o3KYG22AQSOkhJd0YO9gfexRQ6Xq+pgNwVcGndLi6yiaUZwCxMLNUY08eQu
         Gf8MIVWfG/wiywxLSIh13/Ywo7hayMTRQ2lWXC9iVqk4LhTk1XR0JEX3bhfM3b6cQnl/
         /+hZ06TdOeBAeuURetOYppoiVpym/0JukUiwgr0UqK2c/zgqqzB1loo2BK7I1nqFP9Wf
         IH2Ankpw4C9BZdxeK4DYgxaFknpvrFcn7h9ASm25zVz2BXajgE4H4C3HjnyxogjkePAf
         5KcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792683715; x=1793288515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        b=ZE7yvOJAXvirByTnY1Vkt27fJmKkbeM5kXZgy9I6V8zc3FR5ZUPfim62uiMjPuAUOE
         6SPRwRldc/SKrFbkdXf4hRf1/c3O03pzePfvS0r71ba+enBaOiJAbZPPhMOVNCWBHZ/3
         4tVMMjYEO5ZMp0D2z+Ije+fZYXBCho9JUorRY966hydJ1JMEmhe1Q61r8qlwZrET6WFD
         +Vf85mxjx/J3HPmeM6cqVMjUUHo/y5qg8EXcl++6krOhRkzZ7rzWYua95XHaGKgRYIU5
         tGft8vrtYkKSv7UR7+/AfReVLt6gzEKNR/8xFbF0uvf+i2HNlZavauOVkq5m0veX/JjR
         FWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792683715; x=1793288515;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zA/mm9rb6v0PXkga2C3gcDW9NUOTKUUtrwcsHol3f4A=;
        b=UxRj3jnHGzaF/KYcNf0LmCz9OCcqDvzZ1o9IHNeszj99bv7UZ9aL/xB97QBQcgFKnF
         VtxButeCv2F6GWOUXhcd3lkTwwRSK75jHgpjQ4hHvWw7JS2GeGyjiDEjNqwK/DB7wUYo
         KERJ8jS4aJbgwxgAtsePVT+/9p5KgXkIVxDrCDHg8EpV6OFkSG8gWN+3imi3pPg0n+Te
         eZfDjM4vV/+CNdRBcs/XwneXA2SWDahKTk19pSwX30MZGgkGJuMc16/JMr3TT7NaEA+I
         CYr5V2MH6PEN90PFNrcweEdkXC5BFmAKeVU141eRX/805ED6TAmXKRWpM50GMncN20Uc
         2ixg==
X-Forwarded-Encrypted: i=1; AKwUvBysj1/iqrFMwLEwTx+EfGZbJulj7x5be6yNoZd+rCE3bGKM7ITTVUbNezynrpDDcSI9w5glZ1+TpwBIsQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKD5NTKe1d3cWkkqyi762vRMXql+1EhEBFPPTD1a41TVuxrfBQ5
	BaPwhcFU5w/7jhxzlXjLJIGMibPd74iRU3y/JB274KOQa+5o3RUj2/xlU5mCmrIRJmgFSddL6au
	iqnvzYVn+7eHImKYEz72nCVanDCwH3+17uoPOApsD
X-Gm-Gg: AYBFou1sNfpppjWqscfzv7aEEfO7S1rzZPhRSnza72E0paRSKU4Zhm2H6MQCLZNXehs
	x4yMOucgYzIVH9ZjAyuy7WsZXWoNCpafocw5qsxVtAGC2zhCY40UNQoHisUFvu+QtIayKn879YK
	b0roPilL6ytaGzn55RWB2JxR/AWyx4bfERGSrKkmQR50IuXWPf28xTjl0A9vevkIHi94xPBePcf
	4miH/7qmUMIhIg33xWxgGCcY0GLH/ubqohliNednAGjMskrRyIFKVXdXeWL0ZIcLvXCM/foPDWZ
	gH3MCwlEHQrWwQd/xhCJi/mS6eVu5IgynrG89wI89M5XfTwsLOsYOmIbPgeWjN6HAjgJ4Lzrd6w
	Hl2HAR8TTWZAHYBJuflImvZtyd083i4JYt4dIEGYTxXPQgX9PPa2NOrWlOqCH9FQXoMOHBiEBLW
	wnPCI1QEG788nNOQ==
X-Received: by 2002:a05:6402:8d8:b0:6a6:7dff:61ab with SMTP id
 4fb4d7f45d1cf-6b42037090amr51165a12.15.1792683714889; Thu, 22 Oct 2026
 08:41:54 -0700 (PDT)
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
 <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com> <20261021132304.23e0a4e7@kernel.org>
In-Reply-To: <20261021132304.23e0a4e7@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 22 Oct 2026 08:41:43 -0700
X-Gm-Features: AclHuK8XnKCgw_zM2po_QzMrph49LXNIEmHOTKG5LdhHg2Whq1BLNJdt4N18LfA
Message-ID: <CAHS8izN_N25mm9vALax+P+W45gyxVoMbZoTXW3r6nPC2Z0A7JQ@mail.gmail.com>
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

On Wed, Oct 21, 2026 at 1:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> > But on the other hand the test coverage is nice, and maybe one day if
> > we add enough devmem support in netdevsim we'll be able to fuzz the
> > data path or something. Is there a way to get the best of both worlds?
> > Like put a comment on top of netdevsim that this is test simulator
> > device and any missing functionality and/or bugs in it should be
> > medium criticality max or something? Or is it too much trouble and I
> > should drop the netdevsim support and tests?
>
> I already strip Fixes tags and apply the patches to net-next.
> But it's still a burden. If you're signing up to fix the issues /
> review the slop we can try.

I'm more than happy to help but I'm not sure what you have
specifically in mind. What I was going to do is put a comment/readme
in drivers/net/netdevsim with a note to sashiko and LLMs, "this is a
netdev simulator, used for testing; do not call out missing or
incomplete functionality as bugs." And then hope that the LLMs and
sashiko pick the directive. If not, I can tell patch submitters to
ignore sashiko code review bug findings in netdevsim. Is that
sufficient, or do you need something else from me?

And we can always revert the added devmem supprot in netdev sim if it
becomes an issue.

--=20
Thanks,
Mina
