Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794537686;
	b=CgWx78EqVDeg5zx+j4/ji8jIVGHYbBb5FeDizLeKfcpfPNbs5rrdH/gLuRrEoKndr9xh
	 qwcDa62JWaT6N9LUENhFZ78bymhKfbWimZoMHc74ebKWqF+Ivh+fEyxNNnKNxpuRfk5or
	 lLKkBAMdoRrMPs6KOFbpYhf2iN3goacavWtbQsBROa2liUeWkktDKHXbquDHq1bQXvTQ5
	 dElqQ6pri6XsEuyacncHxL8T6IpIfdvKHmlJejHzMjMXCt7j4JMhoc8wN/io0XhrD+kJo
	 qoNdnWNTUNtXlLSoyCoqiz4cbKMtYd8d11b1/RgSg5TwbzHZY4uCbZKKTUWqMoMtLZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794537686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
	b=qMSHBMg15Q0L/+wd3SnaJTjQNnMon3WNHUcj7kAQ6LP6r/N92p2Lbd52IZmfMsc6u69y
	 3MQJm+zBqXMOGCg3Iw4LKLgAJ1MJrKfaq7pQ+tMpF2Vtji756IZrnra4jP/BCx5sxwNJj
	 P9VKOUdIJFWb9MVm+l0CKfJGF7LYMQBcxzHwhL6FhD8ituhd+nNS8swGfqQBow9IXE1P/
	 rtPHxGiIFZBEyX2r9c6tp95w5jtHw+L3ig3dUfkfxjwp9cKvtsV1xDpV02nUSUv1SyIqb
	 Pz8kGaN+Wob/ZK0VvLiiGd4zLeQS4MfJ0rPt8o+ErOKED0YMcs1NVdOyGhYgX/vPbeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVbRKYny;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F3D606A33E
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F3D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dVbRKYny
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33c10faf6easo68455eec.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537685; x=1795142485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
        b=dVbRKYnyths2fZT4KghoNuIZOk83gcvy+dZ4HKzIuJHMXqGsWPzgfd5VY6D57x8XSQ
         8Ya0/TtG2vOCmHl7xfWCnhisaRtw89LNcAiqwEPKf822/54psw7oKXoNlEo9ve1Wxf2/
         +1i9XFp00WZYzvsfmAFgurlxG0oLGfKrgyWtULtMcpYUYLTLB14LEQLRatF8p+9dk27R
         d+jjbx46twJuwdv3P1z9MMJtc8ULK4fRwXuA1hmJq+EAZjTt46M1i8mv5umyveZvfJTD
         157xu8biLDMiDh91jfYqjaFrSZ/W+fucYNmp60SSbzkXdWKhQy9M1tRELHhUvNcUKR1l
         Jn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537685; x=1795142485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1umUU6E6aYyeT1k/Gpsp+FhAOaMvQ+4/dxDpS4M7kSE=;
        b=PU6/4Df26BEk3AOLwWk1d6KZYaZAS3zIeJtVns2u+Rj+m1qRrXg0WFoMTlNyuCi+dS
         RsYpsvkL5otJP3iXeQHW9dOtlUZHRDzYdVCR7LDcq7Q0ONtASPqGWchsBYREHnkTu68O
         0OICGKrY6iu8WIQsxN/0eeGcrned9et/djdqmf82a+gGus+werbgaZRVP2E2k2ngw5dj
         Y++KU4WYL4VdMgNMLHkJqNlag7Z1MlhEQXeO6WW1+aWYYbhsw6Go0MYW4xjgw3ejbIML
         3OPtB5Cuqy1qPXb7+FFEI+lcYI9gUJSvncm7ofbnIt7sxdlCXPP13jIMvUbegR5eschL
         xrpg==
X-Gm-Message-State: APuU4Z+eNVNn83QqZn8pg/yh/jCOSNGSbHuM3XVwrd7XUV/0AYVOPzAu
	WVGhe30b4zoP6cFYg3Ztu6txk+gQPkAkWI9WO812ihudSUQqWyNLdSl4QJtDKk1RZFNeiZSm
X-Gm-Gg: AYBFou2pM3FR8bXRymJ3TiYr8TucdFyyzJuCzi2C4w3RKI9wFPrd6GKJg4bYEvYlbwI
	uUhftnD7VkHvwnIzH9yoYAmrbJQX0ieqo0BFx3geolzM0Qtxm8FJgCBB00RB+alNPzGn6pLcFZT
	6FrQzSTEu17ASXdO5ePtE5pVLTqaZ6wgeSNDzYjnyncSDXIfJYb6KjLYZPOlDJVSnN6rOj9DUXh
	s61gLmvfoiglNnUIax6XxzkUvcgLsac+xphtHPq5E4BvJ2tzHo+GY0dllDHT1CDF35ywXaM7WTq
	h7pdRiBoWE/Pie85HchMlc+I/XyxiiZTjFVQmYEvdsjQOIQQ3uR7x6NQLn1DxOz7TSo5eGGDvh7
	vVoW1Emh06RLC23N4gGCk9w+dUvGW2gvz6zm1yjU5++ofeWMR9IKpRUHmMfn7evgHs1uBmTuiKd
	ixY4R0jWv32ly+QUJPc1+BhThKrbT78TVinVXK4UqKiG3Ejbrhm1Fc9vm7UUbh3dH/+NXoLhRYS
	LaXsI62w/CMzl2ykyTjps6GP6Ztc9NOknEvPjeQDQsx85P9p+5HqpIQbF3aSyAQ8N9IN5XK0gsg
	AOJE2jQ6/j4Yfdwx8XOOYSZmvxfPeff1X/r9MnAnJa9Nbg6NSf1l5zdcbyXFWk/4jL2a1vpcqvl
	0SRlTzat04MMnWyyaK4ouvh4/ghns7rjMTerJbNtLJbbYGsThr6ShpgjsskXqoaOmvcGDwMjJas
	Le6GfhS/+oE2C0WhSP+vmhUNGla0HlG48=
X-Received: by 2002:a05:693c:8204:b0:372:c0ee:875b with SMTP id 5a478bee46e88-3796057b529mr1566710eec.0.1794537685511;
        Thu, 12 Nov 2026 18:41:25 -0800 (PST)
Received: from esteban.tail1178e6.ts.net ([240b:c020:623:52c6::44d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d07b3sm2334704eec.22.2026.11.12.18.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:41:25 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 2/9] media: i2c: ov7251: Fix link frequency index
Date: Fri, 13 Nov 2026 11:40:52 +0900
Message-ID: <20261113024059.1087031-3-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
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

ov7251_check_hwcfg() stores i, the index into the firmware's
link_frequencies array, in link_freq_idx, which the driver then uses to
index its own link_freq[], pixel_rates[] and pll1[] tables. The matching
driver entry is j. Store j.

Observed on a Surface Book 2, where ipu-bridge lists one link frequency,
319.2 MHz, which is link_freq[1]: V4L2_CID_LINK_FREQ reads 240000000,
and the pixel rate and PLL registers are off the same way.

The 319.2 MHz table this selects ran its PLL outside the datasheet
range until the previous patch, so do not apply this fix without it.

Fixes: cc125aaa5a78 ("media: i2c: Provide ov7251_check_hwcfg()")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/i2c/ov7251.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index f429de5f1f7c..1f30a01c85b3 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1523,7 +1523,7 @@ static int ov7251_check_hwcfg(struct ov7251 *ov7251)
 		goto out_free_bus_cfg;
 	}
 
-	ov7251->link_freq_idx = i;
+	ov7251->link_freq_idx = j;
 
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.56.0

