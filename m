Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739276;
	b=alZyIBNAl+dgeU8wja67jnhQQrTQpaKjEaoon3V6Gc2AreN+oag6M4PnAFecdV33rKtN
	 lNpbCP8GMsA+Z0J/ttS1P9YkEQVnYUnn0X1Qy2wPws6P82MnXDDn/Iq99+6iEE75BgO3S
	 hT8spnxCYaUA3HUMcr2XDxMrXEri79lpY1DQKVuhkFfOiVCxcz8RjYn6vczUiH3nLRLtu
	 754l/qLwqIrt0ssuAowmCYvJQRTtzPtZ9LQIdCGXnBX3USRkN2xtGc49heXTFxEn4elkx
	 ujESgLdsLbaVioxPeiozcikB4XFec0zkDlHrhxTXThh8LH0jRXA7b3Zdprq/+r1o8TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
	b=wbF4TmEvo/86gG7pYpSSkKCZHCgzgCUBAS1GqVILHid5gNLEZWBYRUoCx64jDQrJLp3Z
	 s+DlDwXVWe2rsCNWX+C8v7CcMebBCRejzC6RnXLtd2X0lmrrNXNo1iFGFpglUUCjhV8il
	 i2LaucvAB98NGLxnxGubivmtp8rDMCP45xsGxnlarYVWJgHqEsALML2AoHRyALJuqMQ46
	 BBqbttEjOIrg1JZMyte0YynoFh8Pl9UJCH2FOjWQ9lk797a7C0Bpiz2JaLy7NlwUfR/VZ
	 2auOEO4V+uHJMqIFueLjZLGydFpqCFo8zdL4bGdrnyhgHKa+qdyJq1L1pmGqy7slRPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWMKjz2f;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514FE606A32D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 20:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 514FE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWMKjz2f
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0f59a5fdaso186627b3.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739274; x=1794344074; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=xWMKjz2f24N7OKwl4uSDOvuxlNLn5Py1ca2wVzSkGeUL+AettLzhvVM0YhUWZD4dze
         PdI2V8dKw6JpN/yJahTam97guOJbvw9Z7BD7CcKiD+0HZtuy/19eQEuvvbnw77oKYu7x
         hyN3c79ZTgDEdWW24uy714LlOnwpl9GhZqgvF32VJYvOw/bh9l8y+b4mPEbtN6m6FDAo
         jh5Mdp1BNbAC752TteA7tevs3WR+eA41r30iAXlxRKFgw7WHrpCbqtRJp8wUXhdkZMzp
         gZSr4rgme9jkfa4P0NTFBoMPBtevKxdOqI8vtjQIEypl3vMbUYroG6wCF8m+y0vN8wwX
         r0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739274; x=1794344074;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/A80EODLCyXaaGfYKqpHl1AEtmb4ixEKWz6DBGz/WQs=;
        b=JxMG4UgIdW1/zHSHNM6MpbV8C0d0tcKk2Gxf1mUlmGJEfz5CSlh2GHf17SrsicFcNO
         z0pDhxhgwtn8oz7TKOkpKns1sb4RzSKskhrHDwvz2rxGwop4ie1rXq0Fva0QafxG2Nwn
         JKpQNYiO/IVrUfPTvMkf/HBv0fvc+UtPybFfRawAuYCW0SQ+cGQm3rllT63tej3IKcBp
         HMGkr9h4aaiArFxkdtuE7Au21VkXXyS4Zx85qwP9I+4O+9cHFbsEhlxPj/S05rmXO8Wu
         y2fUr9FTAPpvLOpjKBll/8Tonjb5daMFbHj6UgA4PWNDDCrLQhYdXqGUUwlIVut3Zb8e
         Gm+w==
X-Forwarded-Encrypted: i=1; AKwUvBxgiTjyc2rUNfnVwtGXtyQ34Ee6jiDXlexSQN3zBeDu20A9FxfKOXBD2avJBnNYEvOWSXxAFJNjzBs42g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OUSjXbEhytBQUIOWPnjlBaN7E2hhRCd1Z4UZRU/sgOdHgXswX
	Cw/bfuZpZeuvnKhNBhIl2I99VmlRKvv8SA0sShKW5afY01gBM9d50mLe
X-Gm-Gg: AYBFou1D2FJyWaH3b6IZRWJsqVxClo1WGqqmiAV6YJCKV+wOZD1ZoCbyX4rB5TGIyFy
	tm7PJDWPqvzamUFmAqWR1BzZWsOWRJrZ1VHJJ/Skc72yIKNDPE46hsNAGdQff7lwr6chwGPt8lu
	ikELDlTFG/Iom5AKkZ7pCWh5hPUvdjTYhfGtodDSK5x563pEig9HNXzb2p7vkoqKqKZDPxZzMCS
	7s3um3j2ym9+z6FqF1fAvynF+LssQmI1suQgJyRn/IzRi8w2wV0BNMc4S6/u6K2srEezUwW7ew3
	QCKYM4BM0zptkpt+MIqPECWawfpLKK7znUbr6hT6LAdo41lXn4nRmmRp6bCl0tD8e3htlCJnc3H
	j/yIU7SbHRJHh/lAXbPcKYZ+/z5yZmUpqsurYvif952jD8k9jHl0q+xjzM951A00geMLOf7w1BL
	EK+Wqfnw4XsNDoqKdf8EiArlaafGHXpTDJiDpmniLn44HXVCtrMMbrSUyyKKK/JAecosUFYMmeY
	LvJpZlI3w2HZ52plQ6UZAwjvkRkV7tZQyqSaXN275Rp5UbB5rYVdl6e0xFwZehAXrdv8QKfxqgB
	ZcR3aUibkpvxtGRYhSWs/cg+6mdc5BCeryW4rvqaVfkAG4JCgnN6BhvDdw==
X-Received: by 2002:a05:690c:4992:b0:8b0:e680:616a with SMTP id 00721157ae682-8b2b66f45dcmr112559257b3.24.1793739274317;
        Tue, 03 Nov 2026 12:54:34 -0800 (PST)
Received: from daniel-HP-Stream-Laptop-14 ([172.56.75.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm4805187b3.40.2026.11.03.12.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:54:33 -0800 (PST)
Date: Tue, 3 Nov 2026 15:54:29 -0500
From: Daniel West <daniel.west.dev@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: staging: media: sunxi: cedrus: spelling correction
Message-ID: <aupKBdon3N4Kpnkt@daniel-HP-Stream-Laptop-14>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct spelling in comment.

Signed-off-by: Daniel West <daniel.west.dev@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 780da4a8b5af..f57642c0d8fa 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -755,7 +755,7 @@ static int cedrus_h265_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	}
 	cedrus_write(dev, VE_DEC_H265_SCALING_LIST_CTRL0, reg);
 
-	/* Neightbor information address. */
+	/* Neighbor information address. */
 	reg = VE_DEC_H265_NEIGHBOR_INFO_ADDR_BASE(ctx->codec.h265.neighbor_info_buf_addr);
 	cedrus_write(dev, VE_DEC_H265_NEIGHBOR_INFO_ADDR, reg);
 
-- 
2.51.0

