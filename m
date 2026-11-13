Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586739;
	b=tWQ278Ewj41ucKXQ85aekf5YmDiLilM/PbVZWF6oEm0jpzArDMgVWVr5yy0uILsuzVDD
	 5kiWVmH0x+CklllOxaFpUi1ZN3hp5qJG6Ub7hjC/Op15Q49CrVB57kIcEw2vkDkd1141Y
	 zrqvrimD7Z/tkSzFA9pYU3g9K/Qzd0gZ3Yp4vX6dTnHhkqF6vxagR8KR6NshhCt1Ex0/a
	 KaxrTXEhbQjZnooEKRz4Z4ZZDoID0fsbEa7yvzAXJdulPByPGoaekKaX4rD4cq7VB3Ylj
	 4TJXuLSmPGzU9WQ9u8hy+0wc3JPn3g0JA6tXD10pjTrfk4C2t5rmZAB938XcTxR2rZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=yowbkuWy7Y/E+D5kP8+qxuqk3E25pcTEW/CoidnRbFJaPlQHLmrZPUR6av0upYyRkbhB
	 3zFTR92UrzYPdEib8Ph2LHU3YqighuHVxehOfhs3jUAjIqLFKE0UgBCZcAq6xDQA6Vy1T
	 e0c4qc+Hmr6fRB5fJ43EcPIETUk6e6s4+ndGC2uAX4C0smEzt13vCrGsEroACtPyk4MyD
	 UQXUN/osq5XhKwzPtK3SlKZ5Vd0Y4K3hLV1W4cOmriLyOHE57ghCodPmIyVxPzggvPdyD
	 4QPN7EOqKJ8ujKEKE02b5ipVlm3l+XmTLVpzSGQBGT0864dLZOiLfxy1C5m/v5J2IlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/xZduVu";
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD12D60A3830
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 16:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD12D60A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/xZduVu
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c40f29667e6so273690266b.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586737; x=1795191537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=h/xZduVukTCl98vPuaD9tn7ALCK/+1HewUEzyNcbAZYa8oxWIHIV7r+j1AzG8JkuLH
         28XeWnnMevEHeKDQ6if9gLfnPgBAOLIU67vCQFebQIKpLAZu4B73xIYiKzNL2z/fIgY0
         yh8YQNaq4KfViS8dBltd+isLo9z/hrM9j2BBzBTh138rsni8UF1HYUOIKwEEHxfAl6NN
         sX3tfC9HW06LxyY6oQqc/7jzKHlbOjQLsPYrwUyhgUO0/buG3XT81pNAo+F9ZWqV9Qhk
         ObmZ+/Y7fFhaeI44Isf4MVJVnjLgQUyDpZiDYXU+eevVWUqan2FhVEtfgYVlQVXTUB2U
         hTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586737; x=1795191537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=tkJbzxvdQbn1vLMoboRiHrSUOSJ5b3nvp3mqIbLmJOxrLBz+RujyHdmAlt/E8AKTqP
         H5VL29ReMitXqWK6u/2V+Ur2vEFUU4VZQJN1ABmuOmKbDIAHJgU145TCw+dXpAy2a8TG
         PznWZ2vf8FHXkCLw5ekLbbHUKrlDu//lQJiKDH3iox2NXZouf8wYF3DQlW1oRCp0rM0+
         n6E5GGt3b7VdEs4B2g5RVmwf905d9jXx49OeNpjDRdyE5rNUU5t8RMshmUXxxDLF2K9P
         I1dAYIoU0pQV8lq/g6QE6tFlKdz9yE3rzQYq8gn+gzwDZ82Nzfsy0Nljhf88YRx6HOAK
         1/sQ==
X-Gm-Message-State: APuU4Z+rk3kO/Q/Xe1PS/GlA+ZUB/iOX9gwxylmv6ZeBonv3ZFHZSfyb
	BQSvMvxLNI3jzPYr/LZ1lm37E0Uy+y/l4IqqmbzKIWUHPPD/aMxNRvQu
X-Gm-Gg: AYBFou1bSZwXAaykVZcT7M+pYVmgvzkIO/MHpx77QtpD6NOc6VjxfCOxJ6Por0evfV1
	bMToUXVRMlT4VneA6gtUllmfQG/583J1rHqb4HgpCnHEAunDkyoGUDuBiDTn3tcyv441aHk6Qdk
	Sq6VbdmPlpsYzlVGtdEFI9YRuQfwhrafXUVuTb6IKDfzxB1Ys0q4tGDJfTzNwEuZQ8mH0p/2JCT
	acJztSNAIbr0qXU+A83exr3AmgDhgIZhahzYNWUtsYe0MYjUyFpvKxAqsecwYN8PZMs65neGrP8
	BskhMD6ZTYGogXdWKlxCDjjI21DKbatZ2BpUmUYsIE+liBbif2nMJYtQO7I9s8bHRA4eBVvO794
	9HxIh1S78z9MADewiTc/8uaSwySgMsyJl+FfxxkPS9HjFIB21JVk4TDV07ClIZBbg2Nv8LyjAbD
	/dg03zZhHMXG0edn7jyw2lwUEoQz0r+vgpGGVpaFWFx+J51VLCkO72zKg2ZbbFTcwcH76DvjByd
	MaHlES3hC2ciL2ckjNgfEzoFUc+5zOclkFjbJ8Yr6YUTXLdwzQHLq3HxjHOLNc0tIExSLCdU7DZ
	zY7PbXs7wMPaSUR8zIbiHCFz1Ujg56+byy8kR5IJsLNZPVbG3OdXktNYIPV9fXpV2Oi2t/9zzKG
	y3cwzcOVnCpNDsj8Isy9u8Ab7EPwO0QE=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277155866b.9.1794586737209;
        Fri, 13 Nov 2026 08:18:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 09/10] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Fri, 13 Nov 2026 18:18:18 +0200
Message-ID: <20261113161819.36847-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

