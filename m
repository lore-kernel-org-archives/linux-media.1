Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880124;
	b=Xrx/Qu4jf5CkShI6WbrT5dJSqpe10t2okapB5XnC56RUyZ27CC4OPSHM8Ef8sclSLd1H
	 IdQmqzGOgUPE1MQrWFEMkt8LFrP6EcqaDz6A8WEpg2rUIidFFQ2FjvrajrDvkQ8FX7JlT
	 0wBt0lHdfm1mJsTzD3XRJmnltSiacF7YQX0xPz3gvRGEnN19k7aCkYUlXp/hM8FSgf0sg
	 OpUmN0t29GrMMxKKWEJme7vijkDAASaXcpqNlScCewGNaTZm3/h6r4bU4VWSkh1K90Tox
	 BCxtTLY+9V21I8ZSGzJR9GNCRtiCIJOmud60jLGLDRbl4LtQSl2x1jHFasadBp5GvYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
	b=qhCvFX8CqpSLYv0LwMdS9AR5eaHdWpEN12FF2uaq3OuHcExGj3SrOVYgew/Ds/p5dmPb
	 UrrZJh9Pc47faypzX2LuorbGqr9OeGwpECYLkEkynYGhaWJnpnXyja/BdCUGH+zbFxri4
	 EusAA/HvnYvPs/VtK1WsgT6CLuAZs7SrN7CSKUb0N9IsbRw8MBxPCQIKgU11ZaoKFqg4D
	 j5xTYEGncYzH6DENFAhcxE/HQBCpue+yXA3oBr7KVA+Q+RvLzrrIsCDTUFq6Mgbfyg6QX
	 h9SW5o4QXJZiyFSWHbu7m65ov13TkLxnapJx6Q9fyOfMs/qly8MZMw04oZNMOfm0new==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4J8m92;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46737606A31C
	for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 15:35:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46737606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vh4J8m92
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so114987205e9.1
        for <linux-media@vger.kernel.org>; Sat, 28 Nov 2026 07:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795880121; x=1796484921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
        b=Vh4J8m92U7pP028aM2/ISZUVuC6lkE0oxMFU/ttDkTeIF39KQQOVkmRlKUN9UJ/HC/
         5U/+ebFAJYFlrzl5gO/9m6Zygrh5sxjNrl2NtUuJ6jicRrXR1xSnEwc83rk+Mq8esNaD
         WSMN/3RZAZjeHZJh3SIY86NR3z7AmpCM16Wf0xuxpBdHnQWy7MAbRKmchEOvS3mS3JHS
         Bs4yZc/DfKotbJoNOBcIEpqt2YiPfM7cRJdE4I3gO5HmUusseoxXV7qjmsoPaF/BG4bg
         9cCr7q3DfFbrqEOuojDpCfotukqd5Gnas0/L90dl3vdUWv9ysGe/4nDnV32mAdBo7C7z
         Kfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795880121; x=1796484921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OPDZCl80ucoRcFw+rfeWFDnofPgw+y6THl/lFgLOQIE=;
        b=LXJk9M9Hb078QNN3QFdIJAPhd//I0evDu9ykMBEa+WjkGlJN4todfHkZvr5v5PB/ub
         5BjAVBeo1vcuvkC3pHrp6hb3XaAmda983svbXzllKxOEXIVVgRWYl+lllOsmMctHCFmc
         hILIPNzFho/8gD2Fp1QDZM/TIafWDynJTMinbbf+AtPUDkDvGZlcQPVaHaWmpEPMGV+M
         R7L+dgfZtei3EQ97V8VrRS02pEI+F8+YGpwcqS5rH8xQqeGiNwVqIXRnhWROMkq5TuGp
         7X+mE4fBiJBM4X4HTFkRjFiDUGFNz+uL5MI+Z0BNnSvwThv/9cxlgMoMI8mU1nepfsoW
         ExlQ==
