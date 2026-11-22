Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307283;
	b=1cs55bnvtXckIFz7OQpuze38EwUBM1FR7UMQIRVWPTo8X+1DTjCPA/N8xUiwH81tnoI7
	 t0eyhoKhB9pEQ19yp+vK9JyI0zZDvKSC5Lop7oiKgjCxAKpMWqNjYYW7Xcp2qpKgIeKKo
	 +J6jtm+oHFGMpRwEitsDRtK8ae7xMRLmn0uekrYWaQF2UcGg0gR84XBttbVNL9JLHsOlq
	 uP2eX0Tin6ViEn8vBMU2iLwK4e84hchoKSeG9XBOrV1EfAPJTdxV9o3TmVKtqACVYJGD8
	 eS9gIhZDVLx3m/pIYZOGCdAUgybRqv5Tol9i0dY86R26Zchrg3dltfqSigiAIgbzDTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/p4Vh0SUWnhUeQ71TXUxbzKmIv++dPKIuj8FkNX8BXE=;
	b=zLRAggzzBKFMUNS9UrDOotxsSR6kDMH6Vdm1RWODq5jxCiCR10IOjfA5QDofktCjUAZc
	 zHYr49npd2EW/0hUIIW3dKTAYD1PpZUcCARIcOknZxPXFbjYi0oIb7kv0JiOS4BU6K8zQ
	 muLa7Se+De7y/IbAtnD7vwatx7pvjCOwu+x2IAGnde6hG7xuOaOHr42MlQ0gf6lvW17kS
	 3aovI7m55aG8Yjx9GfWBv+Pwq1+v7znmqyWg1XAR3GT3fiHKxRXnK8OWCF5njJOMVwksA
	 TvVK+CFPOhiFeNyTV+4fQ9BZGr7Hcoz0bzzGFwcGAR9TyZCfCwy0qH+B44T15rezP1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nmZ6qwN;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7A606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 00:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F7A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nmZ6qwN
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9213fddb596so21647046d6.2
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 16:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307282; x=1795912082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p4Vh0SUWnhUeQ71TXUxbzKmIv++dPKIuj8FkNX8BXE=;
        b=0nmZ6qwNYk+YqlUBP3aq8k7s5WYv6dj4ZETp2mlwZFNpuZpEfQh5iXSl4uwg3cUQX0
         LqAhs0yU3OsFlUZ975jEbYrTbps3UUZtMGeeWX8en4upG63E3NEPmRoS6v9n7QfqcrSv
         u/JxwVQJDShxy6dG7y+BePcckU+hx6vw1gDW/kRLpJAZ9UFW0/1QbODgz5fG6TaBw9Ss
         TNH1rlqKT4eAGkZHkDla9yFW29Qw3t/veqRDv9vjN5MLwvqzAuFkXyeZLJkJjGX8fVrN
         p8082iX0HPTMsreXeyvnK0Vu30GZRjjilkhgs3XXzNxz4N01/xIRyOzPoSgGeIkz5pmH
         kvuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307282; x=1795912082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/p4Vh0SUWnhUeQ71TXUxbzKmIv++dPKIuj8FkNX8BXE=;
        b=vFVmV5yf32aZfUNMbo7Peiz5Z6hOiwyQex1P6dmYy1d1RXpmZBCKKLvVJ4gnom5XfE
         wuOWO1XM+RMwOw1ni1fRiYx77DT20T25K7AY/7YKnQ7xHbmiSAZNr2MYykah8W5IXiK4
         23EhldVf1eGJ6YDQu/J4af6Ru7ZYrCVSc5HCFdssdxHgWh4WzNcsLUrhk/uwXTMGXArb
         YvLTNkd/Rx2mQLnrcToTuoNSFGT7hu2GWfeRX7cUxqryyz39ASZ285ixRR+9CZztS8AH
         NziSE9Wz/MKnTi9JAdz92WUXQ2bXMVc4XXCqAjn3ZRC3zVPzQ+/zbDHgSaSoxP4oGyKx
         1QGg==
