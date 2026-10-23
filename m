Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742215;
	b=fMhs/EHti3+6oI3qJT1vRnrZiJDt/BVg7POTb15CobJ8kfyUv2SvICc9P8/VD2wY0dpq
	 M5LKQXXT7R8pxYSxDATzxPMAE03t1ixncA9vQfnSB8AA+sok8LHCUy+YZOQMtD7ftdvmu
	 wC5Z/HPDsruYtSfVmx2l6CL3SFtyxDWMkDQnp5h5IODwldUy5gsKISrdycd/4UhFCetXf
	 WDbGD0ifegLgNrsWk8Oel2o90Bmv9utQSWHJXu7XeJXgQFKuxw64+G93sGmA3mIqRTWqB
	 /oy0Ras4DbMLGMCLQEiOiYTjLQIIUH7noxrGk82OQB2adZ7XhiMoC+xE3KxxVW0vVXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
	b=pRhtOZX4XvHPt8gTtkhH6MYganbK58AD1RDoAIGny2nWImRMKMf7HEom123Yq0TpY0g7
	 f4gExDrkv2wfUybUFTgptSLDPvutx+DNKD4FtsB3K5386j2t5/OtGG3/e4lwQIaprZ/9d
	 zX27BC+ZhZ49GT+/m9TX3taYghZWxkB2+7E7BkPcklFQQ3gTFyaEnsVhP3hkv7B7kRXIl
	 9MM1MfAuS7woFnhGbdQk7Ww8i55czXjY4HUmB1LOVMa/Qy6Gw/zhTIsUiB7jKp99yGCwZ
	 Bditejl6NNR440v2JHAM0uMhfqKYMxIL3IViuZ+yMVXQmEgOn3Hp6TNQzDEU+HjA17w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CEhtQnwc;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1998606A31A
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 07:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1998606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CEhtQnwc
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adc0fd0299so467538a91.3
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 00:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742214; x=1793347014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
        b=CEhtQnwcLLpbQFKTgW3RaayjQkWo13wFlap6gS11OuDaSwR8gtNYn/wgTFF4xZy6X9
         6qFTgURbGDCwgk3zo1DjZ1/mfFQ6rAyxaddO1Qmr80Df17Zr8UTtvEWuvrvZf9DwPHSE
         pD3fiBpSdES+ri/QJDZA8nDyw2wemkJvZqbgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742214; x=1793347014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDP6DNxZLMCCTvykxNYnugjrNL0G0a+2sCTH3kjJCeo=;
        b=Ohj8BAef79chX3ceL/O41g1fAKQix3Wpl7F+WU3MTxGJc1jerMbPjxwUYr4+IPvg/S
         L1I+GQPGZwy2G/KMgTU13LqF9ytii1RE3qSoS9Wpt4aiaeT/sztK1srSic7EvtmU/r7j
         Ur0ubsSu4dJ617BjbAlzrYQqzuS0QoDSwDFb+h5L3X4e0hFz4rF+23flnp+HjeRUJ2d1
         e4ohM5DtDCDZTmQ0CPyqKgZG7SLwffrwcfovsJM9JMKaT3VB3e1fBUNNxROfOXZ8uZSs
         80G6rauJY8jM2bnMgWygtFNVhcP7EuDaq7f9Ozhw7H+As2mfkcaAIPe+PN/yLxCBuLOw
         ss6A==
X-Forwarded-Encrypted: i=1; AKwUvBxaBo80JPrgXmDoxY91sAbh9ZsEdgAisxuqDyCP7GBUlvA/QxdNZoesdmspfYfU2Y4Xn0yyHrIhEleaag==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0I1YGAOZNfds/DKDQwlEryocGeIvQqKUSOFTU37PXqEWrnQ9Z
	knzK0d4Z/U46+BG95EiWwQNL35YjW0CO1LuKND6li56GPpyVKbZbpjz1WLr+OdDuFg==
X-Gm-Gg: AYBFou0I+6E/9CTz+ng8UhoemcDkd/aiJRRUXaWN6FimNSSQGGXfMEC+ot14jez9jWR
	u7sSJ1zpnEB0aeGoM43S+E0rG382G0wemj0KZnosfqhx+EDxHcyJCj8tX2GzotuGnyF99RMRU2C
	Dge+WMjABaiy6Mv3q2aSThdhyn24RAfjNK2itnMgkVu/JdsTO6G6+dv8tjc/Pbp9tjrLtu2EBIA
	bA+Qpgz7spRRbA6G6J8HGpqlS1mm10fJJwdqgGPIHznmRO230I76MVjjqDF+X2Kn/elSsn3x3j3
	9eeGh17xvBjDfVIpWUbrlri4/k5SoP7WZL+3Zidu7F7vBaIuBm0Ox+NWcRB8k8ObBT8lYd9l1a3
	uRtDwVL819gH2GHBKegtp7o2UsUCCDSCoNKEAiyYvbm3a6CKiZtePklxW/sv0wzsBssLtaxhOdi
	Dh1z8OdhuXvWQMCBiwcR9EGoaNTmdOQLyDLO+0eSX5TN5fHMyatZE5YpkJvQgWYAAJDlNDpSM6U
	TS4EqhDxvCN8AmtJOkech7Wo+c8QpCJyqnMZGZVlxX13ksIABZCBqSz9WvqJksjVcH2+lNprCGG
	YgxIgrAo/EHnGVYLwDUvFKuwavY6QQvXUqzwruw=
X-Received: by 2002:a17:90b:5246:b0:3ac:8fff:5a1b with SMTP id 98e67ed59e1d1-3adce7dd700mr1102279a91.34.1792742214339;
        Fri, 23 Oct 2026 00:56:54 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:53 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] media: mediatek: vcodec: Fix NULL source address handling in decoders
Date: Fri, 23 Oct 2026 15:55:18 +0800
Message-ID: <20261023075642.3671805-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
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

Both the stateful and the stateless decoder workers peek the source
buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
returning the buffer. The buffer stays at the head of the ready list, so
the same job is scheduled again and fails the same way. In the stateless
decoder the media request is also never completed.

The two fixes are split because they fix different commits, and the
stateless fix also has to complete the media request.

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.

Fei Shao (2):
  media: mediatek: vcodec: Return source buffer on NULL va in stateful
    decoder
  media: mediatek: vcodec: Complete request on NULL va in stateless
    decoder

 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.56.0.257.gf7497c7d27-goog

