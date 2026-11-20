Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212035;
	b=2Ql0rtF3ATlO0l9zIHgttpSysXScJp+qwdk848k8xFWi5l0PmRNJv+hQGtxqeRWyfL57
	 w5JgvJb1ZwasUwAMZEyV7Fu4+LyrnjpxZ3TUD6m6D3L3dLO30q8fVWfaP56oaRuzuT90G
	 YPUcgWmNomKh73cOmGnkCLZPvUrndVErArgoHyhkdyewqP4+wkSUKStjAdkym7em3KsZD
	 FRt4jb3iE9tprePQasP8H23Kvsm34En7VhW00pLDWCB9KRoc8vtOs7tiCKB5b5NjmVYXz
	 8E/yWX1lxHbgh38NWXz3LImA1fytRtyghS4MyW7i5tAZ0tdM+FcmMPJVirXYg2Ldrog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2xDPC6qU1uwq+PJaTb5Go3aqyR32791c6Eohq6KP4zc=;
	b=oD4yV3OPhlQBrSKlWrqHAoJ/j/6ZDqOIBmxP7Yfi79caznPksvIx8l1nyO/sw2QOJN8B
	 mn1enGIs2ZDjwVfMuB5y6DALMmsWwyonRyv47IldLAosJLy2XgzOlbaGEgsweA2LlkjNj
	 pgZYjGEP1EL3ZNpg7qlwDagHYyZLNTnpYma/HeTMIFxLJgR70QIMb0VJY11N+bcEkXTsj
	 eLKB+AQYOgIqpRSWviV9GxbHAUrDbFw54Tjz3KpuLb54To0tPAbI6g37M/4VtoClxsgSC
	 eRVGpzKXOZh0YdjnRWwuYi7eGjZ6eha9E7Mx0nU/9XuSBb4jWrriGvcJMlNfjoziBmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CFGSxRTa;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4FA606A6B3
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 22:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4FA606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CFGSxRTa
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc81984fceso557652137.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 14:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1795212033; x=1795816833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xDPC6qU1uwq+PJaTb5Go3aqyR32791c6Eohq6KP4zc=;
        b=CFGSxRTa6bXs2QsYxgQ5v5d73J8Lj+epxBHOHXX2mlDR7UWb4MxwQ5Bm1Pr7vzdrwh
         r8USXI5bJ+m7mAwuDd1B5apByZPbv5TxAApGDoJcZyE6XihUvV8Ok3s8poJO6FJSznlk
         0Y2S3Nw1+LUcDT/xigP5IqjMkya5XQmdJNer8Ry7ph2qGx2p7PHSbRfVb2c0lJfxBSgY
         yUosia0gElcX1WJ3sO67PttycNQBvwtTqGzyWL7w8N+GQX3mpIDDGSGjSKvm0Me9P3eM
         NS16tg+468SMAoWp3Xi6mifOowze35Xbii2XDYmvxmnBOjoBv7RR3hGpcpvqkUNzesj6
         B3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212033; x=1795816833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xDPC6qU1uwq+PJaTb5Go3aqyR32791c6Eohq6KP4zc=;
        b=lCN4ERqyjbSm76UcEV8ACLEVpbz+N0uzV/nCPab0DacLVx36tWaAReM26OiERl3cKw
         NPwbEy6Injr1KxwPe02ggl3/UpZwl02yGmjhg1jZcu4s25l0k14a1NnMX5rp03aedJsZ
         VhyM/e/uAjtMijFnk2Nj9tITi7FDjdekVGC5V7wMcBV3WU3OzXjsfP31Q5/lEuwSL9/z
         pwgqXbSU8WowrwX5h7kLQ4hzuYqqwplcctYYZlMsG4ih5Lk+3XmH8RgoAoxhI7AG0Zgo
         DEtOsvADdjqfFg2a2hmbugcI8yL0V4Ghsbi8DLZTCnWFjxiz1yz0CPTvTrQHXa1Fqave
         jkew==
X-Forwarded-Encrypted: i=1; AL+hErFM6PEZ+OC71RaJYdXt3pfRV/bnee2hp1ajWGmtpFxf7TdpXHp+A8xT/Safo93vffPpymRpBdQ7rJ8voQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z99naq7+OHwiI9uhTmjlTWohcSTIiTpxgGjGnuPCHglEoYp6t+T
	NAuXg0eDeuCeR/qL9pLeQmcOhW1ecFCw0bCLLrGD2gePHlMss8Jso1FDzDWpwTMsf7E=
X-Gm-Gg: AZFdTZdkVN/qxWxqyfiQJLTnF7capMsKktMhppI/r/69S52/TGNnp8hN2je+omONq6l
	J5NY9IKmKoTDGug/IK54QMWhT+BhoK9E4vQe1NyvrmY+ucFg4GO6NGO6Phd1h0CLKhUHPujr/pC
	TyHA/Lb4uN+heYT+9hW4+RDfjU5VH3cbQv0iNdA8bCLdPgATRrRZoZfF/+VsiTBMjWcGK1xppbB
	U0tcvCZO/Ebo/eRopUJ4BkqNxGWoigicGRY2y3DWEX7iYgtx1FStfYniUu8VdS+/uipmYrmINmi
	8PzL9lcb9rDew9GuCGgLV2kvKTePOgmiLpEL+WPydv7C7gXVOr/5ADgM5d1ItdJLIz7lPYFaPpC
	U92amAtOOslOLZpv4IkQanFodgKQNwgMfdDpzsUavvZqErsPHaPy4pxPSuaGmiTNgNhv8NGWOvv
	YXxdQqRhFXSjfgcML2h6MOf/YQJnX8e50UgLBd0kiYUMbdkVZDCNKcc/ef0mgGfJSBG95Mo/JQb
	EA3mZ2KhYDxWc7zkkLNIRyJhdZHp1nLNiJH3tfbJ6/HGdVIhQOkW5vhK6KyprWx5sKZ0EoXaXRT
	uRMf91zIsxQq9rO7hMK5HJKDdq1Xxrplhf5AsL6FkTq4VfBbKDGrVitv0OPAQ22fEaM=
X-Received: by 2002:a05:6102:5cca:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7d7393a114amr1838341137.6.1795212032547;
        Fri, 20 Nov 2026 14:00:32 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac1:1120:3bd0::422:8])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0a2865sm4180139241.12.2026.11.20.14.00.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 14:00:32 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Jesse Casco <jesse.casco@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
Date: Fri, 20 Nov 2026 19:00:25 -0300
Message-Id: <20261120220025.56887-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com>
References: <cover.1795196107.git.jesse.casco@gmail.com> <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com> <331d37b0-eea3-40b1-9a27-9a33cc756949@oss.qualcomm.com>
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

On 11/20/2026 9:51 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Maybe csid resources should contain the parent device index as well.

That doesn't work on the ISPIF based SoCs: MSM8916/MSM8226 have two
CSIDs and one VFE, and the ISPIF routes either CSID to VFE0. The parent
has to come from the media link. CSID1 currently fails with -EINVAL in
vfe_parent_dev_ops_get() (no VFE1); minimal fix:

https://lore.kernel.org/r/20261111135338.27008-5-allan@fatecpompeia.edu.br

I'll drop it if the parent is resolved from the link as in Jesse's 2/2.

Allan