X-Forwarded-Encrypted: i=1; AL+hErFgDVOec6HGO6ytxwplglRybggJ5H4hpa+gYOCVq4WZy60UF5WlOyPtJ+N8BRabFyh7B9Mc4SudR8ggYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+iJZ9dzE0riMUrspMQL7vh8ldBuoUEw+r1zUlc+ll28olEtWM2
	TM/zIaKA8g6DzoP2kJyj5kOKQbZIFgHjENVUb9bsxAwWT5TtWh+wnia8
X-Gm-Gg: AZFdTZc2UHcraV2UtwA2AeEaxM96pUv3hrpSDkJjQg33uoURpcPmFlxnc/zHvPYLvqe
	/sYwC7VvyaX0nY6qemYy3mU/PedicKiJzVkwKVXxBjpgM4zsvQbJy3bwo/IzKre9dzL/N+ZOxvu
	N+CPjZx8PCpj9Tw9fzJnNUforMf+luet9TMZVigvm7AUr5EbuKOP88vHBK3VU8f3KfgFEcYZy13
	qt+4agHaFQhDMZ4Yq//MSD4vPrm3/whFohVuOTHa9l0TU+mg0SeIiAb7FcjjE20ehDp6HtHJoNs
	rHg5w6S9ZC1A6Jw5Qvp0yjJS5sLGBHooXlTdnIY/opI2+CeDHwNouBBSUxHaST0uusqas0Z+pfL
	h0gMoCUOhRPePsD8ZWu5+eABJ7+rp0lIX0jD55yAvMNB+1DV9+p0YZXMN7RFy/N02sXPAbKr82N
	kvPpnwF9qhHBLS0fuThTlNH9qTfylsxRYP+f/HpjIlmn+pjKJGw/qTU9P17kWibrD4tUNaAr0d1
	nPszVXshRlMCvaUDl8OaUO+eokNyU/4RIc4GqiuSYKZDSR8GpbQ6FBfFT/miqK7KAzIkfxf/rO5
	Goo0MZHZvE8ZxUbr3t5A1gJ1ooQ+FJcvc+MZK9E4b/qyom/JHSDZpXsXTwjW8QJ2OgwKzbQwk3X
	I7N7LInBc2a8kmj9IgYtud+vuAuBZ5SY/AULq1kxM4CGYOB92tagL0dll+kHVwhCLC/THoIf9r3
	oae9syVeC+8PaqR25WOvTUcxC/7L7PUzx/8Mgy0UC/sNhpSprPZ6j5gN8RUPLm8OugirsZjncx4
	XwolSg+S5B2EuKaV3wv67sC72B71nTq9DwuKHHCLd2p
X-Received: by 2002:a05:6214:5294:b0:921:b6f:e3ca with SMTP id 6a1803df08f44-9213498a6f9mr127926416d6.3.1795307282131;
        Sat, 21 Nov 2026 16:28:02 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:f0ac:1f5e:5039:487])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d2322sm66241886d6.19.2026.11.21.16.28.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 16:28:01 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Allan Siriani <allan@fatecpompeia.edu.br>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
Date: Sat, 21 Nov 2026 19:28:00 -0500
Message-ID: <20261122002800.41569-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120220025.56887-1-allan@fatecpompeia.edu.br>
References: <cover.1795196107.git.jesse.casco@gmail.com> <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com> <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com> <20261120220025.56887-1-allan@fatecpompeia.edu.br>
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

On Fri, Nov 20, 2026 at 07:00:25PM -0300, Allan Siriani wrote:
> I'll drop it if the parent is resolved from the link as in Jesse's 2/2.

Hi Allan, Gjorgji, and Loic,

Allan, my 2/2 mapped CSIDs to VFEs by index, not from the link, so
MSM8916 CSID1 would still fail. v2 drops CSID2 instead, as Gjorgji
suggested on 0/2, and leaves vfe_parent_dev_ops_get() alone, so please
keep your patch.

Loic, every CSID still links to every lite and full VFE today. I can
add a patch to v2 that skips links between lite and full blocks, but I
can only test Glymur. Are they never connected on any of the non-ISPIF
SoCs?

Jesse
