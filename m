Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956376;
	b=tS00zqZ0Rmj1tFv8LAKxXm2U+cO+5pdcrSaWOvoyvDHAGTTE33LqZ4C7tK+gWEPvp8Iz
	 H22HalKQuHQJd3sCePlGO5pookExXeY9JXyoDKfHyxOkMDmox/+4d8LUdp9FQJN3smAky
	 Nx4zXbTLyGjtfzkMIhREki+c0aV9k0dddR05GKjwn+yBMeH/rPSBvoVHoyYJWINO4C2oc
	 LWnxd1R0unjB8EUv1u7hM4yOu2O8A12p/JKpcG9dl2fAHXwtWJsiOu5EPL69vBAxFLRgz
	 r+nZq1gSWeE9EV+FM03dh2tFwquNW8r6j6x0yoLkB1gRYu4Wt96xK6rKpEdzQk7pTdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
	b=WRpz61z9MAEzP8peHjc91c2WeU44JxT0T5VhlBMSiOQ2brsD8bd3cmtRrqkfp5pWrHkp
	 /jbzM+HVYrH1tz5L/aqvQjCCHl9415BmEWcf7uo/oZEAP51Gfb5ph+eCbUfFl95NT9d8c
	 xoUE5+DtWtmYSpXcmwAORrqwcGgGNc120az2eHPJ2JS9lvrF0JqnwQDxLUztyYUHsd+nt
	 m7cKO7GgcsuS/6Im1tT/dnJEwvWenutoZ8pue+JzF5/bqWCAPl3AzCsuDdE4NEpHxQ6D5
	 zjSB+GDxmwCQDxmWZdfIhlEcajtGPHfa60RgchSZydKsQmyOSVhcAi7lnvzbyYFTZAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F7DCHBDW;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F44606A32F
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 09:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F44606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=F7DCHBDW
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a214af2076so2440015e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 01:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1793956372; x=1794561172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
        b=F7DCHBDWJZ+4W4fYCOJAzTGIPUZxKEM3GQC0UOoOPoAWs2sXUCP0NuFdJ6wVu2Os50
         3wVL8GvuFQE9sHoxI8MVjxE6iTpOBUpa5gDiv+DeuFw4+Jk1J47d+J9iL2ailF9aRunt
         evoZoHyEB8egMEAfX7568Yz8zZUnzf91RfioeY/omDmPu3ZKADe6339IZJqYWVHPc26J
         z5VNCpWEHO2L7dXDObSFERCeTlRP/WQ8092QYY/fghw9MpgBbnJG83NLZf4fc2Y3H0ed
         Y06oe2zadbaLO6k1LP9aUY+7pkHtxwkzuUfNJKb94ZaW874HUt18oTsDZzdhU8U4MzRj
         c9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956372; x=1794561172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fmoyspqstw2/9PiOOpzl/yM+dFrdSjNpOnDbiAxrbfI=;
        b=ok7Z/ClYfKDjd7gGCBiEdLNxLL4s3/E86kGJ6ecQZzmyv/TjfmmR2ZMK/16qT/MDaw
         oSSynZ6VVxm3ub3+jD7G6HxbF6tQcdpIVjr0vbKqPMHDEB/s0fFAqXqvgrlIcXDUuuzk
         agqqUaHjAoy3bGR+1NsdRJLtrrywOzX4xE9muwXeuZTGsl0aX8tzntjyR3bw5xaAS8cJ
         fg5kAD92eumQcqyDJWHkhg+mGqF7HfQW/rQfXSauIV476WYf6Qu6bXglH/KKZsnWAGUJ
         EWqVWE5lbASGwDfXvdzfrwBijCEPnT1TgQBLOWdj8y5T7QvGQltuscTXZCXQNJ4YOPEQ
         /6fg==
