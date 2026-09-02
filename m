Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669484446EC
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344874; cv=none; b=hp+4D0qXXApOy4hwkMB8uBB6OVjc26g8DSZM561OSPvRk10zxba0JW6TE+9Xgug1+0c1VtLFQHY8iTZJLak+VTXcnqs4DfXpRkIerIZdHD5Hq5po2CbYCmrtfFfjheI/oTjjc7uI7qOZa28EH2NhDd96mNTDO0+V2CxBQiW7qGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344874; c=relaxed/simple;
	bh=Ls1MablbFV0ErC85zSL5nmqgrt5QSFLM1KDHv5hpiio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=QvHFWLSLwSi6y5yBr/Xg2Bsq2aPf8dCHVD1gPAUdEYzgXfRZwW4U606PlLRt3qwq0+HacuoHXNJGN3+DDKWcVW+dfvLM6o4V+2b7gwzzP5oCEthy08RIRhJmF+i5+uW4HdCa15QbJj6K8w3qq9IHO9ivg+MGCfe77Zm+Z8JFslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GjTNBF67; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GjTNBF67"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a2015bbfceso15209401fa.1
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788344870; x=1788949670; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H7Qu96HauuGTNeqVUvgK9IUHIFdCd5tmEZ0/YWL02nY=;
        b=GjTNBF67y3+GmAKSkzmBbpVIa5zd5TpgYLFzhmQ89t4vF1XzaG2TTAzUimdTmiScJz
         edqgSndCV1XKAuzmPiblLv8wRX4GLMla3pAY2WtKowlbB4u7KDTCZ1rHp4HKvQVJ+np2
         za/bNKfk53HT/1LQ3fsU3oKPGKxeuxx6pTxkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344870; x=1788949670;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7Qu96HauuGTNeqVUvgK9IUHIFdCd5tmEZ0/YWL02nY=;
        b=WNfNc8kVrJjEk8TO5Q2wORpJner1eqxLlDnhqthcHV4hbLrwUtUO0KQIlYJC401Q8S
         gm/5u0q2UA6Zg+xC3an1ui4mGiy4O9qnzmhUYRYoW57fN5isjVY8uWbYBNbcmN+kMUEy
         dWhT0ld4uOPNmMy810H6SW61m47rvE/KQ4Qz9aBbUx6lKoB+FzNoryriJT8tP/KpfpVr
         1CQvfoM5gb6k/OYNtYs/TKkcbtw1FmWEN/u1guTxQQW318WBfar2QVJT/9sQWE/1PvpV
         UVuTL1tNzmQQtxlQeoD5dw9rJMPJJdwZC3UO/dH51RBZ5QCgR4grch5Os56LBc/iyBHa
         xY3Q==
X-Gm-Message-State: AFuF++lzPtRtqadysmt0K0FziNQwBfuVPRkcqrsRrMGIJ2Lj6xrTrABm
	zZLEN5ooMyIV0dIgWnT0cjTHB7r/yCXFgZ6jLu8pi+eGl55QSztjTHvmSXYZxs77Ug==
X-Gm-Gg: AYBFou0DeXZb2j4lnkiVoD7vf7BOwfyHWsua5Ku42DAWRtxiByJXP29MGZdmviqbTFI
	kzcc3a6tgxxg60iV3U3YBmA6FVeJ8qyqHUAw9kL9oD20pdYjFKsSTiuRcIllGppiSifZ4UNDB5U
	ss3GWcVyUIhgrGIR1p5MRDB1560xxihD7iRTinXdbgQtU+roLq7WSeVnwQpkFYciWlph05rjXlR
	W39OMTEMpgDLjXya4l6+RYtykaVxVbztAOItrolg4SO6+UXgxe7NL9BBTG1FnUAttcOkHqy57c6
	wcFMNLzMHOMN/iaXOeJz22EejJVic/XwlIhpBUOXLaeGVKMd+bfyKoJoWtYP4bagEKVHaYW8ZPb
	873JMG9j1Xhv0ZOL4hFKIhsXmCNvvvrS7B7C4u/IARf15nleF1IQGyxEUXOmDKnLOMOdQWIU80+
	Nl2b/RQSoEN6shoCsTOLV4xM22/FUF34Sv1lSeRr17YmR8t8L8m5VrwyF2HcvWdZ0drUJmAS35F
	ZtAZn47oxMF7/ORGuPEj203GVx2uviKvjRPqis=
X-Received: by 2002:a05:651c:198b:b0:3a1:958c:3a08 with SMTP id 38308e7fff4ca-3a3555744f2mr4324421fa.8.1788344869968;
        Wed, 02 Sep 2026 03:27:49 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8f0ef9sm4910841fa.5.2026.09.02.03.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:27:49 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 02 Sep 2026 10:27:41 +0000
Subject: [PATCH camorama 2/2] CONTRIBUTE: Add simple contribution
 instructions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-contribute-v1-2-a45d6e93efd1@chromium.org>
References: <20260902-contribute-v1-0-a45d6e93efd1@chromium.org>
In-Reply-To: <20260902-contribute-v1-0-a45d6e93efd1@chromium.org>
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

In the media summit we discussed the need of a special prefix for
userspace. This helps patchwork and media-ci.

Create a new file with a brief introductions on how to contribute and
make the `camorama` prefix official.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 .b4-config    |  3 +++
 CONTRIBUTE.md | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/.b4-config b/.b4-config
new file mode 100644
index 0000000..2a0772c
--- /dev/null
+++ b/.b4-config
@@ -0,0 +1,3 @@
+[b4]
+  send-series-cc = linux-media@vger.kernel.org
+  send-prefixes = camorama
diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
new file mode 100644
index 0000000..d8a8b3c
--- /dev/null
+++ b/CONTRIBUTE.md
@@ -0,0 +1,23 @@
+## Repository
+
+camorama official repository is hosted at https://git.linuxtv.org/camorama.git
+
+## Contributions
+
+Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
+using the prefix `[PATCH camorama]`. E.g:
+
+```
+git config set format.subjectPrefix "PATCH camorama"
+```
+
+## b4 config
+
+If you use b4[1] for your contributor workflow you can use these options:
+
+```
+git config set b4.send-series-cc linux-media@vger.kernel.org
+git config set b4.send-prefixes camorama
+```
+
+[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html

-- 
2.55.0.966.g6673acef38-goog

