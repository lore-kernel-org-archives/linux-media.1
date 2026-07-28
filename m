Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BA2F2914
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785206961; cv=none; b=A1rNpy5iBpYFHJ0mUBgZyBH1G7iZTbp5pfPi9wHyet24yk+2ysoj/cLWPlStN51hX8kBbXz6lCZwarCbuSKoFiP081KbY+O7fNC00CV8wbM3aJq5qNRcC4E8F5FhyWXfmqhB4VZQ0PhSKZWF3daNbw0te1h0pQ2YzmREip+lOAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785206961; c=relaxed/simple;
	bh=4s/5NQ0BfIjDLx6nsMQcUo1NGNPJIEOAUaykakbWfHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0kUwiaVQxy9CBAVml5tbFQ0UFDGa3FEWXwE27gEWzw8hz0rp9avoiRA1QkZZMbandh5QwFuCotNR9Mia2NiNPgOa8HPNzKuribzEeMxXChR+42aP5UrF/xnIkc6WGvO2VZF8aVS9K/971d5NoDXxzfZn0Do870ZG1cv+wJkZCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBXb1vTm; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBXb1vTm"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81ed2a06b9eso28977777b3.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 19:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785206959; x=1785811759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=;
        b=LBXb1vTmMqvc1t4vMHKbjM3sA8WgdNCNU4qNmXbKVHOZDBrnzpXbKHnQ22XDhVBm0g
         5j2crV7Ii8qgudDXvT2LxfN+HbRaBW8d+M7D1YqWMD/AEmdyoTgkLKyS0cs/G0hHfP3x
         vQ5LImFh4yjErJ+AvMKzvY7JCbzJYzZECy/V2w++jM412p89mo50DaEKA8/k3mNHEQ6g
         4bRXaQv2xKwaus/ayRUe39n30Qq0WgUvM0E9AQMGRAmUoNPKc+dBqYdSjzu+OAABUNLn
         FBIrdJ1eN88kmF6ah92mBwSxLY8krkGPBeAoBNZiivzgB0Y+AZD5VWQO1A9QaL9Xh3Um
         2lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785206959; x=1785811759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quHt3IGaKOPL78wv/QDtYvLCereMlp/accQxjxBXbGU=;
        b=aDj+z4VOqstzTTCMy13YfnpyM4bvMPjn4XbQA7BDjiMNLNrQ40x6DlhoymhfYQI0xO
         DsfolbgFpmybA2zqjj1Z0H1R1zZfd6IiOqBJ/ZYJRK/w+HjdSsQhAi6C62PnkS3ADaq8
         kcWP8+LfQ/PaI2GKS1SbGILWXWuow2UfU7SY/6SpeyKOSfDDh11Hb667/euSb8QX8KuR
         tLfgTAwgCc77gClSkKqmUDk28p1s/KQOAAlCqpv+OfrTWhtGFejQbHlkrwkzcudNUqhT
         rWHZXtTSLqHuhOs/zi055Vy1qeUQ5JP1Z0dnJYKuQBVpdOmV63/NgeCvy4KvV4iwkiph
         wK/A==
X-Gm-Message-State: AOJu0Yx8G6UyfcnWaeq8n06tSrWOWKL44ABoy7fnMj3nwxsn/tRU3kiy
	aBCcsy9A/h9AH+YV6fhfiAH6iJotAbXsfdwvILe/tzSGjLkzx8wzcaLp
X-Gm-Gg: AR+sD11RLZMEl3Wu3Blfq1NrxZ5sJOc6rEFE3k7Edx9Xg+jGavhkVeDWG1jRa0JkBSM
	QPFVTVzMYLWLHDMczmts36Ngry9d5sg1ZMxUqlp8UN2A1p+SD2PtUbpmg3qsMWfJ7NgvMHt6gqG
	XIY0T9f99qVBiQojjRqZJa6kKi8k/BFZ8SE9dhSGBWhRKkkQzxZkQeS7Dj/BLjLEpPV4apFpPTF
	z9cuVs7vgWJS4xUJj0Od9UpfkyGkiKJlPzAVKgOGeKixO94Hv26di5/KheKodVYqk5q/AYoxmD4
	m7+E7muguDEFWqQdYPgXFEtYgtP1juJa1I5JAPI0LvKFmHUKCsY7ywbV15jvjstck6MHC8i5FAK
	jikwVNJmqBbnAHgkKTDvhTlTttUclcal7n4U/SqKpGOcoVIcCkm7kzUM6VpR+wAhm5NL5StQcZ/
	2Stg3TaRbEnzWHK8J8YLr/MP72e27ewMYLsmaa
X-Received: by 2002:a05:690c:7244:b0:81e:d009:1956 with SMTP id 00721157ae682-81f991fa998mr2277897b3.12.1785206958757;
        Mon, 27 Jul 2026 19:49:18 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:722a:22a9:308b:2c35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f6579f462sm40974847b3.11.2026.07.27.19.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 19:49:18 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH v4 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR receiver
Date: Mon, 27 Jul 2026 22:49:12 -0400
Message-ID: <20260728024916.993224-1-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds support for the CIR receiver on the Allwinner
A523/T527/H728 family (sun55i).

Apologies for the hasty v3 respin.

Tested again on my X96Q Pro+ (H728) TV box with the Google TV remote that
came in the box (using NEC keymap). Was able to press buttons and
get readings from lirc / ir-keytable again.

Changes since v3:
- 1/4: picked up Krzysztof's Acked-by, no other changes
- 2/4: add /omit-if-no-ref/ and rename the PL11 node to
  r-ir-rx-pl-pin (Chen-Yu)
- 2/4: take the PI8 pinmux node from Andre's Avaota patch, named
  ir-rx-pi-pin (Chen-Yu). Added Co-developed-by for Andre, and
  his Reviewed-by is dropped, as the patch gained a hunk and a
  node rename.
- 4/4: drop the moved hunk. Andre stays the author, with a
  bracketed note for the move and my Signed-off-by added
  (Chen-Yu, Andre)

Based on v7.2-rc1.

v3: https://lore.kernel.org/linux-sunxi/20260722233604.3001063-1-utilityemal77@gmail.com/
v2: https://lore.kernel.org/linux-sunxi/20260722201717.2205609-1-utilityemal77@gmail.com/
v1: https://lore.kernel.org/linux-sunxi/20260702214750.3428694-1-utilityemal77@gmail.com/

Andre Przywara (1):
  arm64: dts: allwinner: a523: enable IR on the Avaota A1

Justin Suess (3):
  media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
  arm64: dts: allwinner: a523: add IR receiver nodes
  arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+

 .../media/allwinner,sun4i-a10-ir.yaml         |  8 +++--
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 36 +++++++++++++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  6 ++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   |  6 ++++
 4 files changed, 53 insertions(+), 3 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.54.0

