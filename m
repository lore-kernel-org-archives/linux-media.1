Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF28732D45B
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831838; cv=pass; b=ZB70B60KeIG6Q8L/nrIrG7SJ9djb4FiVY9ZS4Yt1qojv46c2jTf6Wpdtl54xuWwD9tDB9fHTq6rWcK0CN7GbKHT6z66yNLIj+Uhn+AAm9MpBUKYYAJZu1bHA76sx3+vX4xtKgAv0MH3ekNK4uPmsJp0YY7tFVWKwaefJQDynPYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831838; c=relaxed/simple;
	bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5OmggISCgMwxt2ovy32m44IbN4GWKrps/ykwKRHS6JAQjn9Ka5rWx/ldaEjKIwKE99xf2ckT+gw2pvMC+M4Gx4an9mNN6erDlD20Y8/CHgt1J5buYeQhAzxiQ30qRaYtDbKytrh1ygPAHG54UNaDQOmGL8Fv9LQDJHekMlMa3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4jAzcDJ; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4jAzcDJ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304da3b4508so333515eec.2
        for <linux-media@vger.kernel.org>; Sun, 07 Jun 2026 04:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780831836; cv=none;
        d=google.com; s=arc-20240605;
        b=Kbb1N+nejs18mha05/PruwslLTAbDhC5Ru4yaORFHMLmA0KPGSHg95nFjl7h0bE7gR
         grca0MmFY29srZpmnqk/iJqwDHIWoI1u7JvSTf7jt4eVK+/c2C5pK0sZ0Hh13t9MW/x5
         gvJ9TguD5MNRQa9fDXw2JeBiRdhS8JEDhy+MqBJwXMgVsvziXwBly22L2fzNLvZx+63j
         T5LMd2k5hQMqQbE2PmlVu5m3GmF8gAiu1FsMkKpsNrxc+pHgM6vQkclVvpHhhfxGpqAq
         dlh+g8K0VCJsVMAoEQWsZe4i78fZCPKven7zeBxkUKVwiEE9txX/cHs51vtrMR4kyVqa
         XwpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        fh=IJgYH4fgLotvj86s1mBozFgM36oQSufCyO84AMrmDEA=;
        b=eeKmPVE40RJkOdnn7FvcorE5byPt5Hq4HnNOXBkNC0p1GLkM4bm3xaCWI6olUbFU/y
         2Ph+JcPi6pE9RQjq+XZI3NojoKGXaOSJXb7rnmWUoAJKZctsqDqKEbJeh9RZThIwCgjK
         qAFKRmoy1/a6ugk1cz9Bu7hKDjgYpvntBxyGNV1MyVdGG0Qsdh9iOIrydwIWxtUnK92v
         JJI6AD1kjXgdzLPSG/dDuFWG/GvD/wxNqZDmrFPdZ+wFCDAs0w9Xj6f3P4BvDongFYdx
         AEfc06xrIh6E6FtPDI1jl1rd5lrQcqH9mijISlDZQ2GI8ZHRqt8dPaEWgeZ0CjQDLn9o
         4fkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780831836; x=1781436636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        b=j4jAzcDJhPeaPxXuOLnlLRSCO8GEcQ4wJpRFQnifY6tk+3aKHD396CzU1fnNkDXumU
         dqhHmQHdfUO4i3O9A/5Bg8Dls9NnFQFM49l4ttYS2ru2vvoDATahtjGnXtIpXYGYjdwm
         JmeXQh8iKsRoktA5mhfEr03jxk849oZC0khw3plVfxRfU3G1faykqsGEYGNG2TVkGS3K
         UxoNFG3KEUPeiwq9d1eTITy402AAK/V+jAQQ4P6jQCway01rGOwWYdx4gtbIOCPeOerR
         UFSKYr9r+yIwHQ0EumY0v5T8ofKqpYQI2l1TP7xzL8bwd+xr3ANHNw8r0dygp13Karft
         KfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831836; x=1781436636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        b=bcrH06zGXk3P4R83kJvKU2fNjEqGDuZ3ALb9nFRWf3qIT3Gk1cZJRfRTMKW5U6c3+h
         XUgZFckrtjEqdgYzKP1n3qL7NeMcZt3HVYO0iWABP0jEVLaBWH2VqG5RpgysP4hpO/fm
         LPHxaE9YSTTrwrSwXC+GJCYzDsHkTc20lP+iIp8aXvpHH5kUGVIGmq12ai/OClBGx3NP
         TeiasuQwa/+k3oKgvOWVGTGlqKuts+hwtIloGzQB9ynItnCn5Zmy7S2V+xA7ju9Bq96m
         Ph9m0DUHiGHmcY8W+O+7O02KqMjQ9IfbCEDtxp3a10oGAh6Vvh8okFWVs2AQOilC3gSx
         8kQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+d/jHXoavwqkmigcmfsZd+wPPJFZC/IW8/KGb+S1czA35BsnqIWvxV6FRkplrq6sQ/mr0T4bYWj+8efA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4kbfQjh2ARJva40Nowt/dm44D4CeqL4SUjo7c+jZ8OI7Q9u/7
	wmYCasNr/Z293hUhXI1rz8BG7SujcBvM7/pP7gG2Stui+nPH5KE9fUd+qRc7z32CFq3V8/Hk6Qj
	2ck/kWdIrlNqShP7M3W63bv4schhQGyM=
X-Gm-Gg: Acq92OEQB6XNCMrnWqAKc6QVvgM5yGQzuc75Jwr5RAiKrwXX6xbKYjAesVtaGH3Xeqv
	99n0vIkQRkL2PE4j5Rzpl51gXi3yP4+cCT/DD0xYTkmEtL4vTmnZwIpYJd3bAFyzVZj+jEdYjJs
	vC6ZiYAZSgCCtbj4xsmka3iswIddiSfz2gvHd1MkWqjEKfNOQ3UIIlcXoHDSlqu7lpv9xY3+kk+
	YbBvrVDlLDvv4vIAU38vUsB8q5H+LqfO6/WvPdRl5MtPuJXQdCK8vbjpohLLQWKGf8MprBJ37rs
	RpJqqUBYlcQhEBkBVFMqmptjKr3lzc0DLDpkJMvrRWGriQb7qMcfCv0y0L/nFqRKGLze2KlR2Ty
	dG7pPhL9rDlL5oRgFGYnLayyMmq9m5Md+tg==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr2921241eec.2.1780831835929; Sun, 07 Jun 2026
 04:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604192740.659240-1-lyude@redhat.com> <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
In-Reply-To: <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 13:30:23 +0200
X-Gm-Features: AVVi8CdeC5gDKTC7duruJvRpgjli4FYxW2S1H8-VJsB3l-jVir5nc-87EthTwdQ
Message-ID: <CANiq72==HqQnNdemJOrDwP6dCzz1KBs977MmgjLbssDstAG-Sg@mail.gmail.com>
Subject: Re: [PATCH v18 0/4] Rust bindings for gem shmem
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 4:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> This is fixed by [1]. Maybe we should merge that one patch separately
> and before the rest? I seem to be seeing these long symbol problems more
> often recently.
>
> [1] https://lore.kernel.org/all/20260605-nova-exports-v4-1-e948c287407c@n=
vidia.com/

I can take that one via `rust-next` unless someone shouts -- Ack's apprecia=
ted.

Cheers,
Miguel
