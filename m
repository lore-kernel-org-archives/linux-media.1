Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313455;
	b=zMG3Wi1SP1pCOaG/QdAg7V/SKjaxgKVTSrI3BVAaR305xGZAh1h1Z6ALIHbLwUd+9PFJ
	 LjOK5I5nVVOc1WqJYbduwUu3oRFKYsMiuPXhrP0LFt+/djYxnGNG6d3WT9UdSPbzSjnhd
	 /pbojhNNZWPBjiVuV0/Hy/60iUds7WGvri3dQqMTOKGH3fO0q2GQFAVXIwyJc1HoRgX6g
	 XJBsLfm0PdfQMWevCEzP/0pntcP63lbtQw1YNMWWoT+B4xtIMalvjHDJy93TKuX1MoOvp
	 iXunvz5sBA54IfPjM8DaPA8PUgoXHbw5kqkFwEbmKwQu8iU8pBA7vWVBxt8rX7MiI/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Rt7rwZgRCYcjZmCk9F8bbKx3wnJH8epK/AJCfQqcRoo=;
	b=b9Bjv0e9C92KjhsCAN9uWythijkeD9DeI6rnLDZ2AJH5pQZJIeaxTCWjXCmfi7b+GxUP
	 4WZ0F887tk4g6WeRpxqovGsqWmHwJPaCM69cHn5NtBKOqVBs8PYb1iX6GagWoD2/ugrO5
	 VqocRR/B072MkZnpYP7aQm3cw+DGt5qQ4sPgQ7DUR0QP/CCHena//qzt1yJl5uI01YN7n
	 7GMTLqMfxraNOTuw50IbrBCVVKJYDCYeqUNqRb1iykwcMeJoNzXHAqdD2EiXNeO+MS3Bw
	 IhIJCSmCR7VM/tsfFy0HHt+R71TOkQWalCOofFgJnL615lteGk7TDbJUGDSwQMitQTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMDgTpVl;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C2A606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 02:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0C2A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMDgTpVl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1137469f8f.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 18:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313453; x=1795918253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rt7rwZgRCYcjZmCk9F8bbKx3wnJH8epK/AJCfQqcRoo=;
        b=EMDgTpVl19aJrdx1+76OBSOlyY6cUxXnVjMEuu+ZSf9r5G4sQboqFKGn5xVHzE46CC
         O7Ja6d1OfDFZbzEWSi9UZja19fpPz9A+NKVwlIaxKvfd8Zt9kiuhLtoH+tYsjE77naP6
         5YB+zDXFUAzjWmdAay3biZZZ6FnT30jNWfcyNXdF+l4lyuTt/1kFek93FsMjhn4DTF/6
         RlT4cXA1ISj4q5Jp+G7VTCcyNpz8GhDG8uUoDrlfOurIEi0efbVWgxIyuUXcpENCeX6k
         WxYa8lPHxpXTGc5Os+rR2bTKGA7UzcfC19bjU0v0l9kREGQdtDjdoO2exKoLCcrvD+5a
         1i3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313453; x=1795918253;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rt7rwZgRCYcjZmCk9F8bbKx3wnJH8epK/AJCfQqcRoo=;
        b=AAbos1V29JUMbfsl/gs2cXbDvmjZatHapk9Lsa2XKw2dI8tfWtnFMVCdhMrP6//fbq
         Br5YFeq0qnsllPLFn6QWqNtMMXny72OgHIFZ+o7R58AUvgt6zXYy80q2sNzzNpAsU4wS
         w6qHRHbQxiwwoePxs3x1cznK6nWlO3hVWonLAo8q4ZESVmTiCvRAU9E2NPnPW3KpGu3J
         G5MlOPIALZtS7AHXetHCaPPNanVKVU/hhkFXhgsMWGcywmvDmIXBJKzAszLvNwkrklIK
         8+B55xh0dIi23dr38sG+ZWL5BlOeagj4rQ2MsJFcXtGjzBqHFUZRlufWW4pgfMy2HeXD
         iteQ==
X-Gm-Message-State: APuU4Z8dMKeXSY/nRS5nMM+1IqwDvy8paTgFHgMr91jA+ESLzcikHMqc
	gyywrWMdgDQJQYpDcjRaPW6dHR0qJ+WEWWkbgaEz+8i+1+kEBZoId/+TZdH2k0vN/VA=
X-Gm-Gg: AZFdTZdk+wuzXWmYXoYHG3DKCJJuAUpMOwt2AzRDxeuUuu8+QMq6WCS41tVWy+r9G7g
	+jmtZOLxaml6xloTU/NsBCWMPqloJdGwS8fM4nRDV1iMPgQJb6a/FwV7/80W6MoT0ql8SpbT2BV
	vCrS06gONtxRwd1mY14prA6teOX5U89dmM3l0cnHfo1uZidjJUD916jenM95wcU+iWWZ1Ir4ZGe
	mYZdyj0nOdBcmpm58BLDXhU4u3xaHUW5H/eo5IBrfs1xFE6s3zStL6052QQ8mzrmTpBLz5c51Iy
	M9JCwl8giY58hxV7BooNWsyyYYka90RIwGBpdMBAY5+VoPFyXG7KLpUc70y/gMs4sUZ6VLi1ZJl
	iLbIWII518m3Glc9TMuuQTr5bglUu1cLmi2ZL7m6GHhmn1MEV6VIw/C/JpFoLTwmzAei7SHNN1U
	nQAmtInLM3VE3T5cvTE8nNHuVhpGqRfpI6Dp5bwOVdTy/3R3WuW0ShDzhArLJx/tXzmdz5otEd5
	FnU3s1L66bWr6JFQoO+MmddPkSK8V255iAiKxC5AQ1/rkd5MYgoQjmCa070WHKwRiW/HWE14jP+
	QmDKieBY71/FBZD2ohMt
