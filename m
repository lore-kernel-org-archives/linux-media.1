Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A02B4B8271
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004699; cv=none; b=TX5HPMAuCW+QmSXqyCEQ3ZuYDVNBAueepAr+OLDwpKJmhEMiMg3YLz3OLg+BlW9PQwed7uKvRW9nl95L/xI76UW7ElZ8tfA0g4XbqcuP0xmwhcecX+E6o+fQ12ZS4BvnIQsQi9wF+BpDxwy9ruUFycZ3WCjesNuf2GjUm9yr8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004699; c=relaxed/simple;
	bh=RarTNDU+cdrtiJCRKIjHK9/KtTW/V+grsr3mpwyd0ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ezOeaEBVuYXfd1jkIP6xKvozKl6tdw5p6i6aY9eKiz6rmiDPDq6aaOSIRGv1p1M97zHkWdL1KpNf0K47Mj9HhaLrrrg8yKoi+2cuByoAidklG3HMd6f5856I2drFjlPD5gc4CS0IOy+MM9QMlEruDfhEGk0Y5xj6Ol70yFsUZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5bZe2+D; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5bZe2+D"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so2407386f8f.1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004695; x=1790609495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2HAjOtO4JT6djVdWHJMgChsjtAACcDgZqmOTkPDDE8=;
        b=F5bZe2+DGIsLh1lWMW+1JoFZoTnTAcAH27fSI1vf6mCua1Ic2x6LPioj8UN6pwF5HF
         zMD18kN6TUMwltjSHvJGfeyTTqIWaU0CPczTBHKjMsWFB6HtdKE4ISSxsgOp3/c5LGji
         K8qFvikXhSbpv0jEjILW6u3JT91y7k8JcHUt9UsEs4px+i32AIAVAS+2/7YyeIc1Ugkl
         IpSvWP9GoWAMoDqEWgWwd4UkIGDN49vId7gkuDl9PF3hvJR4T2LPqG3qN7Gw1DOe1Vnu
         Jp+gSw3b4ozZL8r80b4LHR1kD1bIbmzPA3fcfW5VJpkKm0CBsyYsTZQIcBhFYy1dYoF4
         Uo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004695; x=1790609495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2HAjOtO4JT6djVdWHJMgChsjtAACcDgZqmOTkPDDE8=;
        b=oVQzQv0I0yP5Yf12chQzKybR3ox/OcN1cAhZoukJ5n7wSKkoYxTF4KY5YQwmhuO2BI
         p37caq02MC9LbUwmIngnlSQfqIUieCh4lxE7zkR4t+K22RzmMUmzKhmriaDZcpJFa3n8
         nAqsGpydswzB+j/Uu34Zjc6UfH6+om51X7zP1rxIfdugKNuQMoAeKGZDFv234bfJzRO5
         JnfRR7JpwXbrDrWOXH0zQz9zAPkB4XHAtrYXoXMv0k1maO/TBD14SbadIwIoj4NJt/Hp
         YZaUgB3S7rsql15yVo3QNJAqDPc2xA4YqNc+7+h0ZpCX4OIvEKlzMeuyTpJGylt8EdjW
         V/5w==
X-Gm-Message-State: AFuF++kOl7Gk8ikn/KlTAFp7U/AeFt+glAdrG/UrD36mKw2bGF8Mydzp
	CXynzJT3vA8dW46EpK6gBTkHfSNwajgKQbeTzgg2zKcuVa7k/kOK2LL1
X-Gm-Gg: AYBFou1wp0hSG4UvFY3RXKHv9ZekcVTENWr+j4rSKaBHNBFbGNkP2uWbR+aFjCR+Kul
	wctanFVn3yVjgru8U97w5PNo8nlTpcqHJF4pnQYv2xLUarN0WoZ6YkW0RBveerGI8amKQKaihkb
	eJTI5lNrWgqH5YAG1PEwa3zunEqJBX+wR8yLO2xVCJ+e+jPfkAevPKdULmCjBPNqItKIpd5cQX7
	pHJjR+SlXpgx38RKfqsNu6pWtE+iDzMOw2cxHaFz2Zu2Qxq9hIEoonGV5pDUuNsxX0VCsXE1d7s
	v2c5T428WklZ3i0QetOTrJZ+ypP/Q63wsZlRczFedtjghgIVhGs4v0aACNGYDiCAHyT6IOfz2TD
	gWUx8Sf4RdPGqMDkIni3AcHPRUNVddX5DkLlIG1fHnT0DZuRX8M7KHd+tDDwlg+pZsZ8SOC5CWk
	Wn5s4szKGdK2IbQfX5bSY/750kSOZVH2KFQsdhuncqrFF+fh0IAp8moYqYK6Gok9QPGc3Hk+9f9
	FW2hTzqXFWguXoGE5IzhOS+6iiXSBAwjKe+MQU/zaxrUyeuJCqj1dhOHA==
X-Received: by 2002:a05:6000:260d:b0:488:5d3e:becb with SMTP id ffacd0b85a97d-4885d3ec377mr3423054f8f.39.1790004694794;
        Mon, 21 Sep 2026 08:31:34 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:34 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:59 +0200
Subject: [PATCH v2 3/5] media: rockchip: rkcif: add a callback for the MIPI
 ID_CTRL1 register
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-3-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=2149;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=RarTNDU+cdrtiJCRKIjHK9/KtTW/V+grsr3mpwyd0ak=;
 b=AfnwiBUYc0Iwvv07IbNj4GLcQp3c8H7KT2SE4wJXU/4N3vJJhNOprP36ijMkFaowrAHFyv3c6
 vPvJjApEssmBBjgqwoobVr5BffVD1PUuu8Qebca+Cabc2NfcYXvyCnb
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The contents of the MIPI ID_CTRL1 register differ between variants. The
RK3568 and RK3588 hold the capture size there, while the RK3576 uses it
for the virtual channel and data type filter.

Let each variant provide a callback that builds the register value, in
preparation for the RK3576 support. Variants that do not provide one
keep writing the capture size, so their behavior is unchanged.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 5 ++++-
 drivers/media/platform/rockchip/rkcif/rkcif-common.h       | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index e0acb9049ca1..432f47a1fc23 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -749,7 +749,10 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	if (match_data->mipi_ctrl0)
 		ctrl0 = match_data->mipi_ctrl0(stream, active_out_fmt);
 
-	ctrl1 = RKCIF_XY_COORD(width, height);
+	if (match_data->mipi_ctrl1)
+		ctrl1 = match_data->mipi_ctrl1(stream, active_out_fmt);
+	else
+		ctrl1 = RKCIF_XY_COORD(width, height);
 
 	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
 	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 4d9211ba9bda..f83c8099b78e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -207,6 +207,8 @@ struct rkcif_mipi_match_data {
 	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
 	u32 (*mipi_ctrl0)(struct rkcif_stream *stream,
 			  const struct rkcif_output_fmt *active_out_fmt);
+	u32 (*mipi_ctrl1)(struct rkcif_stream *stream,
+			  const struct rkcif_output_fmt *active_out_fmt);
 	struct {
 		unsigned int offset;
 	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];

-- 
2.43.0