X-Forwarded-Encrypted: i=1; AL+hErE9tkmjdibeQ6kz/7YLEnN06aHOTsscYmRsCqQtwiVmhhSt8D+S2J0P1Db/zC+emhOwX/2GoB2AC8F/vA==@vger.kernel.org
X-Gm-Message-State: APuU4Z84/4K7/FUEkudaM0bBKtNdorFcZUVWOeq1ioicQyDsGSh4WAa4
	ZG0wrE25VsBo1aIc6Z70y18nZ5wb97ebpRyJjFXakVZ5AZrwfZJ1US+2
X-Gm-Gg: AZFdTZfLmttzQMdgt/alwhddumB2xqwlbmhHOIvzlywMoKWNkVxW7J0TIxGpFqCQae9
	mt9c8rFW6ZOOiCX6nkhdRvFFRSEXL88a4LAhB03ahYQ1EDqIf06bsLFfppzVtdkZCE5+bVuEwt8
	63t5k85AVX9Df+uBx1SsM46Te1Te86y4vLbQpQv5A+MEf8pt3h0/K6yhExdReNvOKLfkXmR8MTZ
	RGDXxMqAEuSYX2o7S+zFum87FV4g614ziPvF0ZV2A7hBV8tnGCmvtVYJ96TnKwJ+Gq8ktSokyPQ
	X7Ge4WEnw6CW7faUJ5ABtlWvUesFbiMsszN1Gr+jzVV61l9s6/pKNDW0mUI3z3wVRVRW9Q5byCE
	nu/UURI6siW5gqpNzx3H+/yjSGLeoYAEIy02DIx9YRCREyTm3vSf9VjQ7V8fbNMrPhLncb6fvRW
	iqhEZIHraaFeQaEviVy815RZVIFh050hyzQfGr3oEQeIpMJe/yOoNwEccA6owRoHwmYByCx1Xw4
	B9/EqF2yY3LdKeGJ4kmxXrRmHLRFIlN8jbQj8TIm7hRuzdjdk/mCDg6/ttooCe6kfIYhJ1rBeD9
	hh4efbha38MgCN8PEex8kR3YtRgyTU4n+TovFXl7
X-Received: by 2002:a05:600c:4e0b:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4bb887fb66cmr593468135e9.5.1795880121168;
        Sat, 28 Nov 2026 07:35:21 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm561359015e9.4.2026.11.28.07.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 07:35:20 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Sat, 28 Nov 2026 16:34:57 +0100
Subject: [PATCH 1/4] mfd: tps6586x: Leave warm and soft restarts to other
 handlers
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-t20-soft-reset-v1-1-0db458c5996b@gmail.com>
References: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
In-Reply-To: <20261128-t20-soft-reset-v1-0-0db458c5996b@gmail.com>
To: Lee Jones <lee@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: mfd@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Thierry Reding <treding@nvidia.com>, linux-media@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=FHhG5PpLJ8sBoWRAgEyavLjNn+Vpbum5Z4mXHlUvn24=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbXl63uaa5fTqyS9o1cHizZdj2/KkBUbtHh5O+VJ/w+l
 RQndSZ2lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgIm0zWH4Z3+xP7ZLvNYjSYDr
 zGJjjnPXr+lbHvVrZeWKepPeKMCSzfDPZrZktCcHe0KJy4/bjx69L58vn2f8V6Cl+LHj3OU1Ndl
 MAA==
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The restart handler resets the PMIC, which power cycles the whole
system, including RAM, so a ramoops/pstore log of a crash doesn't
survive the restart. Its priority is above that of the Tegra PMC
restart handler, which resets the SoC and keeps the RAM contents, so the
PMIC handler is always used.

Let the reboot mode select between them: return without resetting the
PMIC for warm and soft restarts, so the next handler performs them.
Cold restarts, the default, keep using the PMIC.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/mfd/tps6586x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index f524bbdc8f3b..a92a88ac987d 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -480,6 +480,9 @@ static int tps6586x_restart_handler(struct sys_off_data *data)
 {
 	int ret;
 
+	if (data->mode == REBOOT_WARM || data->mode == REBOOT_SOFT)
+		return NOTIFY_DONE;
+
 	/* Put the PMIC into hard reboot state. This takes at least 20ms. */
 	ret = tps6586x_set_bits(data->dev, TPS6586X_SUPPLYENE, SOFT_RST_BIT);
 	if (ret)

-- 
2.56.1

