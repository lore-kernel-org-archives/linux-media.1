Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218916;
	b=to7Qj8j2JV2nvhQtR7b6Y1F8A71KHPoqr3QDK0SmDn7rPD/mLGZZU61DClUxc9c0gOW+
	 7RVE83QbuAFn2QFiCrWjTQxF83RB/Qdb3RMBRRpUi/5o5rrTLLc9NPVEmsm8QrnYgIxg6
	 BcNRWeLR2Hq9tdo5HTw4vjN6n/esN94OqGS6cnaBnbnWE10b4mhqpO9YVvbz6q/Rmh4w/
	 9sQc1OE2DcQNy1rpIaxk3OlwNG56WxdBWIjxURo84E2Ox1eYnd6L8TX5kHNh9p8mu32Y4
	 0eGhICU3KsUais2UuJ2rzmBMz/atzWtZ2lcmlVKkueJne/0I+Y0P2SAYz429jfF3dMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CVBcvs4NEZacI32sTy9QLmqQIro1hPd0gzRPGIIodS8=;
	b=e6YBCOEt7BGZFuZPfRKkHUOt20Fga+AxWaKhd0T1707r5TPUxEEekbiwapAxJ19Boltx
	 rA++LJTx6abXQ+vLvnMAQ2/SNM019iwbl/hV8gaG7UWCB8rqlMEpxwkGmruMmdHW+P0SQ
	 b80gpYfA+6C++fdI2MtIxW1FYtL8h/g2ekSuMrocj+rJvaqjmtUqZBA/a3N617k/atdmN
	 Xm/5lxQfYjiSw7qKKSUfd/4YhWLJgCahthdLpfYHd7YK3KrKx4WW8aB/mIWx0EtlH8vxN
	 K27wj0fDLQ3m7uP7/ZJ+6JThsOT/tGsAyN8TCxk7ZtsmuaxLZo3m9u3E5E2D1Pv8H1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lzvQDMQj;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A5C606A6AF
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A5C606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lzvQDMQj
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91ebf4cd218so9187416d6.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218914; x=1795823714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVBcvs4NEZacI32sTy9QLmqQIro1hPd0gzRPGIIodS8=;
        b=lzvQDMQjTaKlnOvN0osh10u1dCW92+LFSqAhxHVdlifH6CkeHuho3jdMSdRsiLbwaV
         wX08o7Synjp0sr8A48cvdstOBuLGx7U9GHSjHL3E7c6dnT2uw67geq3t0vUjj5LyJ6Tp
         JE1wUyiIep79eGRURxu8A3Rg5rGw+/KEhyd6VM83IQUrbleNhg6k0DH7avYXJE24l41I
         WZP2bDd0+qWRwFbh7w+bs7kPffriV3a3vuLlqTNxf3gzTDm73zoYzZZa0AbHfFwFhhqm
         srZB2N2OPmbT0nC1jIeahzHzGPKfvnnmy1rgv5Ux0Xay4mo7TF3Q1RoanWoX84SMSypW
         YwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218914; x=1795823714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVBcvs4NEZacI32sTy9QLmqQIro1hPd0gzRPGIIodS8=;
        b=Wl93sMvRj+JcEmBaUikewegjGwUjVoF9FwoqvSUswsu+/gMCEnWvtfEWZjo2eabC9s
         yJ73nvgREfi91O53N8Oni6ngjADhTSTWJeoH6ggnTrpCbDYjEUlXpJThLT6PVk6CTXHF
         NpPBr9WzNBb/QgpzgY+FP37zvLszW4Wd0ACOw1A4nx77G8HKqR3T6N7oyH3wJG0sxi/+
         2161MBQdY7ppYU59HhlzVYVAvc9dBoI8SiA89Fr2CqM+ELCYOK4Pg2rMkzopv5PHh8QR
         MPpM/iHUlKnxxeGtPAjA1EhjI9Q6XVGMNH7+kpjQeWqk1kp3nWPts9NrgMiZX7WAz+ak
         mhUw==
