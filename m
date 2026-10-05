Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61A2370D7C
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190439; cv=none; b=TyfgboT2QIdCsS1o+nI4prZrdHq/3stFtlOEjcuq8OvPieEu6MInV7vZaWIw9yVUrv9u4nw7pg1X6rauKm/7ut/cCzhjUnrgjMQ5LOWeR7aoCzWkdNxMzqP9d+gK5VHESRxheFv8tvifl7NWZAOSjxb9ckBCXQNx1OeaaoqeUWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190439; c=relaxed/simple;
	bh=pYKbb9UXC1JXT2n3550Q9wl1CVm2XMWNl38H+mqjS84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FUooaWVr7wVBFuqryuYlt3QzDO0mtEPfCDz5WM4V5rIIpj68dDh0XhbDk3zFYbJbsdLIZjGI34zjNHXetvBCNkoM+TnW44NThRuKqIgNTwUp7ALbB0GMIEt57D7K6zaNWRocNpF1xuHcU/OAMyHK5qALZcButmgnRbJkvdm3N6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFJjMdD8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFJjMdD8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso1224922f8f.3
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791190436; x=1791795236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYKbb9UXC1JXT2n3550Q9wl1CVm2XMWNl38H+mqjS84=;
        b=kFJjMdD8Hw0TiGl9zBCi2ImEG5r24eryk3O6hdBzUvwwMuf6a/4LxKk7e3EKO7o8q3
         aY8b2SLbDmc8BQyo+mtdAvkGn42wQLt+fTUg4w/JnvwUZUpwLHydtO+EyyQm8IUKz5zk
         O7pC2G2QoK4lCnSiuXxrmgBGH+cpEQo5E38RfdxzlH8rGa+h9/v5krCL8FEUZ0O3Uy5O
         ZEzKv2bBWyybuYjMBlxIpDRjbhR1v2V3otoxu2FsBC/45xgvuOiCH2P6hmzjfnTpKHPb
         LRIdmN2HwLthXK4k53TjxJH6nBL+Rbb0v4o0ByxZyJVeO/8db/vshhAXnJGt2THa11w8
         aB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190436; x=1791795236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYKbb9UXC1JXT2n3550Q9wl1CVm2XMWNl38H+mqjS84=;
        b=fG+fcXL+Or4X0flPyHurEkwgHFnOxYWtKb1C3hyLvw9zHQlUDMvk9qH3Pg2BuJkKMj
         GPBdpmWPZM5CZLTAu49gDJXPkXLdOQqdalTPyvPdtv16Maoq4ge/X8Yd1SX24hdtfGlT
         tkzl4pGv2+v3AjlJLK7qCm8E2s78dcpdDDp7KKwUABFEkF/TLMP8aNoMaaCb2Rt5WQXL
         3eSwNs2xshtvnJkyLHn03OIDGsinN7SJxzInigdI5HltCbFUx0+HAT/nmUzekV9zRYJ5
         NU/slZ2z+4Q39gCprSAd+oAkkZ5qF3ooZke00czvyndrMrtmJ2thQJleUOVZ6ck5yDLF
         s8ig==
X-Forwarded-Encrypted: i=1; AKwUvBwvOBbb3cxwvtVgpmh0bdXBhVctsHP1Qr/AjWxPiqDLvB7JWaFw32btE8+5eVhk6pLyAIE+B6zFPl21cg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKFcUPtPUdMtMSlyTLcpjNHwuiNiPMgP6mxpuN0So13DpDP1VlN
	kpsiQuAmF+yReREMltu6QgBijSHzkfomV7p4LbNd82t+LXQ3PamXaJh1BL44FJyv
X-Gm-Gg: AYBFou2ZyDBr+UNQZy3cfmQ3MTaDc2meLcJxzi6B9BbzUNn3cwGRIUTZdsOtXFTAogB
	Oe9DCQjnFr1jxYEvhymvFbPwvFCBi+dcLMDhlIunA5TCencGK777tW/QhUiqpW3wrIL0LATyMEF
	WZnK4AJAqXR7K7B9BACC+lJkz1Fwwg9e5GQnQgMTdTRoxHBOBgefiX9OTBwMi47xSbge/FjARuF
	BiBn6id07+BYToJbuNj5/IZ5m1S1kcNVSJnJIi/CqoYBv1fa5LBuTHWkDklJSNmqRbgZ85jXoae
	x85AMtj+ceJgxt9G1EqK0QdVe1gkJ9FXoJQHM7jz0URObCiOZZtFHjbK94jznuZQs+dB8RlUlfk
	Kju07vWmsrtK8R97jAnbeaUyIogsrLhbq2gZSTFHmxPcvnWQmhXCgYlXIA79gkUQqepby0oZVa2
	EGqDqwjzm/2wwlQpENm7Ad/bZl1q2F0ZsLUA1yHh83GmTO9xZazD7nTeCtJ930LYeWgMqdD4tyl
	lLEyw==
X-Received: by 2002:a05:6000:200e:b0:488:8411:1d08 with SMTP id ffacd0b85a97d-48c4801c7f9mr10007975f8f.48.1791190435824;
        Mon, 05 Oct 2026 01:53:55 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48c6228d716sm2371333f8f.24.2026.10.05.01.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:53:55 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Pierre Pinon <pierre@pinon1.fr>
Cc: hansg@kernel.org,
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] media: i2c: ov08x40: Implement get_selection
Date: Mon,  5 Oct 2026 10:53:46 +0200
Message-ID: <179119035557.32442.16855854917692483516@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005081529.45697-1-pierre@pinon1.fr>
References: <20261005081529.45697-1-pierre@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Oct 05, 2026, Pierre Pinon wrote:
> With your Yoga feeding the sensor into CAMSS, I assume there is no such
> vision chip in between, which would explain why the mode works there.
> Is that right?

Yes, as far as I can tell. The sensor sits on a CCI bus and its two
lanes go straight to CSIPHY4 of CAMSS, nothing in between. The binned
1928x1088 mode streams fine here and is what a 1080p request ends up
using.

Oleg