X-Forwarded-Encrypted: i=1; AKwUvBxBGlbJ4UperkFRwb0FqYGyuhcXdKIYnfpUxqS3qOk7O7K7uRXsK4sCy1TPcQFyeB/PGGFLFpmHy6JPaw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bHrvOaI1esnEG6YEOfbj6muhp52zOfHbULJMFYcIo27pXkPIA
	fe2qxuneECcvAhd8rIl+ncAoDBDTK8+TOKtQjjQ4xDKPUzudtRwBXAgGuYPyaRdfbeI=
X-Gm-Gg: AYBFou2BTTBFA1V/HSlo1x1b1EHAdSiXAQWonOg7MYXozcYeGOXfj2NIWwR4KGK6p7K
	izlcnVbchqvT1MRR5IrZnA0g/Ferkg6RkWT4TQ6qKrToOgC16p1N85Bl3YqaShd4K3aAJwVENwZ
	0mlPbeosd+2LK5DcGP8riAVqox7SZat4t4KQBiYIcY7O2sAVi1MsVzb+bLMRUr5h8HJyUd1fE9M
	U4SqLng6SyT2iiBZWqmbClLR+JW57c2KsjGdt9OCEq1JCfEr2KArUgY7tSRrikTNN3ElcbySt8b
	Kd+wfV5inMGPiYGdY0r6q8ndyxcqsL3HD7sgPelQucCgqhx6z+p0GJy/zwcwkRgMPsddBYm8a31
	wbdvl3U8NOeJJoY4JiSIl3D3ffroDRs5efbowg/IBT6Io5yGeLZh1BawFbuMjCODmQqD9SfKVHD
	bC3jHBTMihp7x2jbubkO4G5Xe3mrtTRl51nQSZxEy4XVhW12ghgD+rq5+nB+ilQdhh5qvc4Kx9J
	5ZVhdCUsvpZTjj0/5024af03SS1z+DkHwPkO6rMRnGcg2dR1sLU0KTFpLTupK/ayoADDftpJ0NW
	jHqLpJeDvEIlJPO1rjn6DirbEEoFGz3H0FtJm73McG9FUtZlsxhEGQ50Lw+TviRvHit1mMOLkWw
	pa9emQjYFepWYl+BbDKMHW13OR+80Zb1sD8K3l+iTbOP9xWjypA==
X-Received: by 2002:a05:600c:a4b:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4b6dff8449emr26012245e9.35.1793956372121;
        Fri, 06 Nov 2026 01:12:52 -0800 (PST)
Received: from alcachofa.home (cst-prg-36-190.cust.vodafone.cz. [46.135.36.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcc6sm226920045e9.2.2026.11.06.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:12:51 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com,
	andersson@kernel.org,
	krzk@kernel.org,
	rob.clark@oss.qualcomm.com,
	jgg@ziepe.ca,
	lingtong@qti.qualcomm.com,
	cacar@qti.qualcomm.com,
	sandheep@qti.qualcomm.com,
	Bharath Kumar <bkumar@qti.qualcomm.com>,
	Chenna Kesava Raju <chennak@qti.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	Ekansh Gupta <ekangupt@qti.qualcomm.com>
Subject: Re: [PATCH v4 00/25] accel/qda: Qualcomm DSP Accelerator driver
Date: Fri,  6 Nov 2026 10:11:19 +0100
Message-ID: <20261106091121.3958523-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026 at 03:51 AM, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com> wrote:
> User space
> ==========
>
> - FastRPC library: https://github.com/qualcomm/fastrpc
>   (accel support: https://github.com/qualcomm/fastrpc/tree/accel/staging)
> - QAIC compiler:   https://github.com/qualcomm/QAIC

Hi Ekansh,

I'm still confused on how userspace gets to execute its compute kernels
with this uAPI. Let's say I have a compiler and have compiled a function
that reads some values from a buffer and writes to another buffer. Could
you explain to me how should I use the uAPI so this kernel executes and
I get the expected results in the buffers?

Regards,

Tomeu
