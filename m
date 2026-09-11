Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C763438A0
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145798; cv=none; b=XYokqjerMMUZsky3dsAS8RN1vHs6WXlKiUiDB6IpGIMdUW3YL1KeZ8EnugwVMDScR0upi5dqo/V3jk559CisCO8WEnojnFRfWhSJViuFCP1G5i6buJzJUlJRhULxm9s5LpRbb9M1aG5vWxYYvWaeSHRzNVz5mbvryZNJpZXyFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145798; c=relaxed/simple;
	bh=K6uKwxCqsJUgJksWYso7qHsjK5lXDAeKCW7NuDXQn5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHoTWpnUQ4ip+9SBG+XdN+XBUOYVtXanpAE0XY38S0IGj+87MStRzSY2Ztg4LOaUEZnp0nDQx3Tmao060f54m/SQMBNge6vzsa0wfep6HMzP8CR7yA9/NWIWoeZ8u2iE7jsL8JZ48ao7iMrT56rvU55Ew6luc1qWMBdRxBq45Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KtwlYSgl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KtwlYSgl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a9a2f16ed4so1428258a12.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789145791; x=1789750591; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPeZSQUTfz20wSkb3gqNeqHVB/Cjwdp6OU88/IJVki0=;
        b=KtwlYSgl437v66vqiOSdZ2escmfEtrszqpTnqVT62vOqWi+/xLiLnNmgEpqZEA9B7Z
         t4dcpebnHBiZARyaLMzFfSblHQsYMmS0n22HlEQFiNIft4YTPIFE0xenLiUv37fOaTG+
         fNd0aezWKJ/ZucvoR/30CR+Fdp/KT87hqWNj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145791; x=1789750591;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cPeZSQUTfz20wSkb3gqNeqHVB/Cjwdp6OU88/IJVki0=;
        b=PXLFYRfQ6yGadiaY1L4WtjTfJjhl+m/ua/hUt/3+ZSwjCz8f0hE6A+kn84h4gxiMV7
         8sT623X9PT8xehg7tPhSbE5GpIZkJMXMTgviThEtSus857Kkcq/ch6hJnZtyeeNpviQP
         LNrjV4R8Q2RLFEEJwhsqarZoxF0gOVxs/k0fiIJD/p+Hzd43Rd4x8Yz0627NlRcS5LvO
         2jFW/OisC0mhzePRGCRaEmcPXhxLA/BTfqMC2QkPWBLnMoOYI6jMVrSDAjFz31LNtSIU
         FQGWT0tXOMIlwARGx9xjZ93uwcpGvzswQQYIFXwrJHAfWTQ1dVJzGKIoi6LxdNS+SavZ
         g5Cg==
X-Forwarded-Encrypted: i=1; AKwUvBwc9qEtSB8maJbttET07Od4fUDEKBFu7oHYsKraJeaBVUquluPyfHOcPTpCAPwKXh6PtVL3gNn9aXpJPA==@vger.kernel.org
X-Gm-Message-State: AFuF++kRg/Nvkd2tnyjRilNxvGhOzTPGN6FMar54kWiDvlWSMJNctluh
	CWBvpCIIFCJA5tusYZhcT0LsWGl75ycRKvvfeS2+SqRFJxCPjrn7a36xg3jAEv2rOSz87OUbug8
	nPdKGz38=
X-Gm-Gg: AYBFou1aHxqo5acpZMtvtB+n0DNmKvCRuq0b2+Jv11O7JVVyOcwhwQKdmjWayTgIFIm
	2dsHOHJu7Dq1ildJ3EAMUijA+bIK4bE3pLQJXb45aRzSRv1MPT9x1rE9k9uBROX3RAc0/exPPGq
	s3Cmdu+ilx+z7hHL8Oa9sVR3uMm3jpUAYML6qafmPCMPjnnK7iLhkEqFwftYcxJyZ1yQwhd1OTo
	/65s3AQ5i/uAsX7vLBQP1Zs4gsfxEPgM0Au5SzcYKdnA63kt0FwujRYxOUPTgFbPv8VH49cdeND
	OrlChbi8MJTLUYgJdVPPhj5FNwPgT367gdJsTt/2MbWBDiti9OQ9WRQo9hZ3T1RNnmHyN/3Vu+2
	BL4w+MZUXFLQMKVXyWtUj2WPhZe2FgCGmWNKF1E26Gr353ZwxdnnT1ryR95uXgt5uzoDzbHUv5s
	UWw7B18GDG+t6Z717yMPArcQJRBDuMIl6WFBqht6Jx3kSAf9GeWD1lBkO4HdDdB1u8G8zSRHEkS
	rqRCNrqtsu+yUFDb75Sfpv6v2265LqDbV2CaQOPn1MDlbOzGjuuJHwpBUY=
X-Received: by 2002:a05:6402:4246:20b0:6a6:b2b9:7667 with SMTP id 4fb4d7f45d1cf-6a9a326d0f8mr1968372a12.20.1789145791206;
        Fri, 11 Sep 2026 09:56:31 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5951c89sm1012563a12.26.2026.09.11.09.56.30
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:56:30 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a5e971c970so2572770a12.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 09:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8qLBKe5/Lm8JFckZXKHakqCA9a8sSCHGMfI1KfLXdTqwlfs9FRF9J11SPAKaYUOn4d6nZjLghE4cTVw==@vger.kernel.org
X-Received: by 2002:a17:907:d0b:b0:c28:fdcc:901a with SMTP id
 a640c23a62f3a-c2945ece84emr569757966b.16.1789145790391; Fri, 11 Sep 2026
 09:56:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911101757.286dbea9@foz.lan>
In-Reply-To: <20260911101757.286dbea9@foz.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Sep 2026 09:56:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgxFsT-aBLvaaWY=rzXKAnsETMGGBYeXnidPMoaEP29wA@mail.gmail.com>
X-Gm-Features: AcwNN1XMz7nZgWf_yAotYnqXcdS3AjXLSYrStUysBHfg_4lM5kL497I75V2wctM
Message-ID: <CAHk-=wgxFsT-aBLvaaWY=rzXKAnsETMGGBYeXnidPMoaEP29wA@mail.gmail.com>
Subject: Re: [GIT PULL for v7.3-rc3] media fixes
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 01:18, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> - v4l2-core: add bounded tile-count helpers for HEVC stateless decoders
> - v4l2-core: validate AV1 tile counts fits in array size
[...]

Please don't just do the shortlog. That's not information - that's
purely mechanical repetition of what "git pull" will give me in the
summary anyway.

I did some minimal grouping to at least make it sensible for human
consumption. That's basically the *minimal* effort you should put into
a pull request. It's not great, but it's better - "human consumption"
is what that part of the merge message is supposed to be about, not
"mechanical information that isn't adding anything new or useful"

                Linus