X-Forwarded-Encrypted: i=1; AL+hErFZ2Tt1+DeHt5ZMfC0Kvt9We6U2wrHmaoFAtlcHhst0QIpcjklvQrD8ERh/hNYc7GfavHoL9gXAo3rljw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9i7848xCSFi/FUKDHVBZBajmgnURJmKORGbcOPSqwwOIyYANAf
	Y2wY4tuLy1yoqPhqv7QUU1EVc8g0m0IMrMFH+ipcHj8Nob/9Vc+omYAc
X-Gm-Gg: AZFdTZd8wMwOQewd/jgYPjYnM+ZxiaPMQji6xuKO4rco5nWXGeA5m1b0tGIgpXYlfVf
	EzlWBb00TjQCYDrq299y8GNvio7NUZx9fEVOm6PFxbZNfbaQ7DO5H42PCzybc2NLrPiS4+kb+lv
	T9s/bkFylj9QFdKt4Zhc1pk0MczMSLjBW8mpnZRhLzZn2XeHI8Ibw8U+h496+LidHMRLLTYhO6K
	kxVSmgDp0qZavflmajgOG+ankF61VASeIycowAWHGO1b7GldgWJBqbVlV07p61gQ3sK/ILhRc1h
	zwnY9bJ4rUHqan0sSlGNINKbcGyj1OLU2ojBMl43sQhwNV70fjneIUaw2lfXApd0rnxoMRO4op7
	+Vm0Ssu7y95eeV7+2RBGwid5PRxvonaJ+mMcp08Jw3V7JmsbiOAhpgNU7tXv+bltqiILqr3Wfo+
	jak1MewsOtpDvmK6r/M3iEIJd3K99903LByR9XCzB+08pYSnnrlLUlrYl2OCp69ej+uOLEGAhRR
	PpTvzRsXESGX5LoIA7x/Ry00XIh32Jbj6c2bPzpowsI4W6eVLC5S+sOaeZ9+ZUp5WvlhEX+zpbN
	c8yV5KYd+Ju3kJrofCk6Ej8qeFoB6KbmGVDqAELOjCLcgtpyoQgF1I5hXDnXtPxu5nKvpRAfo8T
	KhdfCyEH3hHnYLA0hkNvN7AuQQB+ZQKgm7T2QyrW68Wu26b25QJVPdkzegCJG0Yjomu+rmVM7Jf
	y8MFmIvijTRR6WIsWjwCu+UIzs5aQ9yh9l6rHiWvm3vOT8cofmAYaEBviCaLfKSk63/3CXKvZbF
	90nN7ZvnSDmsX/+KNNJr+trCq2TlPa3/DthHBJcw6XHYQ==
X-Received: by 2002:a05:6214:528a:b0:91e:c00c:b7b with SMTP id 6a1803df08f44-92134b28841mr78465516d6.48.1795218914174;
        Fri, 20 Nov 2026 15:55:14 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f8c34sm39973856d6.32.2026.11.20.15.55.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 15:55:13 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/2] media: qcom: camss: Fix the X1E80100 lite CSID paths
Date: Fri, 20 Nov 2026 18:55:12 -0500
Message-ID: <20261120235512.1230-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <5485aa11-386e-4648-b27f-f4090bf90d66@oss.qualcomm.com>
References: <cover.1795196107.git.jesse.casco@gmail.com> <5485aa11-386e-4648-b27f-f4090bf90d66@oss.qualcomm.com>
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

On 11/20/2026 10:01 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Just to note that my opinion is that CSID2 shall be removed from the
> resources since can not be used as of today. But others may share
> different opinion.

Hi Gjorgji,

Agreed, I'll drop CSID2 in v2. That also makes CSID n -> VFE n hold
again on X1E80100.

Jesse