X-Received: by 2002:a05:6000:220a:b0:4a2:edb3:5d45 with SMTP id ffacd0b85a97d-4abb4b84c8amr16484182f8f.41.1795313453164;
        Sat, 21 Nov 2026 18:10:53 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:52 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Subject: [PATCH 0/3] media: qcom: camss: Two routing fixes and one tidy-up
Date: Sun, 22 Nov 2026 02:10:47 +0000
Message-Id: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB0wg9jQqxQXJo7pFBpLxogg3
 t1olx+P/+2gnIQVntUOiVdRmWOBqSvw7yEGRhmLgRrqjCFCP3xVMc15kRhwko0VnXlYNzrbTtR
 AKX+J76GEr/5vze7Dfrmu4DhOeis2bncAAAA=
X-Change-ID: 20261122-camss-routing-fixes-b178bdb84f20
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=bod@kernel.org;
 h=from:subject:message-id; bh=cMnDYUL4opukNrol1StasRXxBSNWfB5Kp3VxUzSk2o0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8pUHcWbJEMMPNNAgqoCw7e5C83psmxbUfrO
 A/UeBJcJcGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKQAKCRAicTuzoY3I
 OlHWEACqI5ipgKoL8Nr1752wgSPh6lAw0iZ7ldpZi36ARTP9Y6ldeiNCDTeXtAWVLOTXN3IYRhc
 8o+HL2AlC5KeOBB2nz6bCDau7V5mTgXIxs56ibkfBjSkQa7W5fVh2XzYx13vptsuTiqz8tAv3OM
 8SybuqXAY5Gz1UUbRBGSEzASlUBQzFKsbx9CE0vO9GP/7cPE8iYAFeOeLY8FTI3OmCAmQIp+gpI
 q2ec76cDvcjncut6qMCa9QT15BsSx0/Nw461pfdSQEM4SFpwwsTwztY2pTa4SU10afE4ilY2Xwk
 iQv8H03BtZDwEXmfm7ZS0yPeVZqCduGXWUBRHsUxpPKoSuZUuQrImbUw2tuP4edC871CZzoJDYT
 Ytda8laTShdbqeAgEv1r0+niJHrm4ckAKX1hxS6dZ5GTYLP5AxYI5NgLhK0gQhnGwIiKnm9Gzhm
 I0RgaUc8XcbR2lGWjiR6kCb8QTCcICaENgoqeWEb+w2zkwme/q0xV9sbgIr48M1vJU3OJQKA18c
 ghYHOA8+ht2LTfqoTvof0Ttg1+TyIWnCEO5sPMC/fh2f0Hhq1peiPp3fBsW07/sZWLjwfxrMXpm
 0t74p9Jq6/E7uJcG525pL7aWhWL0G1uX1VYpCD6sYugaD9y8wdi1GAxxYD49g9AoTQirBM7HxP2
 1gzJ5dY/jCEN9iw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

This series lands late-enough in the kernel cycle and applies against the
camss-next branch staging to linux-media/next.

Link: https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/camss-next

First up a patch drops the declaration of CSID2 from x1e/Hamoa since this
CSID doesn't have a corresponding VFE it is entirely useless and violates
our 1:1 mapping between VFE and CSID. Since CSID2 routes nowhere there's no
reason to keep it around.

Second is a fix for a longstanding error in CAMSS which as stemmed from
the original development of post ISPIF devices. These devices have a 1:1
mapping between CSID and VFE so the mapping we have given to user-space
which declares each CSID as connecting to each VFE is just plain wrong on
these devices and has always been.

So the second patch addresses that longstanding issue but, I've been
holding off on fixing this for a while since I believed it might require
extensive surgery, but in the end its quite simple to do.

Finally the third patch is a tidy-up patch which inverts our current logic
of continuously adding new elements to the src_pad_code switch for new SoCs
filtering those SoCs down to a default: statement. In fact is is the old
SoCs which are the exceptional case so, just do the switch for the old and
the default for the new.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
Bryan O'Donoghue (3):
      media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
      media: qcom: camss: Fix CSID to VFE routing for non ISPIF platforms
      media: qcom: camss: vfe: Eliminate ever expanding src_pad_code switch logic

 drivers/media/platform/qcom/camss/camss-vfe.c | 20 +--------
 drivers/media/platform/qcom/camss/camss.c     | 59 ++++++++++-----------------
 2 files changed, 23 insertions(+), 56 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261122-camss-routing-fixes-b178bdb84f20

Best regards,
--  
---
bod

