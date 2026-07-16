Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95E340A944
	for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199514; cv=none; b=qdbE/ZyKte3Bfoo2adD+xq+J3bTYdJQFJvfwwese/ySIcSWGgpK6CWDR8Ny5dL8kx0LaORCgdMlkPcOahLQlNkQ4aRyig5w9fjwiIXNJxeOC6AQc/0R56/tUkLlQ0VfSDlDneNEu8pt/R3i8/DMMgDXwaGKp7E1M9OvYpEDaxXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199514; c=relaxed/simple;
	bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMSiynIJ6nXGQpeuFvhpu+j1pOf5vjKQjpjmIkwB/YqU7H5UH24NSRclhQ6DQbkMorHE7tI6ZpEzaliiFGmV7eVTWiaQ+BbIng/1+6VbO7/63prKTvbFr05zmeDunYebaBJdTQEyW43zfUTWBhYYK7FOnir2f1U46IEkXJz0zoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=Aqj16/Ru; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="Aqj16/Ru"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475881b9a4bso2925088f8f.3
        for <linux-media@vger.kernel.org>; Thu, 16 Jul 2026 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1784199511; x=1784804311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=;
        b=Aqj16/RuFpUYLYmVeVOiUJklihsP3GxlGe9NPbjaZxfLeU9eGyCAkKF0xxBb71Pmw4
         KTkYBvXpRiQdFBbKseWN2HQ7AgHpOW7mYghUnC5+Ykw/wDlgIRLr76usj6ATFjwxxqY8
         9XHp9kQZhwDk7GsJIE9IRYc9033TCT450GtO1kWDu3hc3QrpJXQ9gT4Cdx4c1ZzAKtBA
         L6uSKflmK3BakklsQC8eIKbfn5xdsV6d3Bt8FQSRRly+psltiYb9ypLhHEoXuOk0rU8K
         bYmqhId8UA0xMlkLfZG5R4OoB3WKaZUKcM+grB128FD/EKE+SDK/7hya4CX4E+oIpnX1
         EQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199511; x=1784804311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SI9vuvCiLUNTqWd6WlsA3FjVND8EZeQ2hLnq1JM2ocY=;
        b=mqgcQB9kapWvadgRKJBdgM5YOwoHI28mDPGrWMgEvgdbRUhU5/LmNEKKUQJ2ITdTTh
         J4Zat3g6uv1lhSJCoY/EE8JwHs/ea7VQRy/doPPdfhoTP7nfInkKAscgr67M95LfBxBW
         H0VCFQJpX+Sy5+bgLmXMbKy3urf0GSjmcv/z+vKuC8NMEhz6ilRmvVqFE+oNQIAuKvuv
         asp1cVDcwiH4McjAj208V30EU8BUkD+EmEvuxNTAJoSjK1D++wGo06r/Mox2PwFeRrUp
         ZyhaWPiYIv2gSE/k7CMrzJYSq3qsVaDm8uVnkxKUCxo7e+s4XLtBym0+ML20LD5luQpb
         pNGA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1YHjehmJ5NUMRK5nbRA092ELVdY//XCpuUxohGIELL3otmHHEB7SSYdaLwHYoGQ0i4+oWMmFrgsPUAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylTkDnvPtu/ceHEKmSi/TmhUuusVyNF7dwuw9Z8kdLGiKbIouL
	Jr41424KYWZ3wWQPf+/cLr7gqcf7pXWJpnl0tmgAcSMplYU2IawgpRgDydTy3gd/KCND
X-Gm-Gg: AfdE7cmq1lOPHwfoKWRbtZGtzIn5/uzFhW8WsDchewn8TE/QCzZCOsyuFT7fCN3lRr2
	Y7bswwzEpktwGnq+1HqYYvcS8xO0EiY13BvDFwDOi8Pat9AddutP6VzXAbTttEbVGYVfYTqvTs5
	8w30nePu6Pug1aEnnsn+tc/K3o5DeSiSbD+QeH2PBmzfxh6d49wQBgyE4NZaGrHYY1fdBw+NXCq
	vWXVYr7ucTI1TmrFE6oQm180OvkIjYu6hhg4RWxXxgL8Xq6eWSx9hYN3pReAtEkdM1/kLbnIWMf
	iGH7hjYOh31CsQgYU1IIznL2aAmM7Q2tAa/sf2FrlEUIKK5rkP5z/Lj7pQrmVZPLSJJ4xV31x/8
	OPn3SRUKOAchIw1YLmXHtjmfq8aRw0LhUSiIN8POXGJ0f17YbKf8Tayt99RCwqM0HQiVIlQYWRV
	7rATS8sFNJwjAZCViYyYaOBW1zo+uClfIUjcyJ9kBPnLKO/DXcAb4s4UbCnPipmaGQKDhdAR5si
	fDeGE934kTar8zOFguAYATI
X-Received: by 2002:a5d:5f02:0:b0:47d:fc20:f6f9 with SMTP id ffacd0b85a97d-47f2dd2f413mr23607562f8f.45.1784199510924;
        Thu, 16 Jul 2026 03:58:30 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c89e5sm23653113f8f.34.2026.07.16.03.58.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 03:58:30 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: mediatek: vcodec: fix use-after-free in decoder release path
Date: Thu, 16 Jul 2026 12:58:27 +0200
Message-ID: <20260716105827.870-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d4676bc9095c2c1efcd2c0f5ff4559bac7d1e47b.camel@ndufresne.ca>
References: <d4676bc9095c2c1efcd2c0f5ff4559bac7d1e47b.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yup, just double-checked. Please drop this one, thanks.

-Doruk
