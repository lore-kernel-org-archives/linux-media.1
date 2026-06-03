Received: from outbound0.mail.transip.nl (outbound0.mail.transip.nl [149.210.149.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B055389110;
	Wed,  3 Jun 2026 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.210.149.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465373; cv=none; b=j/EhrosghsjM5qadlzbqUJG1wLTGxQ0T2YpB18sibwl94v4hztpSqvAaqJoW0uHj3NdOFxaqCk9Md2q97vGhZXcRbQvdzj8RS0zza6bllwWkIchALnGfhSGziYrYf6lx6+P5xq3h2skIFI8MMmm2rcQqJJ4P6+FEsfwu/uDSWB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465373; c=relaxed/simple;
	bh=iXvQs4AN3rUeMt9Ho9js8UZUbevzGDdpfqJ5EQz8XyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mi18B+cY5atH1Pj5rNBNpTJdafGAHP5i7MTVjo/K0TgC1rQQpLt18JQeH8mitc5mglpYoOnu2+MKVrRy1dwP1/7ASMfAyC44zeAQE2/BAXFM8UAM1Q74RYbQjmWHP5Gj7qLGatEt30pMbxDGnGcfmNywM9RF7GcJ0tc1V9CYgnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=PFgNn0Oh; arc=none smtp.client-ip=149.210.149.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="PFgNn0Oh"
Received: from submission11.mail.transip.nl (unknown [10.103.8.162])
	by outbound0.mail.transip.nl (Postfix) with ESMTP id 4gVc6R4dXmzxPP2;
	Wed,  3 Jun 2026 07:42:39 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission11.mail.transip.nl (Postfix) with ESMTPA id 4gVc6R0f0mz3R3nyd;
	Wed,  3 Jun 2026 07:42:39 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Robert Foss <robert.foss@linaro.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 1/2] media: qcom: camss: vfe-17x: dispatch wm_done per write master
Date: Wed,  3 Jun 2026 07:42:37 +0200
Message-ID: <20260603054238.562902-2-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603054238.562902-1-github.com@herrie.org>
References: <20260603054238.562902-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission11.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780465359; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=xqixUj9Ym9uh3qKSXFFMMIZVPJrnOVe4k4hmF/4GljU=;
 b=PFgNn0OhVm+wOVjjNqjxaIxu+ljMxQ1gxfXlyu5VrVVKhPh3lcDlEvkfAwMxAu+GkWo7+0
 Xnj+Ly0KhkTeOu6X8Y7/NQYSPlYceiz+EX9T/Z//2nTpENk6ZYJVBYqB+Xyk5l7BalNkx9
 Hnknw2hetTiNKhBxhCq/a3iGYOe5iDDSj2ej0vwsPx0CcDzVr0YB49L+DpFdGRpN/XHWUv
 HCNL231S3SjCo4Hm8AERVA6BWMxr9cHtf6AVWmfPiBYWTjK1y+Mb8T8bVzimf1gTOQ9caP
 /I9LGvJmNQJWYrx+Cdg7fzrbZoov4H3HLwwnn7X46J+F2H1IZKQPtWRNW9xM8w==
X-Report-Abuse-To: abuse@transip.nl

The wm_done dispatch loop checks a constant BIT(9) inside the
per-write-master iteration:

  for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
          if (status0 & BIT(9))
                  if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
                          vfe->isr_ops.wm_done(vfe, wm);

BIT(9) is STATUS_0_IMAGE_MASTER_PING_PONG(1), so the outer check only
fires for write master 1. Any wm_done interrupt raised for a different
write master is dropped: the per-WM bit in vfe_bus_status[1] may be
set, but the gating status0 read does not match for that index and
isr_ops.wm_done() is never called. That stalls every video stream not
routed through WM 1.

Use the per-wm STATUS_0_IMAGE_MASTER_PING_PONG(wm) macro so the gate
tracks the loop iterator.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717b3b..3ad0c3be005f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -364,7 +364,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 			vfe->isr_ops.comp_done(vfe, i);
 
 	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
-		if (status0 & BIT(9))
+		if (status0 & STATUS_0_IMAGE_MASTER_PING_PONG(wm))
 			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
 				vfe->isr_ops.wm_done(vfe, wm);
 
-- 
2.43.0

